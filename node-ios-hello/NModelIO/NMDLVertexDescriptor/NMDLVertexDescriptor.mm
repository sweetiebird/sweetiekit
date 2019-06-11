//
//  NMDLVertexDescriptor.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLVertexDescriptor.h"

NMDLVertexDescriptor::NMDLVertexDescriptor() {}
NMDLVertexDescriptor::~NMDLVertexDescriptor() {}

JS_INIT_CLASS(MDLVertexDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLVertexDescriptor, NSObject);
JS_INIT_CLASS_END(MDLVertexDescriptor, NSObject);

NAN_METHOD(NMDLVertexDescriptor::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLVertexDescriptor(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLVertexDescriptor, info);
      return;
    }

    MDLVertexDescriptor* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLVertexDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLVertexDescriptor alloc] init];
    }
    if (self) {
      NMDLVertexDescriptor *wrapper = new NMDLVertexDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLVertexDescriptor::New: invalid arguments");
    }
  }
}
