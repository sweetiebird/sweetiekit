//
//  NAVAudioOutputNode.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioOutputNode_h
#define NAVAudioOutputNode_h    

#include "NAVAudioIONode.h"

#define js_value_AVAudioOutputNode(x) js_value_wrapper(x, AVAudioOutputNode)
#define to_value_AVAudioOutputNode(x) to_value_wrapper(x, AVAudioOutputNode)
#define is_value_AVAudioOutputNode(x) is_value_wrapper(x, AVAudioOutputNode)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioOutputNode, AVAudioIONode);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioOutputNode);

#endif /* NAVAudioOutputNode_h */