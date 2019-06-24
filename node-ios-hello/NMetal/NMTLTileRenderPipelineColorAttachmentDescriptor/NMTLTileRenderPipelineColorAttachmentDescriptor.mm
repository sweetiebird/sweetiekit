//
//  NMTLTileRenderPipelineColorAttachmentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTileRenderPipelineColorAttachmentDescriptor.h"

#define instancetype MTLTileRenderPipelineColorAttachmentDescriptor
#define js_value_instancetype js_value_MTLTileRenderPipelineColorAttachmentDescriptor

NMTLTileRenderPipelineColorAttachmentDescriptor::NMTLTileRenderPipelineColorAttachmentDescriptor() {}
NMTLTileRenderPipelineColorAttachmentDescriptor::~NMTLTileRenderPipelineColorAttachmentDescriptor() {}

JS_INIT_CLASS(MTLTileRenderPipelineColorAttachmentDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTileRenderPipelineColorAttachmentDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLTileRenderPipelineColorAttachmentDescriptor, NSObject);

NAN_METHOD(NMTLTileRenderPipelineColorAttachmentDescriptor::New) {
  JS_RECONSTRUCT(MTLTileRenderPipelineColorAttachmentDescriptor);
  @autoreleasepool {
    MTLTileRenderPipelineColorAttachmentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLTileRenderPipelineColorAttachmentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLTileRenderPipelineColorAttachmentDescriptor alloc] init];
    }
    if (self) {
      NMTLTileRenderPipelineColorAttachmentDescriptor *wrapper = new NMTLTileRenderPipelineColorAttachmentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTileRenderPipelineColorAttachmentDescriptor::New: invalid arguments");
    }
  }
}
