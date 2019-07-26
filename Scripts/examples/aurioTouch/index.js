/*
f = (samples = AurioTouch.instance.audioController.samples) => { zz=[...samples]; V=zz.reduce((x,y) => (x+y)); V/=zz.length; return zz.map(x => 1000*(x-V)); }
//AurioTouch.instance.audioController.sampleBuffers.map(x => f(x.samples).join('\n')).join('\n')
samples=AurioTouch.instance.audioController.sampleBuffers.map(x => f(x.samples)).reduce((x, y) => [...x, ...y])
mFFTLength=2048;
mFFTNormFactor=1.0/mFFTLength;
mLog2N=Math.log2(mFFTLength);
kAdjust0DB = 1.5849e-13;
mSpectrumAnalysis=vDSP_create_fftsetup(mLog2N, kFFTRadix2);
mDspSplitComplex = {
  realp: new Float32Array(mFFTLength),
  imagp: new Float32Array(mFFTLength),
}
outFFTData = new Float32Array(mFFTLength);
__N = mFFTLength; __C=new Float32Array(samples.slice(__N,2*__N)); __IC=1; __Z = mDspSplitComplex; __IZ=1;

vDSP_ctoz(__C, __IC, __Z, __IZ, __N); __Z
vDSP_fft_zrip(mSpectrumAnalysis, mDspSplitComplex, 1, mLog2N, kFFTDirection_Forward)
vDSP_vsmul(mDspSplitComplex.realp, 1, new Float32Array([mFFTNormFactor]), mDspSplitComplex.realp, 1, mFFTLength);
vDSP_vsmul(mDspSplitComplex.imagp, 1, new Float32Array([mFFTNormFactor]), mDspSplitComplex.imagp, 1, mFFTLength);

//Zero out the nyquist value
mDspSplitComplex.imagp[0] = 0.0;

//Convert the fft data to dB
vDSP_zvmags(mDspSplitComplex, 1, outFFTData, 1, mFFTLength);

//In order to avoid taking log10 of zero, an adjusting factor is added in to make the minimum value equal -128dB
vDSP_vsadd(outFFTData, 1, new Float32Array([kAdjust0DB]), outFFTData, 1, mFFTLength);
vDSP_vdbcon(outFFTData, 1, new Float32Array([1]), outFFTData, 1, mFFTLength, 0);
*/

const SweetieKit = process._linkedBinding('sweetiekit');

const colors = require('../colors');

const {
  UIView,
  AVAudioPlayer,
  AVAudioSession,
  UIButton,
  NSBundle,
  NSURL,
} = SweetieKit;

AurioTouch_assert = function(cond, message = "assertion failed") {
  if (cond === false || cond == null) {
    throw new Error(message);
  }
  return cond;
};

AurioTouch_assertEqual = function(a, b, message = "assertion failed", cmp = ((x, y) => (x === y))) {
  if (!cmp(a, b)) {
    throw new Error(`${message} (${a} !== ${b})`);
  }
  return a;
};

AurioTouch_memZero = function(arrayBuffer, offset = 0, size = (arrayBuffer.byteLength - offset)) {
  const values = new Uint8ClampedArray(arrayBuffer, offset, size);
  for (let i = offset, n = size; i < n; i++) {
    values[i] = 0;
  }
  return arrayBuffer;
};

AudioController = typeof AudioController !== 'undefined' ? AudioController : function AudioController(...args) {
  this.init(...args);
}

AudioController.prototype.init = function(opts) {
  this.opts = opts;
  this.muteAudio = true;
  this.setupAudioChain();
}

AudioController.prototype.processSamples = function(inputs, values, offset = 0, n = (values.length - offset)) {
  if (!this.sampleBuffers) {
    this.sampleBuffers = [];
  }
  if (!this.samples || (this.samples.length < n)) {
    this.samples = new Float32Array(n);
  }
  this.samplesInputs = inputs;
  for (let i = 0; i < n; i++) {
    this.samples[i] = values[offset + i];
  }
  this.sampleBuffers.push({inputs, samples: this.samples});
  if (this.sampleBuffers.length > (1 + (44100 / 256))) {
    this.samples = this.sampleBuffers[0].samples;
    this.sampleBuffers.splice(0, 1);
  } else {
    delete this.samples;
  }
}

AudioController.prototype.render = function(ioActionFlags, inTimeStamp, inOutputBusNumber, inNumberFrames, ioData) {
  this.renderCount = this.renderCount || 0;
  this.renderCount++;

  AudioUnitRender(this._rioUnit, ioActionFlags, inTimeStamp, 1, inNumberFrames, ioData);

  const values = new Float32Array(ioData.mBuffers[0].mData, 0, inNumberFrames);
  this.processSamples({ioActionFlags, inTimeStamp, inOutputBusNumber, inNumberFrames}, values, 0, inNumberFrames);

  // mute audio
  for (let i = 0; i < ioData.mNumberBuffers; i++) {
    AurioTouch_assertEqual(ioData.mBuffers[i].mDataByteSize, ioData.mBuffers[i].mData.byteLength, `ioData.mBuffers[${i}].mDataByteSize !== ioData.mBuffers[${i}].mData.byteLength`);
    AurioTouch_memZero(ioData.mBuffers[i].mData /*, 0, ioData.mBuffers[i].mDataByteSize*/);
  }
};

