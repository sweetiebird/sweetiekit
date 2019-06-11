//
//  NAUParameterGroup.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAUParameterGroup_h
#define NAUParameterGroup_h    

#include "NAUParameterNode.h"

#define js_value_AUParameterGroup(x) js_value_wrapper(x, AUParameterGroup)
#define to_value_AUParameterGroup(x) to_value_wrapper(x, AUParameterGroup)
#define is_value_AUParameterGroup(x) is_value_wrapper(x, AUParameterGroup)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AUParameterGroup, AUParameterNode);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AUParameterGroup);

#endif /* NAUParameterGroup_h */