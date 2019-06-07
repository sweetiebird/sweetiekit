//
//  NUIGraphicsImageRendererFormat.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIGraphicsImageRendererFormat_h
#define NUIGraphicsImageRendererFormat_h    

#include "NUIGraphicsRendererFormat.h"

#define js_value_UIGraphicsImageRendererFormat(x) js_value_wrapper(x, UIGraphicsImageRendererFormat)
#define to_value_UIGraphicsImageRendererFormat(x) to_value_wrapper(x, UIGraphicsImageRendererFormat)
#define is_value_UIGraphicsImageRendererFormat(x) is_value_wrapper(x, UIGraphicsImageRendererFormat)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(UIGraphicsImageRendererFormat, UIGraphicsRendererFormat);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(UIGraphicsImageRendererFormat);

#endif /* NUIGraphicsImageRendererFormat_h */