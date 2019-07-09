//
//  NAVAnimation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAnimation_h
#define NAVAnimation_h    

#include "NNSObject.h"

#define js_value_AVLayerVideoGravity(x) JS_ENUM(AVLayerVideoGravity, NSString, x)
#define to_value_AVLayerVideoGravity(x) TO_ENUM(AVLayerVideoGravity, NSString, x)
#define is_value_AVLayerVideoGravity(x) IS_ENUM(AVLayerVideoGravity, NSString, x)

JS_WRAP_GLOBALS(AVAnimation);
JS_WRAP_GLOBALS_END(AVAnimation);

#endif /* NAVAnimation_h */
