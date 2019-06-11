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

JS_WRAP_CLASS(AVAudioCompressedBuffer, AVAudioBuffer);
  JS_STATIC_METHOD(initWithFormatPacketCapacityMaximumPacketSize);
  JS_STATIC_METHOD(initWithFormatPacketCapacity);
  JS_PROP_READONLY(packetCapacity);
  JS_PROP(packetCount);
  JS_PROP_READONLY(maximumPacketSize);
  JS_PROP_READONLY(data);
  JS_PROP_READONLY(byteCapacity);
  JS_PROP(byteLength);
  JS_PROP_READONLY(packetDescriptions);
JS_WRAP_CLASS_END(AVAudioCompressedBuffer);

#endif /* NAVAudioCompressedBuffer_h */
