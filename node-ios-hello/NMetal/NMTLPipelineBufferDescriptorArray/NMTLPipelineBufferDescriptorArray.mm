//
//  NMTLPipelineBufferDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLPipelineBufferDescriptorArray.h"

#define instancetype MTLPipelineBufferDescriptorArray
#define js_value_instancetype js_value_MTLPipelineBufferDescriptorArray

NMTLPipelineBufferDescriptorArray::NMTLPipelineBufferDescriptorArray() {}
NMTLPipelineBufferDescriptorArray::~NMTLPipelineBufferDescriptorArray() {}

JS_INIT_CLASS(MTLPipelineBufferDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLPipelineBufferDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLPipelineBufferDescriptorArray, NSObject);

NAN_METHOD(NMTLPipelineBufferDescriptorArray::New) {
  JS_RECONSTRUCT(MTLPipelineBufferDescriptorArray);
  @autoreleasepool {
    MTLPipelineBufferDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLPipelineBufferDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLPipelineBufferDescriptorArray alloc] init];
    }
    if (self) {
      NMTLPipelineBufferDescriptorArray *wrapper = new NMTLPipelineBufferDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLPipelineBufferDescriptorArray::New: invalid arguments");
    }
  }
}

#include "NMTLPipelineBufferDescriptor.h"

NAN_METHOD(NMTLPipelineBufferDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLPipelineBufferDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, bufferIndex);
    JS_SET_RETURN(js_value_MTLPipelineBufferDescriptor([self objectAtIndexedSubscript: bufferIndex]));
  }
}

NAN_METHOD(NMTLPipelineBufferDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLPipelineBufferDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(MTLPipelineBufferDescriptor, buffer);
    declare_value(NSUInteger, bufferIndex);
    [self setObject: buffer atIndexedSubscript: bufferIndex];
  }
}
