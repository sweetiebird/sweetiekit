//
//  NAVCaptureDeviceInput.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureDeviceInput_h
#define NAVCaptureDeviceInput_h    

#include "NAVCaptureInput.h"

#define js_value_AVCaptureDeviceInput(x) js_value_wrapper(x, AVCaptureDeviceInput)
#define to_value_AVCaptureDeviceInput(x) to_value_wrapper(x, AVCaptureDeviceInput)
#define is_value_AVCaptureDeviceInput(x) is_value_wrapper(x, AVCaptureDeviceInput)

JS_WRAP_CLASS(AVCaptureDeviceInput, AVCaptureInput);
  JS_STATIC_METHOD(deviceInputWithDeviceError);
  JS_METHOD(initWithDeviceError);
  JS_METHOD(portsWithMediaTypeSourceDeviceTypeSourceDevicePosition);
  JS_PROP_READONLY(device);
  JS_PROP(unifiedAutoExposureDefaultsEnabled);
  JS_PROP(videoMinFrameDurationOverride);
JS_WRAP_CLASS_END(AVCaptureDeviceInput);

#endif /* NAVCaptureDeviceInput_h */
