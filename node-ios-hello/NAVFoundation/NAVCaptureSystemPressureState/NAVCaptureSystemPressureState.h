//
//  NAVCaptureSystemPressureState.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureSystemPressureState_h
#define NAVCaptureSystemPressureState_h    

#include "NNSObject.h"

#define js_value_AVCaptureSystemPressureLevel(x) JS_ENUM(AVCaptureSystemPressureLevel, NSString, x)
#define to_value_AVCaptureSystemPressureLevel(x) TO_ENUM(AVCaptureSystemPressureLevel, NSString, x)
#define is_value_AVCaptureSystemPressureLevel(x) IS_ENUM(AVCaptureSystemPressureLevel, NSString, x)

#define js_value_AVCaptureSystemPressureFactors(x) JS_OPTS(AVCaptureSystemPressureFactors, NSUInteger, x)
#define to_value_AVCaptureSystemPressureFactors(x) TO_OPTS(AVCaptureSystemPressureFactors, NSUInteger, x)
#define is_value_AVCaptureSystemPressureFactors(x) IS_OPTS(AVCaptureSystemPressureFactors, NSUInteger, x)

#define js_value_AVCaptureSystemPressureState(x) js_value_wrapper(x, AVCaptureSystemPressureState)
#define to_value_AVCaptureSystemPressureState(x) to_value_wrapper(x, AVCaptureSystemPressureState)
#define is_value_AVCaptureSystemPressureState(x) is_value_wrapper(x, AVCaptureSystemPressureState)

JS_WRAP_CLASS(AVCaptureSystemPressureState, NSObject);
  JS_PROP_READONLY(level);
  JS_PROP_READONLY(factors);
JS_WRAP_CLASS_END(AVCaptureSystemPressureState);

#endif /* NAVCaptureSystemPressureState_h */
