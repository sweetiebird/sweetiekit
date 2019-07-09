//
//  NAVCaptureScreenInput.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureScreenInput_h
#define NAVCaptureScreenInput_h    

#include "NAVCaptureInput.h"

#if TARGET_OS_MAC

#define js_value_AVCaptureScreenInput(x) js_value_wrapper(x, AVCaptureScreenInput)
#define to_value_AVCaptureScreenInput(x) to_value_wrapper(x, AVCaptureScreenInput)
#define is_value_AVCaptureScreenInput(x) is_value_wrapper(x, AVCaptureScreenInput)

JS_WRAP_CLASS(AVCaptureScreenInput, AVCaptureInput);
  JS_METHOD(initWithDisplayID);
  JS_PROP(minFrameDuration);
  JS_PROP(cropRect);
  JS_PROP(scaleFactor);
  JS_PROP(capturesMouseClicks);
  JS_PROP(capturesCursor);
  JS_PROP(removesDuplicateFrames);
JS_WRAP_CLASS_END(AVCaptureScreenInput);

#endif

#endif /* NAVCaptureScreenInput_h */
