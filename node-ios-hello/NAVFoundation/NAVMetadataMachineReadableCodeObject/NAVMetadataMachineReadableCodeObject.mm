//
//  NAVMetadataMachineReadableCodeObject.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVMetadataMachineReadableCodeObject.h"

#define instancetype AVMetadataMachineReadableCodeObject
#define js_value_instancetype js_value_AVMetadataMachineReadableCodeObject

NAVMetadataMachineReadableCodeObject::NAVMetadataMachineReadableCodeObject() {}
NAVMetadataMachineReadableCodeObject::~NAVMetadataMachineReadableCodeObject() {}

JS_INIT_CLASS(AVMetadataMachineReadableCodeObject, AVMetadataObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVMetadataMachineReadableCodeObject, AVMetadataObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVMetadataMachineReadableCodeObject, AVMetadataObject);

NAN_METHOD(NAVMetadataMachineReadableCodeObject::New) {
  JS_RECONSTRUCT(AVMetadataMachineReadableCodeObject);
  @autoreleasepool {
    AVMetadataMachineReadableCodeObject* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVMetadataMachineReadableCodeObject *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVMetadataMachineReadableCodeObject *wrapper = new NAVMetadataMachineReadableCodeObject();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVMetadataMachineReadableCodeObject::New: invalid arguments");
    }
  }
}
