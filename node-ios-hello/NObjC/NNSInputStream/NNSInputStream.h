//
//  NNSInputStream.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSInputStream_h
#define NNSInputStream_h    

#include "NNSStream.h"

#define js_value_NSInputStream(x) js_value_wrapper(x, NSInputStream)
#define to_value_NSInputStream(x) to_value_wrapper(x, NSInputStream)
#define is_value_NSInputStream(x) is_value_wrapper(x, NSInputStream)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(NSInputStream, NSStream);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(NSInputStream);

#endif /* NNSInputStream_h */