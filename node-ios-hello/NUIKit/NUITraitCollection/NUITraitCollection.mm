//
//  NUITraitCollection.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITraitCollection.h"

NUITraitCollection::NUITraitCollection() {}
NUITraitCollection::~NUITraitCollection() {}

JS_INIT_CLASS(UITraitCollection, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITraitCollection, NSObject);
JS_INIT_CLASS_END(UITraitCollection, NSObject);

NAN_METHOD(NUITraitCollection::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UITraitCollection(...)', turn into construct call.
      JS_SET_RETURN_NEW(UITraitCollection, info);
      return;
    }

    UITraitCollection* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UITraitCollection *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITraitCollection alloc] init];
    }
    if (self) {
      NUITraitCollection *wrapper = new NUITraitCollection();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITraitCollection::New: invalid arguments");
    }
  }
}
