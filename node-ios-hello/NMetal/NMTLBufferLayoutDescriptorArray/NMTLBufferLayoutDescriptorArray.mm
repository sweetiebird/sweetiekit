//
//  NMTLBufferLayoutDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLBufferLayoutDescriptorArray.h"

#define instancetype MTLBufferLayoutDescriptorArray
#define js_value_instancetype js_value_MTLBufferLayoutDescriptorArray

NMTLBufferLayoutDescriptorArray::NMTLBufferLayoutDescriptorArray() {}
NMTLBufferLayoutDescriptorArray::~NMTLBufferLayoutDescriptorArray() {}

JS_INIT_CLASS(MTLBufferLayoutDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLBufferLayoutDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLBufferLayoutDescriptorArray, NSObject);

NAN_METHOD(NMTLBufferLayoutDescriptorArray::New) {
  JS_RECONSTRUCT(MTLBufferLayoutDescriptorArray);
  @autoreleasepool {
    MTLBufferLayoutDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLBufferLayoutDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLBufferLayoutDescriptorArray alloc] init];
    }
    if (self) {
      NMTLBufferLayoutDescriptorArray *wrapper = new NMTLBufferLayoutDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLBufferLayoutDescriptorArray::New: invalid arguments");
    }
  }
}

#include "NMTLBufferLayoutDescriptor.h"

NAN_METHOD(NMTLBufferLayoutDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLBufferLayoutDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    JS_SET_RETURN(js_value_MTLBufferLayoutDescriptor([self objectAtIndexedSubscript: index]));
  }
}

NAN_METHOD(NMTLBufferLayoutDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLBufferLayoutDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(MTLBufferLayoutDescriptor, bufferDesc);
    declare_value(NSUInteger, index);
    [self setObject: bufferDesc atIndexedSubscript: index];
  }
}
