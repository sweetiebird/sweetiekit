//
//  NMTLTextureReferenceType.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTextureReferenceType.h"

#define instancetype MTLTextureReferenceType
#define js_value_instancetype js_value_MTLTextureReferenceType

NMTLTextureReferenceType::NMTLTextureReferenceType() {}
NMTLTextureReferenceType::~NMTLTextureReferenceType() {}

JS_INIT_CLASS(MTLTextureReferenceType, MTLType);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTextureReferenceType, MTLType);
  // constant values (exports)
JS_INIT_CLASS_END(MTLTextureReferenceType, MTLType);

NAN_METHOD(NMTLTextureReferenceType::New) {
  JS_RECONSTRUCT(MTLTextureReferenceType);
  @autoreleasepool {
    MTLTextureReferenceType* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLTextureReferenceType *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLTextureReferenceType alloc] init];
    }
    if (self) {
      NMTLTextureReferenceType *wrapper = new NMTLTextureReferenceType();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTextureReferenceType::New: invalid arguments");
    }
  }
}
