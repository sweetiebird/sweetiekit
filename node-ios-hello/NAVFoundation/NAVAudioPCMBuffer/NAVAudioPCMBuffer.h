//
//  NAVAudioPCMBuffer.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioPCMBuffer_h
#define NAVAudioPCMBuffer_h    

#include "NAVAudioBuffer.h"

#define js_value_AVAudioPCMBuffer(x) js_value_wrapper(x, AVAudioPCMBuffer)
#define to_value_AVAudioPCMBuffer(x) to_value_wrapper(x, AVAudioPCMBuffer)
#define is_value_AVAudioPCMBuffer(x) is_value_wrapper(x, AVAudioPCMBuffer)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioPCMBuffer, AVAudioBuffer);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioPCMBuffer);

#endif /* NAVAudioPCMBuffer_h */