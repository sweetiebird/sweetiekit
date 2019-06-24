//
//  NMTLRenderPipelineColorAttachmentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineColorAttachmentDescriptor.h"

#define instancetype MTLRenderPipelineColorAttachmentDescriptor
#define js_value_instancetype js_value_MTLRenderPipelineColorAttachmentDescriptor

NMTLRenderPipelineColorAttachmentDescriptor::NMTLRenderPipelineColorAttachmentDescriptor() {}
NMTLRenderPipelineColorAttachmentDescriptor::~NMTLRenderPipelineColorAttachmentDescriptor() {}

JS_INIT_CLASS(MTLRenderPipelineColorAttachmentDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineColorAttachmentDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPipelineColorAttachmentDescriptor, NSObject);

NAN_METHOD(NMTLRenderPipelineColorAttachmentDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPipelineColorAttachmentDescriptor);
  @autoreleasepool {
    MTLRenderPipelineColorAttachmentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPipelineColorAttachmentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPipelineColorAttachmentDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPipelineColorAttachmentDescriptor *wrapper = new NMTLRenderPipelineColorAttachmentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineColorAttachmentDescriptor::New: invalid arguments");
    }
  }
}
