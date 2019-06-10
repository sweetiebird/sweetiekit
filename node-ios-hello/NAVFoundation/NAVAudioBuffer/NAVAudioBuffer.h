//
//  NAVAudioBuffer.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioBuffer_h
#define NAVAudioBuffer_h    

#include "NNSObject.h"

#define js_value_AVAudioBuffer(x) js_value_wrapper(x, AVAudioBuffer)
#define to_value_AVAudioBuffer(x) to_value_wrapper(x, AVAudioBuffer)
#define is_value_AVAudioBuffer(x) is_value_wrapper(x, AVAudioBuffer)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioBuffer, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioBuffer);

#endif /* NAVAudioBuffer_h */