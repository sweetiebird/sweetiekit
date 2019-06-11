//
//  NAUParameterNode.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAUParameterNode_h
#define NAUParameterNode_h    

#include "NNSObject.h"

#define js_value_AUParameterNode(x) js_value_wrapper(x, AUParameterNode)
#define to_value_AUParameterNode(x) to_value_wrapper(x, AUParameterNode)
#define is_value_AUParameterNode(x) is_value_wrapper(x, AUParameterNode)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AUParameterNode, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AUParameterNode);

#endif /* NAUParameterNode_h */