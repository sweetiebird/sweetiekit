//
//  NAVMetadataObject.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVMetadataObject.h"

#define instancetype AVMetadataObject
#define js_value_instancetype js_value_AVMetadataObject

NAVMetadataObject::NAVMetadataObject() {}
NAVMetadataObject::~NAVMetadataObject() {}

JS_INIT_CLASS(AVMetadataObject, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVMetadataObject, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVMetadataObject, NSObject);

NAN_METHOD(NAVMetadataObject::New) {
  JS_RECONSTRUCT(AVMetadataObject);
  @autoreleasepool {
    AVMetadataObject* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVMetadataObject *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVMetadataObject *wrapper = new NAVMetadataObject();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVMetadataObject::New: invalid arguments");
    }
  }
}
