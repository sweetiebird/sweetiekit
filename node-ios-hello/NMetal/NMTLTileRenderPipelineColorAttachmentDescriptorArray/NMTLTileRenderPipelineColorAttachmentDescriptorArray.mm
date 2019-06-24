//
//  NMTLTileRenderPipelineColorAttachmentDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTileRenderPipelineColorAttachmentDescriptorArray.h"

#define instancetype MTLTileRenderPipelineColorAttachmentDescriptorArray
#define js_value_instancetype js_value_MTLTileRenderPipelineColorAttachmentDescriptorArray

NMTLTileRenderPipelineColorAttachmentDescriptorArray::NMTLTileRenderPipelineColorAttachmentDescriptorArray() {}
NMTLTileRenderPipelineColorAttachmentDescriptorArray::~NMTLTileRenderPipelineColorAttachmentDescriptorArray() {}

JS_INIT_CLASS(MTLTileRenderPipelineColorAttachmentDescriptorArray, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTileRenderPipelineColorAttachmentDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLTileRenderPipelineColorAttachmentDescriptorArray, NSObject);

NAN_METHOD(NMTLTileRenderPipelineColorAttachmentDescriptorArray::New) {
  JS_RECONSTRUCT(MTLTileRenderPipelineColorAttachmentDescriptorArray);
  @autoreleasepool {
    MTLTileRenderPipelineColorAttachmentDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLTileRenderPipelineColorAttachmentDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLTileRenderPipelineColorAttachmentDescriptorArray alloc] init];
    }
    if (self) {
      NMTLTileRenderPipelineColorAttachmentDescriptorArray *wrapper = new NMTLTileRenderPipelineColorAttachmentDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTileRenderPipelineColorAttachmentDescriptorArray::New: invalid arguments");
    }
  }
}
