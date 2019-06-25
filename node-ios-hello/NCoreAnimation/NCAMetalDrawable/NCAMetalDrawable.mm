//
//  NCAMetalDrawable.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAMetalDrawable.h"

#if !TARGET_OS_SIMULATOR

#define instancetype CAMetalDrawable
#define js_value_instancetype js_value_CAMetalDrawable

NCAMetalDrawable::NCAMetalDrawable() {}
NCAMetalDrawable::~NCAMetalDrawable() {}

JS_INIT_PROTOCOL(CAMetalDrawable, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(texture);
  JS_ASSIGN_PROTO_PROP_READONLY(layer);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAMetalDrawable, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(CAMetalDrawable, NSObject);

NAN_METHOD(NCAMetalDrawable::New) {
  JS_RECONSTRUCT(CAMetalDrawable);
  @autoreleasepool {
    id<CAMetalDrawable> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<CAMetalDrawable>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<CAMetalDrawable> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], CAMetalDrawable, value);
      self = value;
    }
    if (self) {
      NCAMetalDrawable *wrapper = new NCAMetalDrawable();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAMetalDrawable::New: invalid arguments");
    }
  }
}

#include "NMTLTexture.h"

NAN_GETTER(NCAMetalDrawable::textureGetter) {
  JS_UNWRAP_PROTOCOL(CAMetalDrawable, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTexture([self texture]));
  }
}

#include "NCAMetalLayer.h"

NAN_GETTER(NCAMetalDrawable::layerGetter) {
  JS_UNWRAP_PROTOCOL(CAMetalDrawable, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAMetalLayer([self layer]));
  }
}

#endif
