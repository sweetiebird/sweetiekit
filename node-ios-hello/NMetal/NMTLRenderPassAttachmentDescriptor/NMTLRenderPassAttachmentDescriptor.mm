//
//  NMTLRenderPassAttachmentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPassAttachmentDescriptor.h"

#define instancetype MTLRenderPassAttachmentDescriptor
#define js_value_instancetype js_value_MTLRenderPassAttachmentDescriptor

NMTLRenderPassAttachmentDescriptor::NMTLRenderPassAttachmentDescriptor() {}
NMTLRenderPassAttachmentDescriptor::~NMTLRenderPassAttachmentDescriptor() {}

JS_INIT_CLASS(MTLRenderPassAttachmentDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(texture);
  JS_ASSIGN_PROTO_PROP(level);
  JS_ASSIGN_PROTO_PROP(slice);
  JS_ASSIGN_PROTO_PROP(depthPlane);
  JS_ASSIGN_PROTO_PROP(resolveTexture);
  JS_ASSIGN_PROTO_PROP(resolveLevel);
  JS_ASSIGN_PROTO_PROP(resolveSlice);
  JS_ASSIGN_PROTO_PROP(resolveDepthPlane);
  JS_ASSIGN_PROTO_PROP(loadAction);
  JS_ASSIGN_PROTO_PROP(storeAction);
  JS_ASSIGN_PROTO_PROP(storeActionOptions);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPassAttachmentDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPassAttachmentDescriptor, NSObject);

NAN_METHOD(NMTLRenderPassAttachmentDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPassAttachmentDescriptor);
  @autoreleasepool {
    MTLRenderPassAttachmentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPassAttachmentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPassAttachmentDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPassAttachmentDescriptor *wrapper = new NMTLRenderPassAttachmentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPassAttachmentDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::textureGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MTLTexture>*/([self texture]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::textureSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MTLTexture>*/, input);
    [self setTexture: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::levelGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self level]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::levelSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setLevel: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::sliceGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self slice]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::sliceSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSlice: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::depthPlaneGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self depthPlane]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::depthPlaneSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setDepthPlane: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::resolveTextureGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MTLTexture>*/([self resolveTexture]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::resolveTextureSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MTLTexture>*/, input);
    [self setResolveTexture: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::resolveLevelGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self resolveLevel]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::resolveLevelSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setResolveLevel: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::resolveSliceGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self resolveSlice]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::resolveSliceSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setResolveSlice: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::resolveDepthPlaneGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self resolveDepthPlane]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::resolveDepthPlaneSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setResolveDepthPlane: input];
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::loadActionGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLLoadAction([self loadAction]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::loadActionSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLLoadAction, input);
    [self setLoadAction: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::storeActionGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStoreAction([self storeAction]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::storeActionSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStoreAction, input);
    [self setStoreAction: input];
  }
}

NAN_GETTER(NMTLRenderPassAttachmentDescriptor::storeActionOptionsGetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStoreActionOptions([self storeActionOptions]));
  }
}

NAN_SETTER(NMTLRenderPassAttachmentDescriptor::storeActionOptionsSetter) {
  JS_UNWRAP(MTLRenderPassAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStoreActionOptions, input);
    [self setStoreActionOptions: input];
  }
}
