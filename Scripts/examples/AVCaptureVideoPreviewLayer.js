const SweetieKit = require('std:sweetiekit.node');

const {
  UIImage,
} = SweetieKit;

AVCaptureVideoPreviewLayer_make = async function AVCaptureVideoPreviewLayer_make(nav, demoVC) {
  view = demoVC.view;
  session = AVCaptureSession();

  frontCamera = AVCaptureDevice.defaultDeviceWithDeviceTypeMediaTypePosition(AVCaptureDeviceTypeBuiltInWideAngleCamera, AVMediaTypeVideo, AVCaptureDevicePositionFront);
  defaultCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo);
  captureDevice = defaultCamera;
  try {
    deviceInput = AVCaptureDeviceInput.deviceInputWithDeviceError(captureDevice);
  } catch (error) {
    console.warn(error.stack);
    return;
  }
  session.beginConfiguration();
  if (session.canAddInput(deviceInput)) {
    session.addInput(deviceInput);
  }
  output = AVCaptureVideoDataOutput();
  options = new Map();
  options.set(kCVPixelBufferPixelFormatTypeKey, kCVPixelFormatType_420YpCbCr8BiPlanarFullRange);
  output.videoSettings = options;
  output.alwaysDiscardsLateVideoFrames = true;
  if (session.canAddOutput(output)) {
    session.addOutput(output)
  }
  session.commitConfiguration();
  session.startRunning();

  demoVC.view.viewDidAppear = () => {
    layer = AVCaptureVideoPreviewLayer.layerWithSession(session);
    layer.frame = demoVC.view.bounds;
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    demoVC.view.layer.addSublayer(layer);
  }

  return undefined;
}

function make(...args) {
  return AVCaptureVideoPreviewLayer_make(...args);
}

module.exports = make;
