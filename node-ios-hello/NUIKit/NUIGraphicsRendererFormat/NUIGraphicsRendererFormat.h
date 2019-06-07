//
//  NUIGraphicsRendererFormat.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIGraphicsRendererFormat_h
#define NUIGraphicsRendererFormat_h    

#include "NNSObject.h"

#define js_value_UIGraphicsRendererFormat(x) js_value_wrapper(x, UIGraphicsRendererFormat)
#define to_value_UIGraphicsRendererFormat(x) to_value_wrapper(x, UIGraphicsRendererFormat)
#define is_value_UIGraphicsRendererFormat(x) is_value_wrapper(x, UIGraphicsRendererFormat)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(UIGraphicsRendererFormat, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(UIGraphicsRendererFormat);

#endif /* NUIGraphicsRendererFormat_h */