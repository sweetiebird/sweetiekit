//
//  NAVAudioUnitEQ.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioUnitEQ.h"

#define instancetype AVAudioUnitEQ
#define js_value_instancetype js_value_AVAudioUnitEQ

NAVAudioUnitEQ::NAVAudioUnitEQ() {}
NAVAudioUnitEQ::~NAVAudioUnitEQ() {}

JS_INIT_CLASS(AVAudioUnitEQ, AVAudioUnitEffect);
  JS_ASSIGN_PROTO_METHOD(initWithNumberOfBands);
  JS_ASSIGN_PROTO_PROP_READONLY(bands);
  JS_ASSIGN_PROTO_PROP(globalGain);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioUnitEQ, AVAudioUnitEffect);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, AVAudioUnitEQFilterType) {
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeParametric, NSInteger); //         = 0,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeLowPass, NSInteger); //            = 1,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeHighPass, NSInteger); //           = 2,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeResonantLowPass, NSInteger); //    = 3,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeResonantHighPass, NSInteger); //   = 4,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeBandPass, NSInteger); //           = 5,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeBandStop, NSInteger); //           = 6,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeLowShelf, NSInteger); //           = 7,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeHighShelf, NSInteger); //          = 8,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeResonantLowShelf, NSInteger); //   = 9,
    JS_ASSIGN_ENUM(AVAudioUnitEQFilterTypeResonantHighShelf, NSInteger); //  = 10,
  //} NS_ENUM_AVAILABLE(10_10, 8_0);

JS_INIT_CLASS_END(AVAudioUnitEQ, AVAudioUnitEffect);

NAN_METHOD(NAVAudioUnitEQ::New) {
  JS_RECONSTRUCT(AVAudioUnitEQ);
  @autoreleasepool {
    AVAudioUnitEQ* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioUnitEQ *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioUnitEQ alloc] init];
    }
    if (self) {
      NAVAudioUnitEQ *wrapper = new NAVAudioUnitEQ();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioUnitEQ::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVAudioUnitEQ::initWithNumberOfBands) {
  JS_UNWRAP_OR_ALLOC(AVAudioUnitEQ, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, numberOfBands);
    JS_SET_RETURN(js_value_instancetype([self initWithNumberOfBands: numberOfBands]));
  }
}

NAN_GETTER(NAVAudioUnitEQ::bandsGetter) {
  JS_UNWRAP(AVAudioUnitEQ, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioUnitEQFilterParameters*>([self bands]));
  }
}

NAN_GETTER(NAVAudioUnitEQ::globalGainGetter) {
  JS_UNWRAP(AVAudioUnitEQ, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self globalGain]));
  }
}

NAN_SETTER(NAVAudioUnitEQ::globalGainSetter) {
  JS_UNWRAP(AVAudioUnitEQ, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setGlobalGain: input];
  }
}
