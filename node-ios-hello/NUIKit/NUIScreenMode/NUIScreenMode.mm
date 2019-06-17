//
//  NUIScreenMode.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIScreenMode.h"

#define instancetype UIScreenMode
#define js_value_instancetype js_value_UIScreenMode

NUIScreenMode::NUIScreenMode() {}
NUIScreenMode::~NUIScreenMode() {}

JS_INIT_CLASS(UIScreenMode, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(size);
  JS_ASSIGN_PROTO_PROP_READONLY(pixelAspectRatio);
  // static members (ctor)
  JS_INIT_CTOR(UIScreenMode, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIScreenMode, NSObject);

NAN_METHOD(NUIScreenMode::New) {
  JS_RECONSTRUCT(UIScreenMode);
  @autoreleasepool {
    UIScreenMode* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIScreenMode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIScreenMode alloc] init];
    }
    if (self) {
      NUIScreenMode *wrapper = new NUIScreenMode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIScreenMode::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIScreenMode::sizeGetter) {
  JS_UNWRAP(UIScreenMode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self size]));
  }
}

NAN_GETTER(NUIScreenMode::pixelAspectRatioGetter) {
  JS_UNWRAP(UIScreenMode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self pixelAspectRatio]));
  }
}
