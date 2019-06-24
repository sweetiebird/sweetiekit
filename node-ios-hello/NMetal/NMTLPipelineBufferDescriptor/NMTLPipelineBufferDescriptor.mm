//
//  NMTLPipelineBufferDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLPipelineBufferDescriptor.h"

#define instancetype MTLPipelineBufferDescriptor
#define js_value_instancetype js_value_MTLPipelineBufferDescriptor

NMTLPipelineBufferDescriptor::NMTLPipelineBufferDescriptor() {}
NMTLPipelineBufferDescriptor::~NMTLPipelineBufferDescriptor() {}

JS_INIT_CLASS(MTLPipelineBufferDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(mutability);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLPipelineBufferDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLPipelineBufferDescriptor, NSObject);

NAN_METHOD(NMTLPipelineBufferDescriptor::New) {
  JS_RECONSTRUCT(MTLPipelineBufferDescriptor);
  @autoreleasepool {
    MTLPipelineBufferDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLPipelineBufferDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLPipelineBufferDescriptor alloc] init];
    }
    if (self) {
      NMTLPipelineBufferDescriptor *wrapper = new NMTLPipelineBufferDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLPipelineBufferDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLPipeline.h"

NAN_GETTER(NMTLPipelineBufferDescriptor::mutabilityGetter) {
  JS_UNWRAP(MTLPipelineBufferDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLMutability([self mutability]));
  }
}

NAN_SETTER(NMTLPipelineBufferDescriptor::mutabilitySetter) {
  JS_UNWRAP(MTLPipelineBufferDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLMutability, input);
    [self setMutability: input];
  }
}
