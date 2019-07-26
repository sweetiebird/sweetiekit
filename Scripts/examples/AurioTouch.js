const SweetieKit = process._linkedBinding('sweetiekit');

const colors = require('./colors');

const {
  UIView,
  AVAudioPlayer,
  AVAudioSession,
  UIButton,
  NSBundle,
  NSURL,
} = SweetieKit;


radianToDegree = (x) => (x * 180.0 / Math.PI);

ComplexNumber = class ComplexNumber {
  /**
   * z = re + im * i
   * z = radius * e^(i * phase)
   *
   * @param {number} [re]
   * @param {number} [im]
   */
  constructor(r = 0, i = 0) {
    if (typeof r === 'object') {
      const { re = 0, im = 0 } = r;
      this.re = re;
      this.im = im;
    } else {
      this.re = r;
      this.im = i;
    }
  }

  absSq() {
    return this.re * this.re + this.im * this.im;
  }

  abs() {
    return Math.sqrt(this.absSq());
  }

  /**
   * @param {ComplexNumber|number} addend
   * @return {ComplexNumber}
   */
  add(addend) {
    // Make sure we're dealing with complex number.
    const complexAddend = this.toComplexNumber(addend);

    return new ComplexNumber({
      re: this.re + complexAddend.re,
      im: this.im + complexAddend.im,
    });
  }

  /**
   * @param {ComplexNumber|number} subtrahend
   * @return {ComplexNumber}
   */
  subtract(subtrahend) {
    // Make sure we're dealing with complex number.
    const complexSubtrahend = this.toComplexNumber(subtrahend);

    return new ComplexNumber({
      re: this.re - complexSubtrahend.re,
      im: this.im - complexSubtrahend.im,
    });
  }

  /**
   * @param {ComplexNumber|number} multiplicand
   * @return {ComplexNumber}
   */
  multiply(multiplicand) {
    // Make sure we're dealing with complex number.
    const complexMultiplicand = this.toComplexNumber(multiplicand);

    return new ComplexNumber({
      re: this.re * complexMultiplicand.re - this.im * complexMultiplicand.im,
      im: this.re * complexMultiplicand.im + this.im * complexMultiplicand.re,
    });
  }

  /**
   * @param {ComplexNumber|number} divider
   * @return {ComplexNumber}
   */
  divide(divider) {
    // Make sure we're dealing with complex number.
    const complexDivider = this.toComplexNumber(divider);

    // Get divider conjugate.
    const dividerConjugate = this.conjugate(complexDivider);

    // Multiply dividend by divider's conjugate.
    const finalDivident = this.multiply(dividerConjugate);

    // Calculating final divider using formula (a + bi)(a − bi) = a^2 + b^2
    const finalDivider = (complexDivider.re ** 2) + (complexDivider.im ** 2);

    return new ComplexNumber({
      re: finalDivident.re / finalDivider,
      im: finalDivident.im / finalDivider,
    });
  }

  /**
   * @param {ComplexNumber|number} number
   */
  conjugate(number) {
    // Make sure we're dealing with complex number.
    const complexNumber = this.toComplexNumber(number);

    return new ComplexNumber({
      re: complexNumber.re,
      im: -1 * complexNumber.im,
    });
  }

  /**
   * @return {number}
   */
  getRadius() {
    return Math.sqrt((this.re ** 2) + (this.im ** 2));
  }

  /**
   * @param {boolean} [inRadians]
   * @return {number}
   */
  getPhase(inRadians = true) {
    let phase = Math.atan(Math.abs(this.im) / Math.abs(this.re));

    if (this.re < 0 && this.im > 0) {
      phase = Math.PI - phase;
    } else if (this.re < 0 && this.im < 0) {
      phase = -(Math.PI - phase);
    } else if (this.re > 0 && this.im < 0) {
      phase = -phase;
    } else if (this.re === 0 && this.im > 0) {
      phase = Math.PI / 2;
    } else if (this.re === 0 && this.im < 0) {
      phase = -Math.PI / 2;
    } else if (this.re < 0 && this.im === 0) {
      phase = Math.PI;
    } else if (this.re > 0 && this.im === 0) {
      phase = 0;
    } else if (this.re === 0 && this.im === 0) {
      // More correctly would be to set 'indeterminate'.
      // But just for simplicity reasons let's set zero.
      phase = 0;
    }

    if (!inRadians) {
      phase = radianToDegree(phase);
    }

    return phase;
  }

  /**
   * @param {boolean} [inRadians]
   * @return {{radius: number, phase: number}}
   */
  getPolarForm(inRadians = true) {
    return {
      radius: this.getRadius(),
      phase: this.getPhase(inRadians),
    };
  }

  /**
   * Convert real numbers to complex number.
   * In case if complex number is provided then lefts it as is.
   *
   * @param {ComplexNumber|number} number
   * @return {ComplexNumber}
   */
  toComplexNumber(number) {
    if (number instanceof ComplexNumber) {
      return number;
    }

    return new ComplexNumber({ re: number });
  }
};


