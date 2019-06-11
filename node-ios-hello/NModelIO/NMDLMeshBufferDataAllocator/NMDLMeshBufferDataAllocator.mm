//
//  NMDLMeshBufferDataAllocator.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLMeshBufferDataAllocator.h"

#include "NMDLTypes.h"

#define instancetype MDLMeshBufferDataAllocator
#define js_value_instancetype js_value_MDLMeshBufferDataAllocator

NMDLMeshBufferDataAllocator::NMDLMeshBufferDataAllocator() {}
NMDLMeshBufferDataAllocator::~NMDLMeshBufferDataAllocator() {}

JS_INIT_CLASS(MDLMeshBufferDataAllocator, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLMeshBufferDataAllocator, NSObject);
JS_INIT_CLASS_END(MDLMeshBufferDataAllocator, NSObject);

NAN_METHOD(NMDLMeshBufferDataAllocator::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLMeshBufferDataAllocator(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLMeshBufferDataAllocator, info);
      return;
    }

    MDLMeshBufferDataAllocator* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLMeshBufferDataAllocator *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLMeshBufferDataAllocator alloc] init];
    }
    if (self) {
      NMDLMeshBufferDataAllocator *wrapper = new NMDLMeshBufferDataAllocator();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLMeshBufferDataAllocator::New: invalid arguments");
    }
  }
}
