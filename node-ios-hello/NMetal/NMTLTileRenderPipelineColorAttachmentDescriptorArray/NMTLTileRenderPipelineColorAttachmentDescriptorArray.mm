//
//  NMTLTileRenderPipelineColorAttachmentDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTileRenderPipelineColorAttachmentDescriptorArray.h"

#if !(TARGET_OS_MAC || TARGET_OS_UIKITFORMAC)

#define instancetype MTLTileRenderPipelineColorAttachmentDescriptorArray
#define js_value_instancetype js_value_MTLTileRenderPipelineColorAttachmentDescriptorArray

NMTLTileRenderPipelineColorAttachmentDescriptorArray::NMTLTileRenderPipelineColorAttachmentDescriptorArray() {}
NMTLTileRenderPipelineColorAttachmentDescriptorArray::~NMTLTileRenderPipelineColorAttachmentDescriptorArray() {}

JS_INIT_CLASS(MTLTileRenderPipelineColorAttachmentDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

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

#include "NMTLTileRenderPipelineColorAttachmentDescriptor.h"

NAN_METHOD(NMTLTileRenderPipelineColorAttachmentDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLTileRenderPipelineColorAttachmentDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, attachmentIndex);
    JS_SET_RETURN(js_value_MTLTileRenderPipelineColorAttachmentDescriptor([self objectAtIndexedSubscript: attachmentIndex]));
  }
}

NAN_METHOD(NMTLTileRenderPipelineColorAttachmentDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLTileRenderPipelineColorAttachmentDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLTileRenderPipelineColorAttachmentDescriptor, attachment);
    declare_value(NSUInteger, attachmentIndex);
    [self setObject: attachment atIndexedSubscript: attachmentIndex];
  }
}

#endif
