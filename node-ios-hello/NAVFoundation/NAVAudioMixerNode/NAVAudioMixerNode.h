//
//  NAVAudioMixerNode.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioMixerNode_h
#define NAVAudioMixerNode_h    

#include "NAVAudioIONode.h"

#define js_value_AVAudioMixerNode(x) js_value_wrapper(x, AVAudioMixerNode)
#define to_value_AVAudioMixerNode(x) to_value_wrapper(x, AVAudioMixerNode)
#define is_value_AVAudioMixerNode(x) is_value_wrapper(x, AVAudioMixerNode)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioMixerNode, AVAudioIONode);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioMixerNode);

#endif /* NAVAudioMixerNode_h */