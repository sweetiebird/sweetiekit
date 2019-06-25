//
//  NMTLVertexAttributeDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLVertexAttributeDescriptorArray.h"

#define instancetype MTLVertexAttributeDescriptorArray
#define js_value_instancetype js_value_MTLVertexAttributeDescriptorArray

NMTLVertexAttributeDescriptorArray::NMTLVertexAttributeDescriptorArray() {}
NMTLVertexAttributeDescriptorArray::~NMTLVertexAttributeDescriptorArray() {}

JS_INIT_CLASS(MTLVertexAttributeDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLVertexAttributeDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLVertexAttributeDescriptorArray, NSObject);

NAN_METHOD(NMTLVertexAttributeDescriptorArray::New) {
  JS_RECONSTRUCT(MTLVertexAttributeDescriptorArray);
  @autoreleasepool {
    MTLVertexAttributeDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLVertexAttributeDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLVertexAttributeDescriptorArray alloc] init];
    }
    if (self) {
      NMTLVertexAttributeDescriptorArray *wrapper = new NMTLVertexAttributeDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLVertexAttributeDescriptorArray::New: invalid arguments");
    }
  }
}

#include "NMTLVertexAttributeDescriptor.h"

NAN_METHOD(NMTLVertexAttributeDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLVertexAttributeDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    JS_SET_RETURN(js_value_MTLVertexAttributeDescriptor([self objectAtIndexedSubscript: index]));
  }
}

NAN_METHOD(NMTLVertexAttributeDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLVertexAttributeDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(MTLVertexAttributeDescriptor, attributeDesc);
    declare_value(NSUInteger, index);
    [self setObject: attributeDesc atIndexedSubscript: index];
  }
}
