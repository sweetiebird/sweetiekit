//
//  NCAValueFunction.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAValueFunction.h"

#define instancetype CAValueFunction
#define js_value_instancetype js_value_CAValueFunction

NCAValueFunction::NCAValueFunction() {}
NCAValueFunction::~NCAValueFunction() {}

JS_INIT_CLASS(CAValueFunction, NSObject);
  JS_ASSIGN_STATIC_METHOD(functionWithName);
  JS_ASSIGN_PROTO_PROP_READONLY(name);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAValueFunction, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(kCAValueFunctionRotateX, CAValueFunctionName);
  JS_ASSIGN_ENUM(kCAValueFunctionRotateY, CAValueFunctionName);
  JS_ASSIGN_ENUM(kCAValueFunctionRotateZ, CAValueFunctionName);

  JS_ASSIGN_ENUM(kCAValueFunctionScale, CAValueFunctionName);

  JS_ASSIGN_ENUM(kCAValueFunctionScaleX, CAValueFunctionName);
  JS_ASSIGN_ENUM(kCAValueFunctionScaleY, CAValueFunctionName);
  JS_ASSIGN_ENUM(kCAValueFunctionScaleZ, CAValueFunctionName);

  JS_ASSIGN_ENUM(kCAValueFunctionTranslate, CAValueFunctionName);

  JS_ASSIGN_ENUM(kCAValueFunctionTranslateX, CAValueFunctionName);
  JS_ASSIGN_ENUM(kCAValueFunctionTranslateY, CAValueFunctionName);
  JS_ASSIGN_ENUM(kCAValueFunctionTranslateZ, CAValueFunctionName);

JS_INIT_CLASS_END(CAValueFunction, NSObject);

NAN_METHOD(NCAValueFunction::New) {
  JS_RECONSTRUCT(CAValueFunction);
  @autoreleasepool {
    CAValueFunction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAValueFunction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAValueFunction alloc] init];
    }
    if (self) {
      NCAValueFunction *wrapper = new NCAValueFunction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAValueFunction::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCAValueFunction::functionWithName) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CAValueFunctionName, name);
    JS_SET_RETURN(js_value_instancetype([CAValueFunction functionWithName: name]));
  }
}

NAN_GETTER(NCAValueFunction::nameGetter) {
  JS_UNWRAP(CAValueFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAValueFunctionName([self name]));
  }
}