CLOSE_TO_ZERO_THRESHOLD = 1e-10;

lerp = (a, b, t) => {
  return (b - a)*t + a;
};

/**
 * Discrete Fourier Transform (DFT): time to frequencies.
 *
 * Time complexity: O(N^2)
 *
 * @param {number[]} inputAmplitudes - Input signal amplitudes over time (complex
 * numbers with real parts only).
 * @param {number} zeroThreshold - Threshold that is used to convert real and imaginary numbers
 * to zero in case if they are smaller then this.
 *
 * @return {ComplexNumber[]} - Array of complex number. Each of the number represents the frequency
 * or signal. All signals together will form input signal over discrete time periods. Each signal's
 * complex number has radius (amplitude) and phase (angle) in polar form that describes the signal.
 *
 * @see https://gist.github.com/anonymous/129d477ddb1c8025c9ac
 * @see https://betterexplained.com/articles/an-interactive-guide-to-the-fourier-transform/
 */
dft = function dft(inputAmplitudes, zeroThreshold = CLOSE_TO_ZERO_THRESHOLD) {
  const N = inputAmplitudes.length;
  const signals = [];

  // Go through every discrete frequency.
  for (let frequency = 0; frequency < N; frequency += 1) {
    // Compound signal at current frequency that will ultimately
    // take part in forming input amplitudes.
    let frequencySignal = new ComplexNumber();

    // Go through every discrete point in time.
    for (let timer = 0; timer < N; timer += 1) {
      const currentAmplitude = inputAmplitudes[timer];

      // Calculate rotation angle.
      const rotationAngle = -1 * (2 * Math.PI) * frequency * (timer / N);

      // Remember that e^ix = cos(x) + i * sin(x);
      const dataPointContribution = new ComplexNumber({
        re: Math.cos(rotationAngle),
        im: Math.sin(rotationAngle),
      }).multiply(currentAmplitude);

      // Add this data point's contribution.
      frequencySignal = frequencySignal.add(dataPointContribution);
    }

    // Close to zero? You're zero.
    if (Math.abs(frequencySignal.re) < zeroThreshold) {
      frequencySignal.re = 0;
    }

    if (Math.abs(frequencySignal.im) < zeroThreshold) {
      frequencySignal.im = 0;
    }

    // Average contribution at this frequency.
    // The 1/N factor is usually moved to the reverse transform (going from frequencies
    // back to time). This is allowed, though it would be nice to have 1/N in the forward
    // transform since it gives the actual sizes for the time spikes.
    frequencySignal = frequencySignal.divide(N);

    // Add current frequency signal to the list of compound signals.
    signals[frequency] = frequencySignal;
  }

  return signals;
};

