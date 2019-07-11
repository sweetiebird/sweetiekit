//
//  NMTLRenderPassColorAttachmentDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPassColorAttachmentDescriptorArray.h"

#define instancetype MTLRenderPassColorAttachmentDescriptorArray
#define js_value_instancetype js_value_MTLRenderPassColorAttachmentDescriptorArray

NMTLRenderPassColorAttachmentDescriptorArray::NMTLRenderPassColorAttachmentDescriptorArray() {}
NMTLRenderPassColorAttachmentDescriptorArray::~NMTLRenderPassColorAttachmentDescriptorArray() {}

JS_INIT_CLASS(MTLRenderPassColorAttachmentDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPassColorAttachmentDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPassColorAttachmentDescriptorArray, NSObject);

NAN_METHOD(NMTLRenderPassColorAttachmentDescriptorArray::New) {
  JS_RECONSTRUCT(MTLRenderPassColorAttachmentDescriptorArray);
  @autoreleasepool {
    MTLRenderPassColorAttachmentDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPassColorAttachmentDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPassColorAttachmentDescriptorArray alloc] init];
    }
    if (self) {
      NMTLRenderPassColorAttachmentDescriptorArray *wrapper = new NMTLRenderPassColorAttachmentDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPassColorAttachmentDescriptorArray::New: invalid arguments");
    }
  }
}

#include "NMTLRenderPassColorAttachmentDescriptor.h"

NAN_METHOD(NMTLRenderPassColorAttachmentDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLRenderPassColorAttachmentDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, attachmentIndex);
    if (attachmentIndex >= 8) {
      js_panic_noreturn("attachmentIndex must be < 8");
      return;
    }
    JS_SET_RETURN(js_value_MTLRenderPassColorAttachmentDescriptor([self objectAtIndexedSubscript: attachmentIndex]));
  }
}

NAN_METHOD(NMTLRenderPassColorAttachmentDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLRenderPassColorAttachmentDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(MTLRenderPassColorAttachmentDescriptor, attachment);
    declare_value(NSUInteger, attachmentIndex);
    if (attachmentIndex >= 8) {
      js_panic_noreturn("attachmentIndex must be < 8");
      return;
    }
    [self setObject: attachment atIndexedSubscript: attachmentIndex];
  }
}
