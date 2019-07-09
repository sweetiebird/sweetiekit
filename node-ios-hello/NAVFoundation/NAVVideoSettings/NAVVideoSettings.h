//
//  NAVVideoSettings.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVVideoSettings_h
#define NAVVideoSettings_h    

#include "NNSObject.h"

#define js_value_AVVideoCodecType(x) JS_ENUM(AVVideoCodecType, NSString, x)
#define to_value_AVVideoCodecType(x) TO_ENUM(AVVideoCodecType, NSString, x)
#define is_value_AVVideoCodecType(x) IS_ENUM(AVVideoCodecType, NSString, x)

#define js_value_AVVideoApertureMode(x) JS_ENUM(AVVideoApertureMode, NSString, x)
#define to_value_AVVideoApertureMode(x) TO_ENUM(AVVideoApertureMode, NSString, x)
#define is_value_AVVideoApertureMode(x) IS_ENUM(AVVideoApertureMode, NSString, x)

JS_WRAP_GLOBALS(AVVideoSettings);
JS_WRAP_GLOBALS_END(AVVideoSettings);

#endif /* NAVVideoSettings_h */
