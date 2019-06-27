//
//  NAVAudioUnitReverb.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioUnitReverb.h"

#define instancetype AVAudioUnitReverb
#define js_value_instancetype js_value_AVAudioUnitReverb

NAVAudioUnitReverb::NAVAudioUnitReverb() {}
NAVAudioUnitReverb::~NAVAudioUnitReverb() {}

JS_INIT_CLASS(AVAudioUnitReverb, AVAudioUnitEffect);
  JS_ASSIGN_PROTO_METHOD(loadFactoryPreset);
  JS_ASSIGN_PROTO_PROP(wetDryMix);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioUnitReverb, AVAudioUnitEffect);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, AVAudioUnitReverbPreset) {
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetSmallRoom, NSInteger); //        = 0,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetMediumRoom, NSInteger); //       = 1,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetLargeRoom, NSInteger); //        = 2,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetMediumHall, NSInteger); //       = 3,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetLargeHall, NSInteger); //        = 4,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetPlate, NSInteger); //            = 5,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetMediumChamber, NSInteger); //    = 6,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetLargeChamber, NSInteger); //     = 7,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetCathedral, NSInteger); //        = 8,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetLargeRoom2, NSInteger); //       = 9,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetMediumHall2, NSInteger); //      = 10,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetMediumHall3, NSInteger); //      = 11,
    JS_ASSIGN_ENUM(AVAudioUnitReverbPresetLargeHall2, NSInteger); //       = 12
  //} NS_ENUM_AVAILABLE(10_10, 8_0);

JS_INIT_CLASS_END(AVAudioUnitReverb, AVAudioUnitEffect);

NAN_METHOD(NAVAudioUnitReverb::New) {
  JS_RECONSTRUCT(AVAudioUnitReverb);
  @autoreleasepool {
    AVAudioUnitReverb* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioUnitReverb *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioUnitReverb alloc] init];
    }
    if (self) {
      NAVAudioUnitReverb *wrapper = new NAVAudioUnitReverb();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioUnitReverb::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVAudioUnitReverb::loadFactoryPreset) {
  JS_UNWRAP(AVAudioUnitReverb, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioUnitReverbPreset, preset);
    [self loadFactoryPreset: preset];
  }
}

NAN_GETTER(NAVAudioUnitReverb::wetDryMixGetter) {
  JS_UNWRAP(AVAudioUnitReverb, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self wetDryMix]));
  }
}

NAN_SETTER(NAVAudioUnitReverb::wetDryMixSetter) {
  JS_UNWRAP(AVAudioUnitReverb, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setWetDryMix: input];
  }
}
