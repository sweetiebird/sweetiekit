//
//  NUIImageAsset.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImageAsset.h"

NUIImageAsset::NUIImageAsset() {}
NUIImageAsset::~NUIImageAsset() {}

JS_INIT_CLASS(UIImageAsset, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIImageAsset, NSObject);
JS_INIT_CLASS_END(UIImageAsset, NSObject);

NAN_METHOD(NUIImageAsset::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UIImageAsset(...)', turn into construct call.
      JS_SET_RETURN_NEW(UIImageAsset, info);
      return;
    }

    UIImageAsset* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIImageAsset *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIImageAsset alloc] init];
    }
    if (self) {
      NUIImageAsset *wrapper = new NUIImageAsset();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIImageAsset::New: invalid arguments");
    }
  }
}
