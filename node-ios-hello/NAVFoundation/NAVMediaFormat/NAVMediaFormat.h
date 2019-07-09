//
//  NAVMediaFormat.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVMediaFormat_h
#define NAVMediaFormat_h    

#include "NNSObject.h"

#define js_value_AVMediaType(x) JS_ENUM(AVMediaType, NSString, x)
#define to_value_AVMediaType(x) TO_ENUM(AVMediaType, NSString, x)
#define is_value_AVMediaType(x) IS_ENUM(AVMediaType, NSString, x)

#define js_value_AVMediaCharacteristic(x) JS_ENUM(AVMediaCharacteristic, NSString, x)
#define to_value_AVMediaCharacteristic(x) TO_ENUM(AVMediaCharacteristic, NSString, x)
#define is_value_AVMediaCharacteristic(x) IS_ENUM(AVMediaCharacteristic, NSString, x)

#define js_value_AVFileType(x) JS_ENUM(AVFileType, NSString, x)
#define to_value_AVFileType(x) TO_ENUM(AVFileType, NSString, x)
#define is_value_AVFileType(x) IS_ENUM(AVFileType, NSString, x)

JS_WRAP_GLOBALS(AVMediaFormat);
JS_WRAP_GLOBALS_END(AVMediaFormat);

#endif /* NAVMediaFormat_h */
