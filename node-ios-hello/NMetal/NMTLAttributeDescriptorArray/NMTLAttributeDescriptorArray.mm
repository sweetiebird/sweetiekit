//
//  NMTLAttributeDescriptorArray.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLAttributeDescriptorArray.h"

#define instancetype MTLAttributeDescriptorArray
#define js_value_instancetype js_value_MTLAttributeDescriptorArray

NMTLAttributeDescriptorArray::NMTLAttributeDescriptorArray() {}
NMTLAttributeDescriptorArray::~NMTLAttributeDescriptorArray() {}

JS_INIT_CLASS(MTLAttributeDescriptorArray, NSObject);
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectAtIndexedSubscript);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLAttributeDescriptorArray, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLAttributeDescriptorArray, NSObject);

NAN_METHOD(NMTLAttributeDescriptorArray::New) {
  JS_RECONSTRUCT(MTLAttributeDescriptorArray);
  @autoreleasepool {
    MTLAttributeDescriptorArray* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLAttributeDescriptorArray *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLAttributeDescriptorArray alloc] init];
    }
    if (self) {
      NMTLAttributeDescriptorArray *wrapper = new NMTLAttributeDescriptorArray();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLAttributeDescriptorArray::New: invalid arguments");
    }
  }
}

#include "NMTLAttributeDescriptor.h"

NAN_METHOD(NMTLAttributeDescriptorArray::objectAtIndexedSubscript) {
  JS_UNWRAP(MTLAttributeDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    JS_SET_RETURN(js_value_MTLAttributeDescriptor([self objectAtIndexedSubscript: index]));
  }
}

NAN_METHOD(NMTLAttributeDescriptorArray::setObjectAtIndexedSubscript) {
  JS_UNWRAP(MTLAttributeDescriptorArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(MTLAttributeDescriptor, attributeDesc);
    declare_value(NSUInteger, index);
    [self setObject: attributeDesc atIndexedSubscript: index];
  }
}
