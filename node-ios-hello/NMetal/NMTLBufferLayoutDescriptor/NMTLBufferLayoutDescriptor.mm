//
//  NMTLBufferLayoutDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLBufferLayoutDescriptor.h"

#define instancetype MTLBufferLayoutDescriptor
#define js_value_instancetype js_value_MTLBufferLayoutDescriptor

NMTLBufferLayoutDescriptor::NMTLBufferLayoutDescriptor() {}
NMTLBufferLayoutDescriptor::~NMTLBufferLayoutDescriptor() {}

JS_INIT_CLASS(MTLBufferLayoutDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(stride);
  JS_ASSIGN_PROTO_PROP(stepFunction);
  JS_ASSIGN_PROTO_PROP(stepRate);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLBufferLayoutDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLBufferLayoutDescriptor, NSObject);

NAN_METHOD(NMTLBufferLayoutDescriptor::New) {
  JS_RECONSTRUCT(MTLBufferLayoutDescriptor);
  @autoreleasepool {
    MTLBufferLayoutDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLBufferLayoutDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLBufferLayoutDescriptor alloc] init];
    }
    if (self) {
      NMTLBufferLayoutDescriptor *wrapper = new NMTLBufferLayoutDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLBufferLayoutDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLBufferLayoutDescriptor::strideGetter) {
  JS_UNWRAP(MTLBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stride]));
  }
}

NAN_SETTER(NMTLBufferLayoutDescriptor::strideSetter) {
  JS_UNWRAP(MTLBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setStride: input];
  }
}

#include "NMTLStageInputOutputDescriptor.h"

NAN_GETTER(NMTLBufferLayoutDescriptor::stepFunctionGetter) {
  JS_UNWRAP(MTLBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStepFunction([self stepFunction]));
  }
}

NAN_SETTER(NMTLBufferLayoutDescriptor::stepFunctionSetter) {
  JS_UNWRAP(MTLBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStepFunction, input);
    [self setStepFunction: input];
  }
}

NAN_GETTER(NMTLBufferLayoutDescriptor::stepRateGetter) {
  JS_UNWRAP(MTLBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stepRate]));
  }
}

NAN_SETTER(NMTLBufferLayoutDescriptor::stepRateSetter) {
  JS_UNWRAP(MTLBufferLayoutDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setStepRate: input];
  }
}
