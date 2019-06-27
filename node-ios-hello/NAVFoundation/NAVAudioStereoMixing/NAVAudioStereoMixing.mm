//
//  NAVAudioStereoMixing.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioStereoMixing.h"

#define instancetype AVAudioStereoMixing
#define js_value_instancetype js_value_AVAudioStereoMixing

NAVAudioStereoMixing::NAVAudioStereoMixing() {}
NAVAudioStereoMixing::~NAVAudioStereoMixing() {}

JS_INIT_PROTOCOL(AVAudioStereoMixing, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioStereoMixing, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(AVAudioStereoMixing, NSObject);


NAN_METHOD(NAVAudioStereoMixing::New) {
  JS_RECONSTRUCT_PROTOCOL(AVAudioStereoMixing);
  @autoreleasepool {
    id<AVAudioStereoMixing> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<AVAudioStereoMixing>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<AVAudioStereoMixing> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], AVAudioStereoMixing, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[AVAudioStereoMixingType alloc] init];
    }
    if (self) {
      NAVAudioStereoMixing *wrapper = new NAVAudioStereoMixing();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioStereoMixing::New: invalid arguments");
    }
  }
}

@implementation AVAudioStereoMixingType
@end
