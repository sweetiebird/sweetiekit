//
//  NAUParameterGroup.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAUParameterGroup.h"

NAUParameterGroup::NAUParameterGroup() {}
NAUParameterGroup::~NAUParameterGroup() {}

JS_INIT_CLASS(AUParameterGroup, AUParameterNode);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AUParameterGroup, AUParameterNode);
JS_INIT_CLASS_END(AUParameterGroup, AUParameterNode);

NAN_METHOD(NAUParameterGroup::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AUParameterGroup(...)', turn into construct call.
      JS_SET_RETURN_NEW(AUParameterGroup, info);
      return;
    }

    AUParameterGroup* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AUParameterGroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AUParameterGroup alloc] init];
    }
    if (self) {
      NAUParameterGroup *wrapper = new NAUParameterGroup();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AUParameterGroup::New: invalid arguments");
    }
  }
}
