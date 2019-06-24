//
//  NMTLStructType.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLStructType.h"

#define instancetype MTLStructType
#define js_value_instancetype js_value_MTLStructType

NMTLStructType::NMTLStructType() {}
NMTLStructType::~NMTLStructType() {}

JS_INIT_CLASS(MTLStructType, MTLType);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLStructType, MTLType);
  // constant values (exports)
JS_INIT_CLASS_END(MTLStructType, MTLType);

NAN_METHOD(NMTLStructType::New) {
  JS_RECONSTRUCT(MTLStructType);
  @autoreleasepool {
    MTLStructType* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLStructType *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLStructType alloc] init];
    }
    if (self) {
      NMTLStructType *wrapper = new NMTLStructType();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLStructType::New: invalid arguments");
    }
  }
}
