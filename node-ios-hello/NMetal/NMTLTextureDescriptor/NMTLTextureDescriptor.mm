//
//  NMTLTextureDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTextureDescriptor.h"

#define instancetype MTLTextureDescriptor
#define js_value_instancetype js_value_MTLTextureDescriptor

NMTLTextureDescriptor::NMTLTextureDescriptor() {}
NMTLTextureDescriptor::~NMTLTextureDescriptor() {}

JS_INIT_CLASS(MTLTextureDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTextureDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLTextureDescriptor, NSObject);

NAN_METHOD(NMTLTextureDescriptor::New) {
  JS_RECONSTRUCT(MTLTextureDescriptor);
  @autoreleasepool {
    MTLTextureDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLTextureDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLTextureDescriptor alloc] init];
    }
    if (self) {
      NMTLTextureDescriptor *wrapper = new NMTLTextureDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTextureDescriptor::New: invalid arguments");
    }
  }
}
