//
//  NMTLType.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLType.h"

#define instancetype MTLType
#define js_value_instancetype js_value_MTLType

NMTLType::NMTLType() {}
NMTLType::~NMTLType() {}

JS_INIT_CLASS(MTLType, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLType, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLType, NSObject);

NAN_METHOD(NMTLType::New) {
  JS_RECONSTRUCT(MTLType);
  @autoreleasepool {
    MTLType* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLType *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLType alloc] init];
    }
    if (self) {
      NMTLType *wrapper = new NMTLType();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLType::New: invalid arguments");
    }
  }
}
