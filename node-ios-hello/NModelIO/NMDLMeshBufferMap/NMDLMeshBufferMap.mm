//
//  NMDLMeshBufferMap.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLMeshBufferMap.h"

NMDLMeshBufferMap::NMDLMeshBufferMap() {}
NMDLMeshBufferMap::~NMDLMeshBufferMap() {}

JS_INIT_CLASS(MDLMeshBufferMap, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLMeshBufferMap, NSObject);
JS_INIT_CLASS_END(MDLMeshBufferMap, NSObject);

NAN_METHOD(NMDLMeshBufferMap::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLMeshBufferMap(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLMeshBufferMap, info);
      return;
    }

    MDLMeshBufferMap* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLMeshBufferMap *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLMeshBufferMap alloc] init];
    }
    if (self) {
      NMDLMeshBufferMap *wrapper = new NMDLMeshBufferMap();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLMeshBufferMap::New: invalid arguments");
    }
  }
}
