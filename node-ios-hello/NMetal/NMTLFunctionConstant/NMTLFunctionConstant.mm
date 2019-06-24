//
//  NMTLFunctionConstant.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLFunctionConstant.h"

#define instancetype MTLFunctionConstant
#define js_value_instancetype js_value_MTLFunctionConstant

NMTLFunctionConstant::NMTLFunctionConstant() {}
NMTLFunctionConstant::~NMTLFunctionConstant() {}

JS_INIT_CLASS(MTLFunctionConstant, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(type);
  JS_ASSIGN_PROTO_PROP_READONLY(index);
  JS_ASSIGN_PROTO_PROP_READONLY(required);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLFunctionConstant, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLFunctionConstant, NSObject);

NAN_METHOD(NMTLFunctionConstant::New) {
  JS_RECONSTRUCT(MTLFunctionConstant);
  @autoreleasepool {
    MTLFunctionConstant* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLFunctionConstant *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLFunctionConstant alloc] init];
    }
    if (self) {
      NMTLFunctionConstant *wrapper = new NMTLFunctionConstant();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLFunctionConstant::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLFunctionConstant::nameGetter) {
  JS_UNWRAP(MTLFunctionConstant, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

#include "NMTLArgument.h"

NAN_GETTER(NMTLFunctionConstant::typeGetter) {
  JS_UNWRAP(MTLFunctionConstant, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDataType([self type]));
  }
}

NAN_GETTER(NMTLFunctionConstant::indexGetter) {
  JS_UNWRAP(MTLFunctionConstant, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self index]));
  }
}

NAN_GETTER(NMTLFunctionConstant::requiredGetter) {
  JS_UNWRAP(MTLFunctionConstant, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self required]));
  }
}