dtft = function dft(inputAmplitudes, K = 4, zeroThreshold = CLOSE_TO_ZERO_THRESHOLD) {
  const N = inputAmplitudes.length;
  const signals = [];

  // Go through every discrete frequency.
  for (let frequency = 0; frequency < N; frequency += 1) {
    // Compound signal at current frequency that will ultimately
    // take part in forming input amplitudes.
    let frequencySignal = new ComplexNumber();

    // Go through every discrete point in time.
    for (let timer = 0; timer < N; timer += 1) {
      for (let k = 0; k < K; k += 1) {
        const amp1 = inputAmplitudes[timer];
        const amp2 = inputAmplitudes[(timer+1) % inputAmplitudes.length];
        const currentAmplitude = new ComplexNumber({
          re: lerp(amp1.re, amp2.re, k / K),
          im: lerp(amp1.im, amp2.im, k / K),
        });

        // Calculate rotation angle.
        const rotationAngle = -1 * (2 * Math.PI) * frequency * ((timer + k / K) / N);

        // Remember that e^ix = cos(x) + i * sin(x);
        const dataPointContribution = new ComplexNumber({
          re: Math.cos(rotationAngle),
          im: Math.sin(rotationAngle),
        }).multiply(currentAmplitude);

        // Add this data point's contribution.
        frequencySignal = frequencySignal.add(dataPointContribution);
      }
    }

    /*
    // Close to zero? You're zero.
    if (Math.abs(frequencySignal.re) < zeroThreshold) {
      frequencySignal.re = 0;
    }

    if (Math.abs(frequencySignal.im) < zeroThreshold) {
      frequencySignal.im = 0;
    }
    */

    // Average contribution at this frequency.
    // The 1/N factor is usually moved to the reverse transform (going from frequencies
    // back to time). This is allowed, though it would be nice to have 1/N in the forward
    // transform since it gives the actual sizes for the time spikes.
    frequencySignal = frequencySignal.divide(N * K);

    // Add current frequency signal to the list of compound signals.
    signals[frequency] = frequencySignal;
  }

  return signals;
};

bitLength = function bitLength(number) {
  let bitsCounter = 0;

  while ((1 << bitsCounter) <= number) {
    bitsCounter += 1;
  }

  return bitsCounter;
};


/**
 * Returns the number which is the flipped binary representation of input.
 *
 * @param {number} input
 * @param {number} bitsCount
 * @return {number}
 */
reverseBits = function reverseBits(input, bitsCount) {
  let reversedBits = 0;

  for (let bitIndex = 0; bitIndex < bitsCount; bitIndex += 1) {
    reversedBits *= 2;

    if (Math.floor(input / (1 << bitIndex)) % 2 === 1) {
      reversedBits += 1;
    }
  }

  return reversedBits;
};


/**
 * Returns the radix-2 fast fourier transform of the given array.
 * Optionally computes the radix-2 inverse fast fourier transform.
 *
 * @param {ComplexNumber[]} inputData
 * @param {boolean} [inverse]
 * @return {ComplexNumber[]}
 */
fft = function fft(inputData, inverse = false) {
  const bitsCount = bitLength(inputData.length - 1);
  const N = 1 << bitsCount;

  while (inputData.length < N) {
    inputData.push(new ComplexNumber());
  }

  const output = [];
  for (let dataSampleIndex = 0; dataSampleIndex < N; dataSampleIndex += 1) {
    output[dataSampleIndex] = inputData[reverseBits(dataSampleIndex, bitsCount)];
  }

  for (let blockLength = 2; blockLength <= N; blockLength *= 2) {
    const imaginarySign = inverse ? -1 : 1;
    const phaseStep = new ComplexNumber({
      re: Math.cos(2 * Math.PI / blockLength),
      im: imaginarySign * Math.sin(2 * Math.PI / blockLength),
    });

    for (let blockStart = 0; blockStart < N; blockStart += blockLength) {
      let phase = new ComplexNumber({ re: 1, im: 0 });

      for (let signalId = blockStart; signalId < (blockStart + blockLength / 2); signalId += 1) {
        const component = output[signalId + blockLength / 2].multiply(phase);

        const upd1 = output[signalId].add(component);
        const upd2 = output[signalId].subtract(component);

        output[signalId] = upd1;
        output[signalId + blockLength / 2] = upd2;

        phase = phase.multiply(phaseStep);
      }
    }
  }

  if (inverse) {
    for (let signalId = 0; signalId < N; signalId += 1) {
      output[signalId] /= N;
    }
  }

  return output;
};


f2c = function f2c(floats, offset = 0, count = (floats.length - offset)) {
  const r = new Array(count);
  for (let i = 0; i < count; i++) {
    r[i] = new ComplexNumber(floats[offset + i]);
  }
  return r;
};

