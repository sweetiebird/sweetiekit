//
//  NMDLVertexAttributeData.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLVertexAttributeData.h"

NMDLVertexAttributeData::NMDLVertexAttributeData() {}
NMDLVertexAttributeData::~NMDLVertexAttributeData() {}

JS_INIT_CLASS(MDLVertexAttributeData, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLVertexAttributeData, NSObject);
JS_INIT_CLASS_END(MDLVertexAttributeData, NSObject);

NAN_METHOD(NMDLVertexAttributeData::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLVertexAttributeData(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLVertexAttributeData, info);
      return;
    }

    MDLVertexAttributeData* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLVertexAttributeData *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLVertexAttributeData alloc] init];
    }
    if (self) {
      NMDLVertexAttributeData *wrapper = new NMDLVertexAttributeData();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLVertexAttributeData::New: invalid arguments");
    }
  }
}
