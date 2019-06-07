//
//  NNSCoder.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSCoder_h
#define NNSCoder_h    

#include "NNSObject.h"

#define js_value_NSCoder(x) js_value_wrapper(x, NSCoder)
#define to_value_NSCoder(x) to_value_wrapper(x, NSCoder)
#define is_value_NSCoder(x) is_value_wrapper(x, NSCoder)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(NSCoder, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(NSCoder);

#endif /* NNSCoder_h */