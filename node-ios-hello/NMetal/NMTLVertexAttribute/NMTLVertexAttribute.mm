//
//  NMTLVertexAttribute.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLVertexAttribute.h"

#define instancetype MTLVertexAttribute
#define js_value_instancetype js_value_MTLVertexAttribute

NMTLVertexAttribute::NMTLVertexAttribute() {}
NMTLVertexAttribute::~NMTLVertexAttribute() {}

JS_INIT_CLASS(MTLVertexAttribute, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLVertexAttribute, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLVertexAttribute, NSObject);

NAN_METHOD(NMTLVertexAttribute::New) {
  JS_RECONSTRUCT(MTLVertexAttribute);
  @autoreleasepool {
    MTLVertexAttribute* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLVertexAttribute *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLVertexAttribute alloc] init];
    }
    if (self) {
      NMTLVertexAttribute *wrapper = new NMTLVertexAttribute();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLVertexAttribute::New: invalid arguments");
    }
  }
}
