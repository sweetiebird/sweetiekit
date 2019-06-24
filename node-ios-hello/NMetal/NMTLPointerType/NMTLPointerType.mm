//
//  NMTLPointerType.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLPointerType.h"

#define instancetype MTLPointerType
#define js_value_instancetype js_value_MTLPointerType

NMTLPointerType::NMTLPointerType() {}
NMTLPointerType::~NMTLPointerType() {}

JS_INIT_CLASS(MTLPointerType, MTLType);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLPointerType, MTLType);
  // constant values (exports)
JS_INIT_CLASS_END(MTLPointerType, MTLType);

NAN_METHOD(NMTLPointerType::New) {
  JS_RECONSTRUCT(MTLPointerType);
  @autoreleasepool {
    MTLPointerType* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLPointerType *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLPointerType alloc] init];
    }
    if (self) {
      NMTLPointerType *wrapper = new NMTLPointerType();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLPointerType::New: invalid arguments");
    }
  }
}
