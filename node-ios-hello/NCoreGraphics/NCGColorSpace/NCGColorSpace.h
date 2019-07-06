//
//  NCGColorSpace.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGColorSpace_h
#define NCGColorSpace_h    

#include "NNSObject.h"

#define js_value_CGColorSpaceRef(x) js_value_bridged(x, CGColorSpaceRef)
#define to_value_CGColorSpaceRef(x) to_value_bridged(x, CGColorSpaceRef)
#define is_value_CGColorSpaceRef(x) is_value_bridged(x, CGColorSpaceRef)

#define js_value_CGColorRenderingIntent(x) JS_ENUM(CGColorRenderingIntent, int32_t, x)
#define to_value_CGColorRenderingIntent(x) TO_ENUM(CGColorRenderingIntent, int32_t, x)
#define is_value_CGColorRenderingIntent(x) IS_ENUM(CGColorRenderingIntent, int32_t, x)

#define js_value_CGColorSpaceModel(x) JS_ENUM(CGColorSpaceModel, int32_t, x)
#define to_value_CGColorSpaceModel(x) TO_ENUM(CGColorSpaceModel, int32_t, x)
#define is_value_CGColorSpaceModel(x) IS_ENUM(CGColorSpaceModel, int32_t, x)

JS_WRAP_GLOBALS(CGColorSpace);
JS_WRAP_GLOBALS_END(CGColorSpace);

#endif /* NCGColorSpace_h */
