//
//  NAVFrameRateRange.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVFrameRateRange.h"

#define instancetype AVFrameRateRange
#define js_value_instancetype js_value_AVFrameRateRange

NAVFrameRateRange::NAVFrameRateRange() {}
NAVFrameRateRange::~NAVFrameRateRange() {}

JS_INIT_CLASS(AVFrameRateRange, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(minFrameRate);
  JS_ASSIGN_PROTO_PROP_READONLY(maxFrameRate);
  JS_ASSIGN_PROTO_PROP_READONLY(maxFrameDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(minFrameDuration);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVFrameRateRange, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVFrameRateRange, NSObject);

NAN_METHOD(NAVFrameRateRange::New) {
  JS_RECONSTRUCT(AVFrameRateRange);
  @autoreleasepool {
    AVFrameRateRange* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVFrameRateRange *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVFrameRateRange *wrapper = new NAVFrameRateRange();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVFrameRateRange::New: invalid arguments");
    }
  }
}

#include "NMacTypes.h"

NAN_GETTER(NAVFrameRateRange::minFrameRateGetter) {
  JS_UNWRAP(AVFrameRateRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_Float64([self minFrameRate]));
  }
}

NAN_GETTER(NAVFrameRateRange::maxFrameRateGetter) {
  JS_UNWRAP(AVFrameRateRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_Float64([self maxFrameRate]));
  }
}

#include "NCMTime.h"

NAN_GETTER(NAVFrameRateRange::maxFrameDurationGetter) {
  JS_UNWRAP(AVFrameRateRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self maxFrameDuration]));
  }
}

NAN_GETTER(NAVFrameRateRange::minFrameDurationGetter) {
  JS_UNWRAP(AVFrameRateRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self minFrameDuration]));
  }
}
