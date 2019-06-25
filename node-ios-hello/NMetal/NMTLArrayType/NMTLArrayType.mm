//
//  NMTLArrayType.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLArrayType.h"

#define instancetype MTLArrayType
#define js_value_instancetype js_value_MTLArrayType

NMTLArrayType::NMTLArrayType() {}
NMTLArrayType::~NMTLArrayType() {}

JS_INIT_CLASS(MTLArrayType, MTLType);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLArrayType, MTLType);
  // constant values (exports)
JS_INIT_CLASS_END(MTLArrayType, MTLType);

NAN_METHOD(NMTLArrayType::New) {
  JS_RECONSTRUCT(MTLArrayType);
  @autoreleasepool {
    MTLArrayType* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLArrayType *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLArrayType alloc] init];
    }
    if (self) {
      NMTLArrayType *wrapper = new NMTLArrayType();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLArrayType::New: invalid arguments");
    }
  }
}