BlackmanWindow = (x) => {
  const alpha = 0.16;
  const a0 = 0.5 * (1 - alpha);
  const a1 = 0.5;
  const a2 = 0.5 * alpha;

  const w = a0 - a1 * Math.cos(2 * Math.PI * x) + a2 * Math.cos(4 * Math.PI * x);
  return w;
};

C_dup = (
  p, a = p,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>0) - a_offset),
) => {
  let a_i = 1*p_n;
  let p_i = 2*p_n;
  while ((p_i -= 2) >= (a_i -= 1)) {
    const v = a[a_offset + a_i];
    p[p_offset + p_i + 0] = v;
    p[p_offset + p_i + 1] = v;
  }
  return p;
};

C_undup = (
  p, a = p,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>0) - a_offset),
) => {
  for (let i = 0; i < p_n; i++) {
    let a_i = 2*i;
    let p_i = 1*i;
    p[p_offset + p_i] = a[a_offset + a_i];
  }
  return p;
};

C_undup = (
  p, a = p,
  n = (a.length >> 1),
  p_offset = 0,
  a_offset = 0,
) => {
  for (let i = 0; i < n; i++) {
    let a_i = 2*i;
    let p_i = 1*i;
    p[p_offset + p_i] = a[a_offset + a_i];
  }
  return p;
};

C_add = (
  p, a, b,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>1) - a_offset),
  b_offset = 0, b_n = ((b.length>>1) - b_offset)
) => {
  for (let i = 0; i < p_n; i++) {
    const a_re = a[2*i + 0 + a_offset];
    const a_im = a[2*i + 1 + a_offset];
    const b_re = b[2*i + 0 + b_offset];
    const b_im = b[2*i + 1 + b_offset];
    const p_re = a_re + b_re;
    const p_im = a_im + b_im;
    p[2*i + 0 + p_offset] = p_re;
    p[2*i + 1 + p_offset] = p_im;
  }
  return p;
};

C_sub = (
  p, a, b,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>1) - a_offset),
  b_offset = 0, b_n = ((b.length>>1) - b_offset)
) => {
  for (let i = 0; i < p_n; i++) {
    const a_re = a[2*i + 0 + a_offset];
    const a_im = a[2*i + 1 + a_offset];
    const b_re = b[2*i + 0 + b_offset];
    const b_im = b[2*i + 1 + b_offset];
    const p_re = a_re - b_re;
    const p_im = a_im - b_im;
    p[2*i + 0 + p_offset] = p_re;
    p[2*i + 1 + p_offset] = p_im;
  }
  return p;
};

C_mul = (
  p, a, b,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>1) - a_offset),
  b_offset = 0, b_n = ((b.length>>1) - b_offset)
) => {
  for (let i = 0; i < p_n; i++) {
    const a_re = a[2*i + 0 + a_offset];
    const a_im = a[2*i + 1 + a_offset];
    const b_re = b[2*i + 0 + b_offset];
    const b_im = b[2*i + 1 + b_offset];
    const p_re = a_re * b_re - a_im * b_im;
    const p_im = a_re * b_im + a_im * b_re;
    p[2*i + 0 + p_offset] = p_re;
    p[2*i + 1 + p_offset] = p_im;
  }
  return p;
};

/*
C_div = (
  p, a, b,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>1) - a_offset),
  b_offset = 0, b_n = ((b.length>>1) - b_offset)
) => {
  for (let i = 0; i < p_n; i++) {
    const a_re = a[2*i + 0 + a_offset];
    const a_im = a[2*i + 1 + a_offset];
    const b_re = b[2*i + 0 + b_offset];
    const b_im = b[2*i + 1 + b_offset];
    const p_re = a_re - b_re;
    const p_im = a_im - b_im;
    p[2*i + 0 + p_offset] = p_re;
    p[2*i + 1 + p_offset] = p_im;
  }
  return p;
};

divide(divider) {
  // Make sure we're dealing with complex number.
  const complexDivider = this.toComplexNumber(divider);

  // Get divider conjugate.
  const dividerConjugate = this.conjugate(complexDivider);

  // Multiply dividend by divider's conjugate.
  const finalDivident = this.multiply(dividerConjugate);

  // Calculating final divider using formula (a + bi)(a − bi) = a^2 + b^2
  const finalDivider = (complexDivider.re ** 2) + (complexDivider.im ** 2);

  return new ComplexNumber({
    re: finalDivident.re / finalDivider,
    im: finalDivident.im / finalDivider,
  });
}
*/

