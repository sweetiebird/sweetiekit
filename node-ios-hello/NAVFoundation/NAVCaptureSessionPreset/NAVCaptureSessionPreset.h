//
//  NAVCaptureSessionPreset.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureSessionPreset_h
#define NAVCaptureSessionPreset_h    

#include "NNSObject.h"

#define js_value_AVCaptureSessionPreset(x) JS_ENUM(AVCaptureSessionPreset, NSString, x)
#define to_value_AVCaptureSessionPreset(x) TO_ENUM(AVCaptureSessionPreset, NSString, x)
#define is_value_AVCaptureSessionPreset(x) IS_ENUM(AVCaptureSessionPreset, NSString, x)

JS_WRAP_GLOBALS(AVCaptureSessionPreset);
JS_WRAP_GLOBALS_END(AVCaptureSessionPreset);

#endif /* NAVCaptureSessionPreset_h */
