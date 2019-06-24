//
//  NMTLStencilDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLStencilDescriptor.h"

#define instancetype MTLStencilDescriptor
#define js_value_instancetype js_value_MTLStencilDescriptor

NMTLStencilDescriptor::NMTLStencilDescriptor() {}
NMTLStencilDescriptor::~NMTLStencilDescriptor() {}

JS_INIT_CLASS(MTLStencilDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(stencilCompareFunction);
  JS_ASSIGN_PROTO_PROP(stencilFailureOperation);
  JS_ASSIGN_PROTO_PROP(depthFailureOperation);
  JS_ASSIGN_PROTO_PROP(depthStencilPassOperation);
  JS_ASSIGN_PROTO_PROP(readMask);
  JS_ASSIGN_PROTO_PROP(writeMask);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLStencilDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLStencilDescriptor, NSObject);

NAN_METHOD(NMTLStencilDescriptor::New) {
  JS_RECONSTRUCT(MTLStencilDescriptor);
  @autoreleasepool {
    MTLStencilDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLStencilDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLStencilDescriptor alloc] init];
    }
    if (self) {
      NMTLStencilDescriptor *wrapper = new NMTLStencilDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLStencilDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLDepthStencil.h"

NAN_GETTER(NMTLStencilDescriptor::stencilCompareFunctionGetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCompareFunction([self stencilCompareFunction]));
  }
}

NAN_SETTER(NMTLStencilDescriptor::stencilCompareFunctionSetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLCompareFunction, input);
    [self setStencilCompareFunction: input];
  }
}

NAN_GETTER(NMTLStencilDescriptor::stencilFailureOperationGetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStencilOperation([self stencilFailureOperation]));
  }
}

NAN_SETTER(NMTLStencilDescriptor::stencilFailureOperationSetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStencilOperation, input);
    [self setStencilFailureOperation: input];
  }
}

NAN_GETTER(NMTLStencilDescriptor::depthFailureOperationGetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStencilOperation([self depthFailureOperation]));
  }
}

NAN_SETTER(NMTLStencilDescriptor::depthFailureOperationSetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStencilOperation, input);
    [self setDepthFailureOperation: input];
  }
}

NAN_GETTER(NMTLStencilDescriptor::depthStencilPassOperationGetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStencilOperation([self depthStencilPassOperation]));
  }
}

NAN_SETTER(NMTLStencilDescriptor::depthStencilPassOperationSetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStencilOperation, input);
    [self setDepthStencilPassOperation: input];
  }
}

NAN_GETTER(NMTLStencilDescriptor::readMaskGetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self readMask]));
  }
}

NAN_SETTER(NMTLStencilDescriptor::readMaskSetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(uint32_t, input);
    [self setReadMask: input];
  }
}

NAN_GETTER(NMTLStencilDescriptor::writeMaskGetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self writeMask]));
  }
}

NAN_SETTER(NMTLStencilDescriptor::writeMaskSetter) {
  JS_UNWRAP(MTLStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(uint32_t, input);
    [self setWriteMask: input];
  }
}
