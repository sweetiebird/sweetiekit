//
//  NCoreAudioTypes.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCoreAudioTypes_h
#define NCoreAudioTypes_h    

#include "NNSObject.h"

#define js_value_CoreAudioTypes(x) js_value_wrapper(x, CoreAudioTypes)
#define to_value_CoreAudioTypes(x) to_value_wrapper(x, CoreAudioTypes)
#define is_value_CoreAudioTypes(x) is_value_wrapper(x, CoreAudioTypes)

Local<Value> js_value_AudioStreamPacketDescription(const AudioStreamPacketDescription* value);
AudioStreamPacketDescription to_value_AudioStreamPacketDescription(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_AudioStreamPacketDescription(Local<Value> value);

Local<Value> js_value_AudioStreamBasicDescription(const AudioStreamBasicDescription* value);
AudioStreamBasicDescription to_value_AudioStreamBasicDescription(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_AudioStreamBasicDescription(Local<Value> value);

Local<Value> js_value_AudioComponentDescription(const AudioComponentDescription& value);
AudioComponentDescription to_value_AudioComponentDescription(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_AudioComponentDescription(Local<Value> value);

#ifdef __OBJC__
@interface CoreAudioTypes : NSObject
@end
#endif

JS_WRAP_CLASS(CoreAudioTypes, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(CoreAudioTypes);

#endif /* NCoreAudioTypes_h */
