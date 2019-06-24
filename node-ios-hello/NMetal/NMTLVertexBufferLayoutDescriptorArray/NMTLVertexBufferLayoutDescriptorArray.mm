//
//  NMTLVertexBufferLayoutDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLVertexBufferLayoutDescriptorArray.h"

#define instancetype MTLVertexBufferLayoutDescriptorArray
#define js_value_instancetype js_value_MTLVertexBufferLayoutDescriptorArray

NMTLVertexBufferLayoutDescriptorArray::NMTLVertexBufferLayoutDescriptorArray() {}
NMTLVertexBufferLayoutDescriptorArray::~NMTLVertexBufferLayoutDescriptorArray() {}

JS_INIT_CLASS(MTLVertexBufferLayoutDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLVertexBufferLayoutDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLVertexBufferLayoutDescriptorArray, NSObject);

NAN_METHOD(NMTLVertexBufferLayoutDescriptorArray::New) {
  JS_RECONSTRUCT(MTLVertexBufferLayoutDescriptorArray);
  @autoreleasepool {
    MTLVertexBufferLayoutDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLVertexBufferLayoutDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLVertexBufferLayoutDescriptorArray alloc] init];
    }
    if (self) {
      NMTLVertexBufferLayoutDescriptorArray *wrapper = new NMTLVertexBufferLayoutDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLVertexBufferLayoutDescriptorArray::New: invalid arguments");
    }
  }
}

#include "NMTLVertexBufferLayoutDescriptor.h"

NAN_METHOD(NMTLVertexBufferLayoutDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    JS_SET_RETURN(js_value_MTLVertexBufferLayoutDescriptor([self objectAtIndexedSubscript: index]));
  }
}

NAN_METHOD(NMTLVertexBufferLayoutDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLVertexBufferLayoutDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(MTLVertexBufferLayoutDescriptor, bufferDesc);
    declare_value(NSUInteger, index);
    [self setObject: bufferDesc atIndexedSubscript: index];
  }
}
