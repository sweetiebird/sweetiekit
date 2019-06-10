//
//  NAVAudioCompressedBuffer.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioCompressedBuffer_h
#define NAVAudioCompressedBuffer_h    

#include "NAVAudioBuffer.h"

#define js_value_AVAudioCompressedBuffer(x) js_value_wrapper(x, AVAudioCompressedBuffer)
#define to_value_AVAudioCompressedBuffer(x) to_value_wrapper(x, AVAudioCompressedBuffer)
#define is_value_AVAudioCompressedBuffer(x) is_value_wrapper(x, AVAudioCompressedBuffer)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioCompressedBuffer, AVAudioBuffer);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioCompressedBuffer);

#endif /* NAVAudioCompressedBuffer_h */