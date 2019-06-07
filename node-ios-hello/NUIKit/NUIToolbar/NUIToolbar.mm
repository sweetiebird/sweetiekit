//
//  NUIToolbar.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIToolbar.h"

NUIToolbar::NUIToolbar() {}
NUIToolbar::~NUIToolbar() {}

JS_INIT_CLASS(UIToolbar, UIView);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIToolbar, UIView);
JS_INIT_CLASS_END(UIToolbar, UIView);

NAN_METHOD(NUIToolbar::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UIToolbar(...)', turn into construct call.
      JS_SET_RETURN_NEW(UIToolbar, info);
      return;
    }

    UIToolbar* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIToolbar *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIToolbar alloc] init];
    }
    if (self) {
      NUIToolbar *wrapper = new NUIToolbar();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIToolbar::New: invalid arguments");
    }
  }
}
