//
//  NMTLRenderPassColorAttachmentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPassColorAttachmentDescriptor.h"

#define instancetype MTLRenderPassColorAttachmentDescriptor
#define js_value_instancetype js_value_MTLRenderPassColorAttachmentDescriptor

#import <Metal/MTLRenderPass.h>

NMTLRenderPassColorAttachmentDescriptor::NMTLRenderPassColorAttachmentDescriptor() {}
NMTLRenderPassColorAttachmentDescriptor::~NMTLRenderPassColorAttachmentDescriptor() {}

JS_INIT_CLASS(MTLRenderPassColorAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  JS_ASSIGN_PROTO_PROP(clearColor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPassColorAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPassColorAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);

NAN_METHOD(NMTLRenderPassColorAttachmentDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPassColorAttachmentDescriptor);
  @autoreleasepool {
    MTLRenderPassColorAttachmentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPassColorAttachmentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPassColorAttachmentDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPassColorAttachmentDescriptor *wrapper = new NMTLRenderPassColorAttachmentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPassColorAttachmentDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_GETTER(NMTLRenderPassColorAttachmentDescriptor::clearColorGetter) {
  JS_UNWRAP(MTLRenderPassColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLClearColor([self clearColor]));
  }
}

NAN_SETTER(NMTLRenderPassColorAttachmentDescriptor::clearColorSetter) {
  JS_UNWRAP(MTLRenderPassColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLClearColor, input);
    [self setClearColor: input];
  }
}
