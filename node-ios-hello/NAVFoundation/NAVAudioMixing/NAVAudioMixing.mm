//
//  NAVAudioMixing.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioMixing.h"

#define instancetype AVAudioMixing
#define js_value_instancetype js_value_AVAudioMixing

NAVAudioMixing::NAVAudioMixing() {}
NAVAudioMixing::~NAVAudioMixing() {}

JS_INIT_PROTOCOL(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, AVAudio3DMixingRenderingAlgorithm) {
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmEqualPowerPanning, NSInteger); //       = 0,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmSphericalHead, NSInteger); //           = 1,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmHRTF, NSInteger); //                    = 2,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmSoundField, NSInteger); //              = 3,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmStereoPassThrough, NSInteger); //       = 5,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmHRTFHQ, NSInteger); //                  = 6
  //} NS_ENUM_AVAILABLE(10_10, 8_0);

JS_INIT_PROTOCOL_END(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);


NAN_METHOD(NAVAudioMixing::New) {
  JS_RECONSTRUCT_PROTOCOL(AVAudioMixing);
  @autoreleasepool {
    id<AVAudioMixing> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<AVAudioMixing>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<AVAudioMixing> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], AVAudioMixing, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[AVAudioMixingType alloc] init];
    }
    if (self) {
      NAVAudioMixing *wrapper = new NAVAudioMixing();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioMixing::New: invalid arguments");
    }
  }
}

@implementation AVAudioMixingType
@end
