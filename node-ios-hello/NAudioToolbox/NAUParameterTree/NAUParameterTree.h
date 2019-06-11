//
//  NAUParameterTree.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAUParameterTree_h
#define NAUParameterTree_h    

#include "NAUParameterGroup.h"

#define js_value_AUParameterTree(x) js_value_wrapper(x, AUParameterTree)
#define to_value_AUParameterTree(x) to_value_wrapper(x, AUParameterTree)
#define is_value_AUParameterTree(x) is_value_wrapper(x, AUParameterTree)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AUParameterTree, AUParameterGroup);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AUParameterTree);

#endif /* NAUParameterTree_h */