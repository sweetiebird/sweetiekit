//
//  NAVAudioUnit.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioUnit.h"

#define instancetype AVAudioUnit
#define js_value_instancetype js_value_AVAudioUnit

NAVAudioUnit::NAVAudioUnit() {}
NAVAudioUnit::~NAVAudioUnit() {}

JS_INIT_CLASS(AVAudioUnit, AVAudioNode);
  JS_ASSIGN_STATIC_METHOD(instantiateWithComponentDescriptionOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(loadAudioUnitPresetAtURLError);
  JS_ASSIGN_PROTO_PROP_READONLY(audioComponentDescription);
  JS_ASSIGN_PROTO_PROP_READONLY(audioUnit);
  JS_ASSIGN_PROTO_PROP_READONLY(AUAudioUnit);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(manufacturerName);
  JS_ASSIGN_PROTO_PROP_READONLY(version);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioUnit, AVAudioNode);
  // constant values (exports)
JS_INIT_CLASS_END(AVAudioUnit, AVAudioNode);

NAN_METHOD(NAVAudioUnit::New) {
  JS_RECONSTRUCT(AVAudioUnit);
  @autoreleasepool {
    AVAudioUnit* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioUnit *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioUnit alloc] init];
    }
    if (self) {
      NAVAudioUnit *wrapper = new NAVAudioUnit();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioUnit::New: invalid arguments");
    }
  }
}

#include "NNSError.h"
#include "NCoreAudioTypes.h"
#include "NAudioComponent.h"

NAN_METHOD(NAVAudioUnit::instantiateWithComponentDescriptionOptionsCompletionHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioComponentDescription, audioComponentDescription);
    declare_value(AudioComponentInstantiationOptions, options);
    declare_callback(completionHandler);
    [AVAudioUnit instantiateWithComponentDescription: audioComponentDescription options: options completionHandler:^(__kindof AVAudioUnit * _Nullable audioUnit, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NAVAudioUnit::instantiateWithComponentDescriptionOptionsCompletionHandler",
            js_value_AVAudioUnit(audioUnit),
            js_value_NSError(error));
        }
      });
    }];
  }
}

#include "NNSURL.h"

NAN_METHOD(NAVAudioUnit::loadAudioUnitPresetAtURLError) {
  JS_UNWRAP(AVAudioUnit, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self loadAudioUnitPresetAtURL: url error: &error]));
    js_panic_NSError(error);
  }
}

#include "NCoreAudioTypes.h"

NAN_GETTER(NAVAudioUnit::audioComponentDescriptionGetter) {
  JS_UNWRAP(AVAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AudioComponentDescription([self audioComponentDescription]));
  }
}

NAN_GETTER(NAVAudioUnit::audioUnitGetter) {
  JS_UNWRAP(AVAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AudioUnit([self audioUnit]));
    #endif
  }
}

#include "NAUAudioUnit.h"

NAN_GETTER(NAVAudioUnit::AUAudioUnitGetter) {
  JS_UNWRAP(AVAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioUnit([self AUAudioUnit]));
  }
}

NAN_GETTER(NAVAudioUnit::nameGetter) {
  JS_UNWRAP(AVAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NAVAudioUnit::manufacturerNameGetter) {
  JS_UNWRAP(AVAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self manufacturerName]));
  }
}

NAN_GETTER(NAVAudioUnit::versionGetter) {
  JS_UNWRAP(AVAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self version]));
  }
}

