//
//  NAVAudioUnitEQFilterParameters.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioUnitEQFilterParameters.h"

#define instancetype AVAudioUnitEQFilterParameters
#define js_value_instancetype js_value_AVAudioUnitEQFilterParameters

NAVAudioUnitEQFilterParameters::NAVAudioUnitEQFilterParameters() {}
NAVAudioUnitEQFilterParameters::~NAVAudioUnitEQFilterParameters() {}

JS_INIT_CLASS(AVAudioUnitEQFilterParameters, NSObject);
  JS_ASSIGN_PROTO_PROP(filterType);
  JS_ASSIGN_PROTO_PROP(frequency);
  JS_ASSIGN_PROTO_PROP(bandwidth);
  JS_ASSIGN_PROTO_PROP(gain);
  JS_ASSIGN_PROTO_PROP(bypass);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioUnitEQFilterParameters, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVAudioUnitEQFilterParameters, NSObject);

NAN_METHOD(NAVAudioUnitEQFilterParameters::New) {
  JS_RECONSTRUCT(AVAudioUnitEQFilterParameters);
  @autoreleasepool {
    AVAudioUnitEQFilterParameters* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioUnitEQFilterParameters *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioUnitEQFilterParameters *wrapper = new NAVAudioUnitEQFilterParameters();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioUnitEQFilterParameters::New: invalid arguments");
    }
  }
}

#include "NAVAudioUnitEQ.h"

NAN_GETTER(NAVAudioUnitEQFilterParameters::filterTypeGetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioUnitEQFilterType([self filterType]));
  }
}

NAN_SETTER(NAVAudioUnitEQFilterParameters::filterTypeSetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudioUnitEQFilterType, input);
    [self setFilterType: input];
  }
}

NAN_GETTER(NAVAudioUnitEQFilterParameters::frequencyGetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self frequency]));
  }
}

NAN_SETTER(NAVAudioUnitEQFilterParameters::frequencySetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setFrequency: input];
  }
}

NAN_GETTER(NAVAudioUnitEQFilterParameters::bandwidthGetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self bandwidth]));
  }
}

NAN_SETTER(NAVAudioUnitEQFilterParameters::bandwidthSetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setBandwidth: input];
  }
}

NAN_GETTER(NAVAudioUnitEQFilterParameters::gainGetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self gain]));
  }
}

NAN_SETTER(NAVAudioUnitEQFilterParameters::gainSetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setGain: input];
  }
}

NAN_GETTER(NAVAudioUnitEQFilterParameters::bypassGetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self bypass]));
  }
}

NAN_SETTER(NAVAudioUnitEQFilterParameters::bypassSetter) {
  JS_UNWRAP(AVAudioUnitEQFilterParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBypass: input];
  }
}