C_abs = (
  p, a,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>1) - a_offset)
) => {
  for (let i = 0; i < p_n; i++) {
    const a_re = a[2*i + 0 + a_offset];
    const a_im = a[2*i + 1 + a_offset];
    const p_re = Math.sqrt(a_re * a_re + a_im * a_im);
    const p_im = 0;
    p[2*i + 0 + p_offset] = p_re;
    p[2*i + 1 + p_offset] = p_im;
  }
  return p;
};

C_db_k = 1.0 / 2048;
C_db_k = 1;

C_db = (
  p, a = p,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>1) - a_offset)
) => {
  for (let i = 0; i < p_n; i++) {
    const a_re = a[2*i + 0 + a_offset];
    const a_im = a[2*i + 1 + a_offset];
    const k = C_db_k; //lerp(1.0, 1.0 / p_n, C_db_k);
    const x = k * Math.sqrt(a_re * a_re + a_im * a_im);
    const p_re = linearToDecibels(x);
    const p_im = 0;
    p[2*i + 0 + p_offset] = p_re;
    p[2*i + 1 + p_offset] = p_im;
  }
  return p;
};

C_blk = (
  p, a = p,
  p_offset = 0, p_n = ((p.length>>1) - p_offset),
  a_offset = 0, a_n = ((a.length>>1) - a_offset)
) => {
  for (let i = 0; i < p_n; i++) {
    const k = BlackmanWindow(i / p_n);
    const a_re = a[2*i + 0 + a_offset];
    const a_im = a[2*i + 1 + a_offset];
    let p_re = k * a_re;
    let p_im = k * a_im;
    p[2*i + 0 + p_offset] = p_re;
    p[2*i + 1 + p_offset] = p_im;
  }
  return p;
};

C_dft = (p, a, offset = 0, n = (p.length>>1) - offset, zeroThreshold = CLOSE_TO_ZERO_THRESHOLD) => {

  // Go through every discrete frequency.
  for (let frequency = 0; frequency < n; frequency += 1) {
    // Compound signal at current frequency that will ultimately
    // take part in forming input amplitudes.
    let frequencySignal_re = 0;
    let frequencySignal_im = 0;

    // Go through every discrete point in time.
    for (let timer = 0; timer < n; timer += 1) {
      const currentAmplitude_re = a[2*timer + 0];
      const currentAmplitude_im = a[2*timer + 1];

      // Calculate rotation angle.
      const rotationAngle = -1 * (2 * Math.PI) * frequency * (timer / n);

      // Remember that e^ix = cos(x) + i * sin(x);
      let dataPointContribution_re = Math.cos(rotationAngle);
      let dataPointContribution_im = Math.sin(rotationAngle);
      {
        const a_re = dataPointContribution_re;
        const a_im = dataPointContribution_im;
        const b_re = currentAmplitude_re;
        const b_im = currentAmplitude_im;
        const p_re = a_re * b_re - a_im * b_im;
        const p_im = a_re * b_im + a_im * b_re;
        dataPointContribution_re = p_re;
        dataPointContribution_im = p_im;
      }

      // Add this data point's contribution.
      frequencySignal_re += dataPointContribution_re;
      frequencySignal_im += dataPointContribution_im;
    }

    // Close to zero? You're zero.
    /*
    if (Math.abs(frequencySignal_re) < zeroThreshold) {
      frequencySignal_re = 0;
    }
    if (Math.abs(frequencySignal_im) < zeroThreshold) {
      frequencySignal_im = 0;
    }
    */

    // Average contribution at this frequency.
    // The 1/n factor is usually moved to the reverse transform (going from frequencies
    // back to time). This is allowed, though it would be nice to have 1/n in the forward
    // transform since it gives the actual sizes for the time spikes.

    //frequencySignal = frequencySignal.divide(n);
    if (1)
    {
      const divider = n;
      // Make sure we're dealing with complex number.
      //const complexDivider = this.toComplexNumber(divider);
      const complexDivider_re = n;
      const complexDivider_im = 0;

      // Get divider conjugate.
      //const dividerConjugate = this.conjugate(complexDivider);
      const dividerConjugate_re = complexDivider_re;
      const dividerConjugate_im = -1 * complexDivider_im;

      // Multiply dividend by divider's conjugate.
      //const finalDivident = this.multiply(dividerConjugate);
      let finalDivident_re = 0;
      let finalDivident_im = 0;
      {
        const a_re = frequencySignal_re;
        const a_im = frequencySignal_im;
        const b_re = dividerConjugate_re;
        const b_im = dividerConjugate_im;
        const p_re = a_re * b_re - a_im * b_im;
        const p_im = a_re * b_im + a_im * b_re;
        finalDivident_re = p_re;
        finalDivident_im = p_im;
      }

      // Calculating final divider using formula (a + bi)(a − bi) = a^2 + b^2
      const finalDivider = (complexDivider_re * complexDivider_re) + (complexDivider_im * complexDivider_im);

      const p_re = finalDivident_re / finalDivider;
      const p_im = finalDivident_im / finalDivider;
      frequencySignal_re = p_re;
      frequencySignal_im = p_im;
    }

    // Add current frequency signal to the list of compound signals.
    p[2*frequency + 0] = frequencySignal_re;
    p[2*frequency + 1] = frequencySignal_im;
  }

  return p;
};


