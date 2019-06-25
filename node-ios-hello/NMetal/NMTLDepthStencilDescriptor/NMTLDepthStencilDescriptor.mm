//
//  NMTLDepthStencilDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLDepthStencilDescriptor.h"

#define instancetype MTLDepthStencilDescriptor
#define js_value_instancetype js_value_MTLDepthStencilDescriptor

NMTLDepthStencilDescriptor::NMTLDepthStencilDescriptor() {}
NMTLDepthStencilDescriptor::~NMTLDepthStencilDescriptor() {}

JS_INIT_CLASS(MTLDepthStencilDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(depthCompareFunction);
  JS_ASSIGN_PROTO_PROP(isDepthWriteEnabled);
  JS_ASSIGN_PROTO_PROP(frontFaceStencil);
  JS_ASSIGN_PROTO_PROP(backFaceStencil);
  JS_ASSIGN_PROTO_PROP(label);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLDepthStencilDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLDepthStencilDescriptor, NSObject);

NAN_METHOD(NMTLDepthStencilDescriptor::New) {
  JS_RECONSTRUCT(MTLDepthStencilDescriptor);
  @autoreleasepool {
    MTLDepthStencilDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLDepthStencilDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLDepthStencilDescriptor alloc] init];
    }
    if (self) {
      NMTLDepthStencilDescriptor *wrapper = new NMTLDepthStencilDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLDepthStencilDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLDepthStencil.h"

NAN_GETTER(NMTLDepthStencilDescriptor::depthCompareFunctionGetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCompareFunction([self depthCompareFunction]));
  }
}

NAN_SETTER(NMTLDepthStencilDescriptor::depthCompareFunctionSetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLCompareFunction, input);
    [self setDepthCompareFunction: input];
  }
}

NAN_GETTER(NMTLDepthStencilDescriptor::isDepthWriteEnabledGetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDepthWriteEnabled]));
  }
}

NAN_SETTER(NMTLDepthStencilDescriptor::isDepthWriteEnabledSetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDepthWriteEnabled: input];
  }
}

#include "NMTLStencilDescriptor.h"

NAN_GETTER(NMTLDepthStencilDescriptor::frontFaceStencilGetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStencilDescriptor([self frontFaceStencil]));
  }
}

NAN_SETTER(NMTLDepthStencilDescriptor::frontFaceStencilSetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MTLStencilDescriptor, input);
    [self setFrontFaceStencil: input];
  }
}

NAN_GETTER(NMTLDepthStencilDescriptor::backFaceStencilGetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStencilDescriptor([self backFaceStencil]));
  }
}

NAN_SETTER(NMTLDepthStencilDescriptor::backFaceStencilSetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MTLStencilDescriptor, input);
    [self setBackFaceStencil: input];
  }
}

NAN_GETTER(NMTLDepthStencilDescriptor::labelGetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLDepthStencilDescriptor::labelSetter) {
  JS_UNWRAP(MTLDepthStencilDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}
