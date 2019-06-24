//
//  NMTLStructMember.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLStructMember.h"

#define instancetype MTLStructMember
#define js_value_instancetype js_value_MTLStructMember

NMTLStructMember::NMTLStructMember() {}
NMTLStructMember::~NMTLStructMember() {}

JS_INIT_CLASS(MTLStructMember, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLStructMember, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLStructMember, NSObject);

NAN_METHOD(NMTLStructMember::New) {
  JS_RECONSTRUCT(MTLStructMember);
  @autoreleasepool {
    MTLStructMember* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLStructMember *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLStructMember alloc] init];
    }
    if (self) {
      NMTLStructMember *wrapper = new NMTLStructMember();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLStructMember::New: invalid arguments");
    }
  }
}
