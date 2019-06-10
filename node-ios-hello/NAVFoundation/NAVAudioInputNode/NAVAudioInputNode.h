//
//  NAVAudioInputNode.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioInputNode_h
#define NAVAudioInputNode_h    

#include "NAVAudioIONode.h"

#define js_value_AVAudioInputNode(x) js_value_wrapper(x, AVAudioInputNode)
#define to_value_AVAudioInputNode(x) to_value_wrapper(x, AVAudioInputNode)
#define is_value_AVAudioInputNode(x) is_value_wrapper(x, AVAudioInputNode)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioInputNode, AVAudioIONode);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioInputNode);

#endif /* NAVAudioInputNode_h */