AudioController.prototype.setupAudioChain = function() {
  this.setupAudioSession();
  this.setupIOUnit();
  this.createButtonPressedSound();
}

AudioController.prototype.startIOUnit = function() {
  AudioOutputUnitStart(this._rioUnit);
}

AudioController.prototype.stopIOUnit = function() {
  AudioOutputUnitStop(this._rioUnit);
}

AudioController.prototype.sessionSampleRate = function() {
  return AVAudioSession.sharedInstance().sampleRate;
}

AudioController.prototype.setupAudioSession = function() {
  const sessionInstance = AVAudioSession.sharedInstance();
  sessionInstance.setCategoryError(AVAudioSessionCategoryPlayAndRecord);
  sessionInstance.setPreferredIOBufferDurationError(this.opts.bufferDuration);
  sessionInstance.setPreferredSampleRateError(this.opts.sampleRate);
  sessionInstance.setActiveError(true);
  return sessionInstance;
};

AudioController.prototype.shutdownIOUnit = function() {
  if (this._rioUnit) {
    AudioOutputUnitStop(this._rioUnit);
    AudioUnitUninitialize(this._rioUnit);
    delete this._rioUnit;
  }
};

AudioController.prototype.setupIOUnit = function() {
  this.shutdownIOUnit();

  const desc = {
    componentType: kAudioUnitType_Output,
    componentSubType: kAudioUnitSubType_RemoteIO,
    componentManufacturer: kAudioUnitManufacturer_Apple,
    componentFlags: 0,
    componentFlagsMask: 0,
  };
  const comp = AudioComponentFindNext(null, desc);
  const rioUnit = AudioComponentInstanceNew(comp);

  AudioUnitSetProperty(rioUnit, kAudioOutputUnitProperty_EnableIO, kAudioUnitScope_Input, 1, 1);
  AudioUnitSetProperty(rioUnit, kAudioOutputUnitProperty_EnableIO, kAudioUnitScope_Output, 0, 1);

  const ioFormat = {
    SampleRate: this.opts.sampleRate,
    FormatID: kAudioFormatLinearPCM,
    FormatFlags: (kAudioFormatFlagsNativeEndian | kAudioFormatFlagIsPacked | kAudioFormatFlagIsFloat),
    BytesPerPacket: 4,
    FramesPerPacket: 1,
    BytesPerFrame: 4,
    ChannelsPerFrame: 1,
    BitsPerChannel: 4*8,
    Reserved: 0,
  };
  AudioUnitSetProperty(rioUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Output, 1, ioFormat);
  AudioUnitSetProperty(rioUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Input, 0, ioFormat);

  //this.maxFramesPerSlice = this.opts.FFTSize;
  this.maxFramesPerSlice = 256;
  AudioUnitSetProperty(rioUnit, kAudioUnitProperty_MaximumFramesPerSlice, kAudioUnitScope_Global, 0, this.maxFramesPerSlice);
  this.maxFramesPerSlice = AudioUnitGetProperty(rioUnit, kAudioUnitProperty_MaximumFramesPerSlice, kAudioUnitScope_Global, 0, this.maxFramesPerSlice);

  AudioUnitSetProperty(rioUnit, kAudioUnitProperty_SetRenderCallback, kAudioUnitScope_Input, 0, (...args) => {
    return this.render.call(this, ...args);
  });

  AudioUnitInitialize(rioUnit);

  this._rioUnit = rioUnit;
};

AudioController.prototype.createButtonPressedSound = function() {
}

AurioTouch = typeof AurioTouch !== 'undefined' ? AurioTouch : function AurioTouch(...args) {
  this.init(...args);
};

AurioTouch.prototype.init = function(opts = {
  bufferDuration: bufferDuration = 0.005,
  sampleRate: sampleRate = 44100,
  FFTSize: FFTSize = 2048,
}) {
  this.opts = {
    bufferDuration,
    sampleRate,
    FFTSize,
  };

  this.audioController = new AudioController(this.opts);
}

AurioTouch.prototype.start = function() {
  this.audioController.startIOUnit();
};

AurioTouch.prototype.stop = function() {
  this.audioController.stopIOUnit();
};

AurioTouch.make = async function(nav, demoVC) {
  if (!AurioTouch.instance) {
    AurioTouch.instance = new AurioTouch();
  };
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  bgFrame = { x: 0, y: 0, width: w, height: h };
  bgView = UIView(bgFrame);

  playBtn = UIButton({
    x: 12,
    y: 100,
    width: w - 24,
    height: 50,
  });

  playBtn.backgroundColor = colors.white;
  playBtn.showsTouchWhenHighlighted = true;
  playBtn.setTitleForState('LISTEN', UIControlStateNormal);
  playBtn.setTitleColorForState(colors.black, UIControlStateNormal);

  playBtn.addTargetActionForControlEvents(() => {
    AurioTouch.instance.start();
  }, UIControlEventTouchUpInside);

  demoVC.view.addSubview(playBtn);

  playBtn.viewWillDisappear = () => {
    AurioTouch.instance.stop();
  };

  nav.pushViewControllerAnimated(demoVC, true);
};

module.exports = async function make(...args) {
  return await AurioTouch.make(...args);
};

