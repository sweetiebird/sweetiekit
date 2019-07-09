//
//  NAVMetadataFaceObject.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVMetadataFaceObject.h"

#define instancetype AVMetadataFaceObject
#define js_value_instancetype js_value_AVMetadataFaceObject

NAVMetadataFaceObject::NAVMetadataFaceObject() {}
NAVMetadataFaceObject::~NAVMetadataFaceObject() {}

JS_INIT_CLASS(AVMetadataFaceObject, AVMetadataObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVMetadataFaceObject, AVMetadataObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVMetadataFaceObject, AVMetadataObject);

NAN_METHOD(NAVMetadataFaceObject::New) {
  JS_RECONSTRUCT(AVMetadataFaceObject);
  @autoreleasepool {
    AVMetadataFaceObject* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVMetadataFaceObject *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVMetadataFaceObject *wrapper = new NAVMetadataFaceObject();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVMetadataFaceObject::New: invalid arguments");
    }
  }
}
