//
//  NAVAudioIONode.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioIONode_h
#define NAVAudioIONode_h    

#include "NAVAudioNode.h"

#define js_value_AVAudioIONode(x) js_value_wrapper(x, AVAudioIONode)
#define to_value_AVAudioIONode(x) to_value_wrapper(x, AVAudioIONode)
#define is_value_AVAudioIONode(x) is_value_wrapper(x, AVAudioIONode)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioIONode, AVAudioNode);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioIONode);

#endif /* NAVAudioIONode_h */