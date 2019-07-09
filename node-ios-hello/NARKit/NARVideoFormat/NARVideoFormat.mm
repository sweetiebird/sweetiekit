//
//  NARVideoFormat.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARVideoFormat.h"

#ifdef __IPHONEOS__

#define instancetype ARVideoFormat
#define js_value_instancetype js_value_ARVideoFormat

NARVideoFormat::NARVideoFormat() {}
NARVideoFormat::~NARVideoFormat() {}

JS_INIT_CLASS(ARVideoFormat, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(imageResolution);
  JS_ASSIGN_PROTO_PROP_READONLY(framesPerSecond);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARVideoFormat, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(ARVideoFormat, NSObject);

NAN_METHOD(NARVideoFormat::New) {
  JS_RECONSTRUCT(ARVideoFormat);
  @autoreleasepool {
    ARVideoFormat* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARVideoFormat *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARVideoFormat *wrapper = new NARVideoFormat();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARVideoFormat::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARVideoFormat::imageResolutionGetter) {
  JS_UNWRAP(ARVideoFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self imageResolution]));
  }
}

NAN_GETTER(NARVideoFormat::framesPerSecondGetter) {
  JS_UNWRAP(ARVideoFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self framesPerSecond]));
  }
}

#endif
