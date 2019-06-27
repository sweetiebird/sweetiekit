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
  JS_ASSIGN_PROTO_PROP(renderingAlgorithm);
  JS_ASSIGN_PROTO_PROP(rate);
  JS_ASSIGN_PROTO_PROP(reverbBlend);
  JS_ASSIGN_PROTO_PROP(obstruction);
  JS_ASSIGN_PROTO_PROP(occlusion);
  JS_ASSIGN_PROTO_PROP(position);

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

#include "NAVAudioMixing.h"

NAN_GETTER(NAVAudio3DMixing::renderingAlgorithmGetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudio3DMixingRenderingAlgorithm([self renderingAlgorithm]));
  }
}

#include "NAVAudioMixing.h"

NAN_SETTER(NAVAudio3DMixing::renderingAlgorithmSetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudio3DMixingRenderingAlgorithm, input);
    [self setRenderingAlgorithm: input];
  }
}

NAN_GETTER(NAVAudio3DMixing::rateGetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self rate]));
  }
}

NAN_SETTER(NAVAudio3DMixing::rateSetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setRate: input];
  }
}

NAN_GETTER(NAVAudio3DMixing::reverbBlendGetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self reverbBlend]));
  }
}

NAN_SETTER(NAVAudio3DMixing::reverbBlendSetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setReverbBlend: input];
  }
}

NAN_GETTER(NAVAudio3DMixing::obstructionGetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self obstruction]));
  }
}

NAN_SETTER(NAVAudio3DMixing::obstructionSetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setObstruction: input];
  }
}

NAN_GETTER(NAVAudio3DMixing::occlusionGetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self occlusion]));
  }
}

NAN_SETTER(NAVAudio3DMixing::occlusionSetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setOcclusion: input];
  }
}

#include "NAVAudioTypes.h"

NAN_GETTER(NAVAudio3DMixing::positionGetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudio3DPoint([self position]));
  }
}

NAN_SETTER(NAVAudio3DMixing::positionSetter) {
  JS_UNWRAP_PROTOCOL(AVAudio3DMixing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudio3DPoint, input);
    [self setPosition: input];
  }
}

@implementation AVAudio3DMixingType
@end
