//
//  NARAnchor.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARAnchor.h"
#include "NNSObject.h"

#define instancetype ARAnchor
#define js_value_instancetype js_value_ARAnchor

NARAnchor::NARAnchor() {}
NARAnchor::~NARAnchor() {}

JS_INIT_CLASS(ARAnchor, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithAnchor);
  JS_ASSIGN_PROTO_METHOD(initWithTransform);
  JS_ASSIGN_PROTO_METHOD(initWithNameTransform);
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(transform);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARAnchor, NSObject);

JS_INIT_CLASS_END(ARAnchor, NSObject);

NAN_METHOD(NARAnchor::New) {
  JS_RECONSTRUCT(ARAnchor);
  @autoreleasepool {
    ARAnchor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARAnchor *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_simd_float4x4(info[0])) {
      declare_args();
      declare_value(simd_float4x4, transform);
      self = [[ARAnchor alloc] initWithTransform:transform];
    } else if (info.Length() <= 0) {
      simd_float4x4 transform = matrix_identity_float4x4;
      self = [[ARAnchor alloc] initWithTransform:transform];
    }
    if (self) {
      NARAnchor *wrapper = new NARAnchor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARAnchor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NARAnchor::initWithAnchor) {
  JS_UNWRAP_OR_ALLOC(ARAnchor, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARAnchor, anchor);
    JS_SET_RETURN(js_value_instancetype([self initWithAnchor: anchor]));
  }
}

NAN_METHOD(NARAnchor::initWithTransform) {
  JS_UNWRAP_OR_ALLOC(ARAnchor, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float4x4, transform);
    JS_SET_RETURN(js_value_instancetype([self initWithTransform: transform]));
  }
}

NAN_METHOD(NARAnchor::initWithNameTransform) {
  JS_UNWRAP_OR_ALLOC(ARAnchor, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(simd_float4x4, transform);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name transform: transform]));
  }
}

#include "NNSUUID.h"

NAN_GETTER(NARAnchor::identifierGetter) {
  JS_UNWRAP(ARAnchor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUUID([self identifier]));
  }
}

NAN_GETTER(NARAnchor::nameGetter) {
  JS_UNWRAP(ARAnchor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NARAnchor::transformGetter) {
  JS_UNWRAP(ARAnchor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self transform]));
  }
}
