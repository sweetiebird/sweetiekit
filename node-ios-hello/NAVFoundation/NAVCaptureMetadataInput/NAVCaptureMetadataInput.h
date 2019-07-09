//
//  NAVCaptureMetadataInput.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureMetadataInput_h
#define NAVCaptureMetadataInput_h    

#include "NAVCaptureInput.h"

#define js_value_AVCaptureMetadataInput(x) js_value_wrapper(x, AVCaptureMetadataInput)
#define to_value_AVCaptureMetadataInput(x) to_value_wrapper(x, AVCaptureMetadataInput)
#define is_value_AVCaptureMetadataInput(x) is_value_wrapper(x, AVCaptureMetadataInput)

JS_WRAP_CLASS(AVCaptureMetadataInput, AVCaptureInput);
  JS_STATIC_METHOD(metadataInputWithFormatDescriptionClock);
  JS_METHOD(initWithFormatDescriptionClock);
  JS_METHOD(appendTimedMetadataGroupError);
JS_WRAP_CLASS_END(AVCaptureMetadataInput);

#endif /* NAVCaptureMetadataInput_h */
