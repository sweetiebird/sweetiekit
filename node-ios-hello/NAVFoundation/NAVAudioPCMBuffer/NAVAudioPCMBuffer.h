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

JS_WRAP_CLASS(AVAudioPCMBuffer, AVAudioBuffer);
  JS_STATIC_METHOD(initWithPCMFormatFrameCapacity);
  JS_PROP_READONLY(frameCapacity);
  JS_PROP(frameLength);
  JS_PROP_READONLY(stride);
  JS_PROP_READONLY(floatChannelData);
  JS_PROP_READONLY(int16ChannelData);
  JS_PROP_READONLY(int32ChannelData);
JS_WRAP_CLASS_END(AVAudioPCMBuffer);

#endif /* NAVAudioPCMBuffer_h */
