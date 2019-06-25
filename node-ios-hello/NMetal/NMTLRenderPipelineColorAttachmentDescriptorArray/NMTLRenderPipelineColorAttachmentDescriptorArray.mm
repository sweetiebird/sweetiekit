//
//  NMTLRenderPipelineColorAttachmentDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineColorAttachmentDescriptorArray.h"

#define instancetype MTLRenderPipelineColorAttachmentDescriptorArray
#define js_value_instancetype js_value_MTLRenderPipelineColorAttachmentDescriptorArray

NMTLRenderPipelineColorAttachmentDescriptorArray::NMTLRenderPipelineColorAttachmentDescriptorArray() {}
NMTLRenderPipelineColorAttachmentDescriptorArray::~NMTLRenderPipelineColorAttachmentDescriptorArray() {}

JS_INIT_CLASS(MTLRenderPipelineColorAttachmentDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineColorAttachmentDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPipelineColorAttachmentDescriptorArray, NSObject);

NAN_METHOD(NMTLRenderPipelineColorAttachmentDescriptorArray::New) {
  JS_RECONSTRUCT(MTLRenderPipelineColorAttachmentDescriptorArray);
  @autoreleasepool {
    MTLRenderPipelineColorAttachmentDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPipelineColorAttachmentDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPipelineColorAttachmentDescriptorArray alloc] init];
    }
    if (self) {
      NMTLRenderPipelineColorAttachmentDescriptorArray *wrapper = new NMTLRenderPipelineColorAttachmentDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineColorAttachmentDescriptorArray::New: invalid arguments");
    }
  }
}

#include "NMTLRenderPipelineColorAttachmentDescriptor.h"

NAN_METHOD(NMTLRenderPipelineColorAttachmentDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, attachmentIndex);
    JS_SET_RETURN(js_value_MTLRenderPipelineColorAttachmentDescriptor([self objectAtIndexedSubscript: attachmentIndex]));
  }
}

NAN_METHOD(NMTLRenderPipelineColorAttachmentDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(MTLRenderPipelineColorAttachmentDescriptor, attachment);
    declare_value(NSUInteger, attachmentIndex);
    [self setObject: attachment atIndexedSubscript: attachmentIndex];
  }
}

