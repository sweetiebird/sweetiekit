//
//  NAVCaptureInput.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureInput_h
#define NAVCaptureInput_h    

#include "NNSObject.h"

#define js_value_AVCaptureInput(x) js_value_wrapper(x, AVCaptureInput)
#define to_value_AVCaptureInput(x) to_value_wrapper(x, AVCaptureInput)
#define is_value_AVCaptureInput(x) is_value_wrapper(x, AVCaptureInput)

JS_WRAP_CLASS(AVCaptureInput, NSObject);
  JS_PROP_READONLY(ports);
JS_WRAP_CLASS_END(AVCaptureInput);

#endif /* NAVCaptureInput_h */
