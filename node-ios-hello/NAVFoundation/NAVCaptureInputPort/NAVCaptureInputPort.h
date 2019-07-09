//
//  NAVCaptureInputPort.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureInputPort_h
#define NAVCaptureInputPort_h    

#include "NNSObject.h"

#define js_value_AVCaptureInputPort(x) js_value_wrapper(x, AVCaptureInputPort)
#define to_value_AVCaptureInputPort(x) to_value_wrapper(x, AVCaptureInputPort)
#define is_value_AVCaptureInputPort(x) is_value_wrapper(x, AVCaptureInputPort)

JS_WRAP_CLASS(AVCaptureInputPort, NSObject);
  JS_PROP_READONLY(input);
  JS_PROP_READONLY(mediaType);
  JS_PROP_READONLY(formatDescription);
  JS_PROP(isEnabled);
  JS_PROP_READONLY(clock);
  JS_PROP_READONLY(sourceDeviceType);
  JS_PROP_READONLY(sourceDevicePosition);
JS_WRAP_CLASS_END(AVCaptureInputPort);

#endif /* NAVCaptureInputPort_h */
