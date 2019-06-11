//
//  NAVAudioChannelLayout.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioChannelLayout_h
#define NAVAudioChannelLayout_h    

#include "NNSObject.h"

#define js_value_AVAudioChannelLayout(x) js_value_wrapper(x, AVAudioChannelLayout)
#define to_value_AVAudioChannelLayout(x) to_value_wrapper(x, AVAudioChannelLayout)
#define is_value_AVAudioChannelLayout(x) is_value_wrapper(x, AVAudioChannelLayout)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioChannelLayout, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioChannelLayout);

#endif /* NAVAudioChannelLayout_h */