DefaultSmoothingTimeConstant = 0.8;
DefaultMinDecibels = -100;
DefaultMaxDecibels = -30;


IsZero = (x) => {
  return (x === 0);
};

linearToDecibels = (linear, minDecibels = -1000) => {
  // It's not possible to calculate decibels for a zero linear value since it would be -Inf.
  // -1000.0 dB represents a very tiny linear value in case we ever reach this case.
  /*
  if (IsZero(linear))
    return minDecibels;
    */

  const result = 20 * Math.log10(linear);
  if (isNaN(result)) {
    return minDecibels;
  }
  return result;
};

decibelsToLinear = (decibels) => {
  return Math.pow(10, 0.05 * decibels);
};

AurioTouch = typeof AurioTouch !== 'undefined' ? AurioTouch : function AurioTouch(opts = {
  bufferDuration: bufferDuration = 0.005,
  sampleRate: sampleRate = 44100,
  FFTSize: FFTSize = 2048,
}) {
  this.opts = {
    bufferDuration,
    sampleRate,
    FFTSize,
  };
};

AurioTouch.prototype.feedSamples = function (samples = this.samples, offset = 0, N = (samples.length - offset)) {
  const maxN = (1 << 15);
  const r = (this.r = (this.r || new Float32Array(maxN)));
  const a = (this.a = (this.a || new Float32Array(2*maxN)));
  const b = (this.b = (this.b || new Float32Array(2*maxN)));
  const p = (this.p = (this.p || new Float32Array(2*maxN)));
  const j = (this.j = (this.j || 0)) % maxN;
  for (let i = 0; i < N; i++) {
    a[j + i] = samples[offset + i];
  }
  this.j += N;
  return true;
};

AurioTouch.prototype.dft = function (M = this.opts.FFTSize, src = null) {
  const maxN = (1 << 15);
  const r = (this.r = (this.r || new Float32Array(maxN)));
  const a = src || (this.a = (this.a || new Float32Array(2*maxN)));
  const b = (this.b = (this.b || new Float32Array(2*maxN)));
  const p = (this.p = (this.p || new Float32Array(2*maxN)));
  let j = src ? 0 : ((this.j = ((this.j || 0)) % maxN) - M);
  if (j < 0) {
    j += maxN;
  }
  const N = M/2;
  for (let i = 0; i < N; i++) {
    const k = BlackmanWindow(i / N);
    b[2*i + 0] = k * a[2*(i + j) + 0];
    b[2*i + 1] = k * a[2*(i + j) + 1];
  }
  //C_dup(a, a, 0, N);
  //C_blk(a, a, 0, N);
  C_dft(p, b, 0, N);
  //C_db(p, p, 0, N);
  /*
  for (let i = 0; i < M; i++) {
    p[2*i + 1] = a[2*(i + j) + 0];
  }
  */
  //return r.map(x => -Math.floor(x));
  //return p;
  //C_undup(r, p, 0, N);
  return p;
};

