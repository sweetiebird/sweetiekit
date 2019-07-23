//
//  NMTLRenderPassStencilAttachmentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPassStencilAttachmentDescriptor.h"

#define instancetype MTLRenderPassStencilAttachmentDescriptor
#define js_value_instancetype js_value_MTLRenderPassStencilAttachmentDescriptor

NMTLRenderPassStencilAttachmentDescriptor::NMTLRenderPassStencilAttachmentDescriptor() {}
NMTLRenderPassStencilAttachmentDescriptor::~NMTLRenderPassStencilAttachmentDescriptor() {}

JS_INIT_CLASS(MTLRenderPassStencilAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  JS_ASSIGN_PROTO_PROP(clearStencil);
  JS_ASSIGN_PROTO_PROP(stencilResolveFilter);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPassStencilAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPassStencilAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);

NAN_METHOD(NMTLRenderPassStencilAttachmentDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPassStencilAttachmentDescriptor);
  @autoreleasepool {
    MTLRenderPassStencilAttachmentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPassStencilAttachmentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPassStencilAttachmentDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPassStencilAttachmentDescriptor *wrapper = new NMTLRenderPassStencilAttachmentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPassStencilAttachmentDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLRenderPassStencilAttachmentDescriptor::clearStencilGetter) {
  JS_UNWRAP(MTLRenderPassStencilAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self clearStencil]));
  }
}

NAN_SETTER(NMTLRenderPassStencilAttachmentDescriptor::clearStencilSetter) {
  JS_UNWRAP(MTLRenderPassStencilAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(uint32_t, input);
    [self setClearStencil: input];
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_GETTER(NMTLRenderPassStencilAttachmentDescriptor::stencilResolveFilterGetter) {
  JS_UNWRAP(MTLRenderPassStencilAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLMultisampleStencilResolveFilter([self stencilResolveFilter]));
  }
}

NAN_SETTER(NMTLRenderPassStencilAttachmentDescriptor::stencilResolveFilterSetter) {
  JS_UNWRAP(MTLRenderPassStencilAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLMultisampleStencilResolveFilter, input);
    [self setStencilResolveFilter: input];
  }
}
