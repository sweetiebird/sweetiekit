//
//  NAVCaptureMultiCamSession.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureMultiCamSession_h
#define NAVCaptureMultiCamSession_h    

#include "NAVCaptureSession.h"

#define js_value_AVCaptureMultiCamSession(x) js_value_wrapper(x, AVCaptureMultiCamSession)
#define to_value_AVCaptureMultiCamSession(x) to_value_wrapper(x, AVCaptureMultiCamSession)
#define is_value_AVCaptureMultiCamSession(x) is_value_wrapper(x, AVCaptureMultiCamSession)

JS_WRAP_CLASS(AVCaptureMultiCamSession, AVCaptureSession);
  JS_STATIC_PROP_READONLY(isMultiCamSupported);
  JS_PROP_READONLY(hardwareCost);
  JS_PROP_READONLY(systemPressureCost);
JS_WRAP_CLASS_END(AVCaptureMultiCamSession);

#endif /* NAVCaptureMultiCamSession_h */
