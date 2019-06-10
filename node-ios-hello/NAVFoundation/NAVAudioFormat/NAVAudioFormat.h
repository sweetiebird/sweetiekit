//
//  NAVAudioFormat.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioFormat_h
#define NAVAudioFormat_h    

#include "NNSObject.h"

#define js_value_AVAudioFormat(x) js_value_wrapper(x, AVAudioFormat)
#define to_value_AVAudioFormat(x) to_value_wrapper(x, AVAudioFormat)
#define is_value_AVAudioFormat(x) is_value_wrapper(x, AVAudioFormat)

#define js_value_AVAudioCommonFormat(x) JS_ENUM(AVAudioCommonFormat, NSInteger, x)
#define to_value_AVAudioCommonFormat(x) TO_ENUM(AVAudioCommonFormat, NSInteger, x)
#define is_value_AVAudioCommonFormat(x) IS_ENUM(AVAudioCommonFormat, NSInteger, x)

Local<Value> js_value_AudioStreamBasicDescription(const AudioStreamBasicDescription* value);
AudioStreamBasicDescription to_value_AudioStreamBasicDescription(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_AudioStreamBasicDescription(Local<Value> value);

JS_WRAP_CLASS(AVAudioFormat, NSObject);
  JS_STATIC_METHOD(initWithStreamDescription);
  JS_STATIC_METHOD(initWithStreamDescriptionChannelLayout);
  JS_STATIC_METHOD(initStandardFormatWithSampleRateChannels);
  JS_STATIC_METHOD(initStandardFormatWithSampleRateChannelLayout);
  JS_STATIC_METHOD(initWithCommonFormatSampleRateChannelsInterleaved);
  JS_STATIC_METHOD(initWithCommonFormatSampleRateInterleavedChannelLayout);
  JS_STATIC_METHOD(initWithSettings);
  JS_STATIC_METHOD(initWithCMAudioFormatDescription);
  JS_METHOD(isEqual);
  JS_PROP_READONLY(isStandard);
  JS_PROP_READONLY(commonFormat);
  JS_PROP_READONLY(channelCount);
  JS_PROP_READONLY(sampleRate);
  JS_PROP_READONLY(isInterleaved);
  JS_PROP_READONLY(streamDescription);
  JS_PROP_READONLY(channelLayout);
  JS_PROP(magicCookie);
  JS_PROP_READONLY(settings);
  JS_PROP_READONLY(formatDescription);
JS_WRAP_CLASS_END(AVAudioFormat);

#endif /* NAVAudioFormat_h */
