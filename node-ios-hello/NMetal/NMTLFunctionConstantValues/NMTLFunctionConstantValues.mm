//
//  NMTLFunctionConstantValues.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLFunctionConstantValues.h"

#define instancetype MTLFunctionConstantValues
#define js_value_instancetype js_value_MTLFunctionConstantValues

NMTLFunctionConstantValues::NMTLFunctionConstantValues() {}
NMTLFunctionConstantValues::~NMTLFunctionConstantValues() {}

JS_INIT_CLASS(MTLFunctionConstantValues, NSObject);
  JS_ASSIGN_PROTO_METHOD(setConstantValueTypeAtIndex);
  JS_ASSIGN_PROTO_METHOD(setConstantValuesTypeWithRange);
  JS_ASSIGN_PROTO_METHOD(setConstantValueTypeWithName);
  JS_ASSIGN_PROTO_METHOD(reset);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLFunctionConstantValues, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLFunctionConstantValues, NSObject);

NAN_METHOD(NMTLFunctionConstantValues::New) {
  JS_RECONSTRUCT(MTLFunctionConstantValues);
  @autoreleasepool {
    MTLFunctionConstantValues* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLFunctionConstantValues *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLFunctionConstantValues alloc] init];
    }
    if (self) {
      NMTLFunctionConstantValues *wrapper = new NMTLFunctionConstantValues();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLFunctionConstantValues::New: invalid arguments");
    }
  }
}

#include "NMTLArgument.h"

NAN_METHOD(NMTLFunctionConstantValues::setConstantValueTypeAtIndex) {
  JS_UNWRAP(MTLFunctionConstantValues, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (info[data_argument_index]->IsNullOrUndefined() || !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* value = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(MTLDataType, type);
    declare_value(NSUInteger, index);
    [self setConstantValue: value type: type atIndex: index];
  }
}

NAN_METHOD(NMTLFunctionConstantValues::setConstantValuesTypeWithRange) {
  JS_UNWRAP(MTLFunctionConstantValues, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (info[data_argument_index]->IsNullOrUndefined() || !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* values = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(MTLDataType, type);
    declare_value(NSRange, range);
    [self setConstantValues: values type: type withRange: range];
  }
}

NAN_METHOD(NMTLFunctionConstantValues::setConstantValueTypeWithName) {
  JS_UNWRAP(MTLFunctionConstantValues, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (info[data_argument_index]->IsNullOrUndefined() || !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* value = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(MTLDataType, type);
    declare_pointer(NSString, name);
    [self setConstantValue: value type: type withName: name];
  }
}

NAN_METHOD(NMTLFunctionConstantValues::reset) {
  JS_UNWRAP(MTLFunctionConstantValues, self);
  declare_autoreleasepool {
    [self reset];
  }
}

