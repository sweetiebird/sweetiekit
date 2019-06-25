//
//  NMTLRenderPassDepthAttachmentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPassDepthAttachmentDescriptor.h"

#define instancetype MTLRenderPassDepthAttachmentDescriptor
#define js_value_instancetype js_value_MTLRenderPassDepthAttachmentDescriptor

#import <Metal/MTLRenderPass.h>

NMTLRenderPassDepthAttachmentDescriptor::NMTLRenderPassDepthAttachmentDescriptor() {}
NMTLRenderPassDepthAttachmentDescriptor::~NMTLRenderPassDepthAttachmentDescriptor() {}

JS_INIT_CLASS(MTLRenderPassDepthAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  JS_ASSIGN_PROTO_PROP(clearDepth);
  JS_ASSIGN_PROTO_PROP(depthResolveFilter);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPassDepthAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPassDepthAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);

NAN_METHOD(NMTLRenderPassDepthAttachmentDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPassDepthAttachmentDescriptor);
  @autoreleasepool {
    MTLRenderPassDepthAttachmentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPassDepthAttachmentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPassDepthAttachmentDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPassDepthAttachmentDescriptor *wrapper = new NMTLRenderPassDepthAttachmentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPassDepthAttachmentDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLRenderPassDepthAttachmentDescriptor::clearDepthGetter) {
  JS_UNWRAP(MTLRenderPassDepthAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self clearDepth]));
  }
}

NAN_SETTER(NMTLRenderPassDepthAttachmentDescriptor::clearDepthSetter) {
  JS_UNWRAP(MTLRenderPassDepthAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(double, input);
    [self setClearDepth: input];
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_GETTER(NMTLRenderPassDepthAttachmentDescriptor::depthResolveFilterGetter) {
  JS_UNWRAP(MTLRenderPassDepthAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLMultisampleDepthResolveFilter([self depthResolveFilter]));
  }
}

NAN_SETTER(NMTLRenderPassDepthAttachmentDescriptor::depthResolveFilterSetter) {
  JS_UNWRAP(MTLRenderPassDepthAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLMultisampleDepthResolveFilter, input);
    [self setDepthResolveFilter: input];
  }
}
