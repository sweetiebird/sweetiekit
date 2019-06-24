//
//  NMTLVertexBufferLayoutDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLVertexBufferLayoutDescriptor.h"

#define instancetype MTLVertexBufferLayoutDescriptor
#define js_value_instancetype js_value_MTLVertexBufferLayoutDescriptor

NMTLVertexBufferLayoutDescriptor::NMTLVertexBufferLayoutDescriptor() {}
NMTLVertexBufferLayoutDescriptor::~NMTLVertexBufferLayoutDescriptor() {}

JS_INIT_CLASS(MTLVertexBufferLayoutDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(stride);
  JS_ASSIGN_PROTO_PROP(stepFunction);
  JS_ASSIGN_PROTO_PROP(stepRate);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLVertexBufferLayoutDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLVertexBufferLayoutDescriptor, NSObject);

NAN_METHOD(NMTLVertexBufferLayoutDescriptor::New) {
  JS_RECONSTRUCT(MTLVertexBufferLayoutDescriptor);
  @autoreleasepool {
    MTLVertexBufferLayoutDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLVertexBufferLayoutDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLVertexBufferLayoutDescriptor alloc] init];
    }
    if (self) {
      NMTLVertexBufferLayoutDescriptor *wrapper = new NMTLVertexBufferLayoutDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLVertexBufferLayoutDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLVertexBufferLayoutDescriptor::strideGetter) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stride]));
  }
}

NAN_SETTER(NMTLVertexBufferLayoutDescriptor::strideSetter) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setStride: input];
  }
}

#include "NMTLVertexDescriptor.h"

NAN_GETTER(NMTLVertexBufferLayoutDescriptor::stepFunctionGetter) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLVertexStepFunction([self stepFunction]));
  }
}

NAN_SETTER(NMTLVertexBufferLayoutDescriptor::stepFunctionSetter) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLVertexStepFunction, input);
    [self setStepFunction: input];
  }
}

NAN_GETTER(NMTLVertexBufferLayoutDescriptor::stepRateGetter) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stepRate]));
  }
}

NAN_SETTER(NMTLVertexBufferLayoutDescriptor::stepRateSetter) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setStepRate: input];
  }
}

