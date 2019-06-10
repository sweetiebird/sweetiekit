//
//  NAVAudioNode.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioNode_h
#define NAVAudioNode_h    

#include "NNSObject.h"

#define js_value_AVAudioNode(x) js_value_wrapper(x, AVAudioNode)
#define to_value_AVAudioNode(x) to_value_wrapper(x, AVAudioNode)
#define is_value_AVAudioNode(x) is_value_wrapper(x, AVAudioNode)

#define js_value_AVAudioFramePosition js_value_int64_t
#define to_value_AVAudioFramePosition to_value_int64_t
#define is_value_AVAudioFramePosition is_value_int64_t

#define js_value_AVAudioFrameCount js_value_uint32_t
#define to_value_AVAudioFrameCount to_value_uint32_t
#define is_value_AVAudioFrameCount is_value_uint32_t

#define js_value_AVAudioPacketCount js_value_uint32_t
#define to_value_AVAudioPacketCount to_value_uint32_t
#define is_value_AVAudioPacketCount is_value_uint32_t

#define js_value_AVAudioChannelCount js_value_uint32_t
#define to_value_AVAudioChannelCount to_value_uint32_t
#define is_value_AVAudioChannelCount is_value_uint32_t

#define js_value_AVAudioNodeBus js_value_uint32_t
#define to_value_AVAudioNodeBus to_value_uint32_t
#define is_value_AVAudioNodeBus is_value_uint32_t

JS_WRAP_CLASS(AVAudioNode, NSObject);
  JS_METHOD(reset);
  JS_METHOD(inputFormatForBus);
  JS_METHOD(outputFormatForBus);
  JS_METHOD(nameForInputBus);
  JS_METHOD(nameForOutputBus);
  JS_METHOD(installTapOnBusBufferSizeFormatBlock);
  JS_METHOD(removeTapOnBus);
  JS_PROP_READONLY(engine);
  JS_PROP_READONLY(numberOfInputs);
  JS_PROP_READONLY(numberOfOutputs);
  JS_PROP_READONLY(lastRenderTime);
  JS_PROP_READONLY(AUAudioUnit);
  JS_PROP_READONLY(latency);
  JS_PROP_READONLY(outputPresentationLatency);
JS_WRAP_CLASS_END(AVAudioNode);

#endif /* NAVAudioNode_h */
