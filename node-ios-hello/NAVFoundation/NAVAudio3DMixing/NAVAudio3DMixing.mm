//
//  NAVAudio3DMixing.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudio3DMixing.h"

#define instancetype AVAudio3DMixing
#define js_value_instancetype js_value_AVAudio3DMixing

NAVAudio3DMixing::NAVAudio3DMixing() {}
NAVAudio3DMixing::~NAVAudio3DMixing() {}

JS_INIT_PROTOCOL(AVAudio3DMixing, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudio3DMixing, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(AVAudio3DMixing, NSObject);


NAN_METHOD(NAVAudio3DMixing::New) {
  JS_RECONSTRUCT_PROTOCOL(AVAudio3DMixing);
  @autoreleasepool {
    id<AVAudio3DMixing> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<AVAudio3DMixing>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<AVAudio3DMixing> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], AVAudio3DMixing, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[AVAudio3DMixingType alloc] init];
    }
    if (self) {
      NAVAudio3DMixing *wrapper = new NAVAudio3DMixing();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudio3DMixing::New: invalid arguments");
    }
  }
}

@implementation AVAudio3DMixingType
@end