AurioTouch.prototype.setCallback = function(M = this.opts.FFTSize, ms = 10000) {
  if (this.dftInterval) {
    clearInterval(this.dftInterval);
  };
  this.dftInterval = setInterval(() => {
    console.log(this.dft(M));
    //C_undup(r, p);
    //console.log(R=r.map(x => Math.floor(10000*decibelsToLinear(x))));
  }, ms);
};

AurioTouch.prototype.setupAudioSession = function() {
  const sessionInstance = AVAudioSession.sharedInstance();
  sessionInstance.setCategoryError(AVAudioSessionCategoryPlayAndRecord);
  sessionInstance.setPreferredIOBufferDurationError(this.opts.bufferDuration);
  sessionInstance.setPreferredSampleRateError(this.opts.sampleRate);
  sessionInstance.setActiveError(true);
  return sessionInstance;
};

AurioTouch.prototype.shutdownIOUnit = function() {
  if (this.rioUnit) {
    AudioOutputUnitStop(this.rioUnit);
    AudioUnitUninitialize(this.rioUnit);
    delete this.rioUnit;
  }
};

AurioTouch.prototype.setupIOUnit = function() {
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

  maxFramesPerSlice = this.opts.FFTSize;
  AudioUnitSetProperty(rioUnit, kAudioUnitProperty_MaximumFramesPerSlice, kAudioUnitScope_Global, 0, maxFramesPerSlice);
  maxFramesPerSlice = AudioUnitGetProperty(rioUnit, kAudioUnitProperty_MaximumFramesPerSlice, kAudioUnitScope_Global, 0, maxFramesPerSlice);

  AudioUnitSetProperty(rioUnit, kAudioUnitProperty_SetRenderCallback, kAudioUnitScope_Input, 0, (...args) => {
    return this.render.call(this, ...args);
  });

  AudioUnitInitialize(rioUnit);

  this.rioUnit = rioUnit;
};

AurioTouch.assert = function(cond, message = "assertion failed") {
  if (cond === false || cond == null) {
    throw new Error(message);
  }
  return cond;
};

AurioTouch.assertEqual = function(a, b, message = "assertion failed", cmp = ((x, y) => (x === y))) {
  if (!cmp(a, b)) {
    throw new Error(`${message} (${a} !== ${b})`);
  }
  return a;
};

AurioTouch.memZero = function(arrayBuffer, offset = 0, size = (arrayBuffer.byteLength - offset)) {
  const values = new Uint8ClampedArray(arrayBuffer, offset, size);
  for (let i = offset, n = size; i < n; i++) {
    values[i] = 0;
  }
  return arrayBuffer;
};

AurioTouch.prototype.render = function(ioActionFlags, inTimeStamp, inOutputBusNumber, inNumberFrames, ioData) {
  this.renderCount = this.renderCount || 0;
  this.renderCount++;
  if (!this.samples) {
    this.samples = new Float32Array(256);
  }
  AudioUnitRender(this.rioUnit, ioActionFlags, inTimeStamp, 1, inNumberFrames, ioData);
  const values = new Float32Array(ioData.mBuffers[0].mData, 0, inNumberFrames);
  const n = Math.min(inNumberFrames, this.samples.length);
  for (let i = 0; i < n; i++) {
    this.samples[i] = values[i];
  }
  this.feedSamples(this.samples, 0, n);

  // mute audio
  for (let i = 0; i < ioData.mNumberBuffers; i++) {
    AurioTouch.assertEqual(ioData.mBuffers[i].mDataByteSize, ioData.mBuffers[i].mData.byteLength, `ioData.mBuffers[${i}].mDataByteSize !== ioData.mBuffers[${i}].mData.byteLength`);
    AurioTouch.memZero(ioData.mBuffers[i].mData /*, 0, ioData.mBuffers[i].mDataByteSize*/);
  }
};

AurioTouch.prototype.start = function() {
  if (!this.rioUnit) {
    this.setupAudioSession();
    this.setupIOUnit();
  }
  if (this.rioUnit) {
    AudioOutputUnitStart(this.rioUnit);
  }
};

AurioTouch.prototype.stop = function() {
  if (this.rioUnit) {
    AudioOutputUnitStop(this.rioUnit);
  }
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
