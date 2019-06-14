//
//  NUISearchController.mm
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISearchController.h"

#define instancetype UISearchController
#define js_value_instancetype js_value_UISearchController

NUISearchController::NUISearchController() {}
NUISearchController::~NUISearchController() {}

JS_INIT_CLASS(UISearchController, UIViewController);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UISearchController, UIViewController);
  // constant values (exports)
JS_INIT_CLASS_END(UISearchController, UIViewController);

NAN_METHOD(NUISearchController::New) {
  JS_RECONSTRUCT(UISearchController);
  @autoreleasepool {
    UISearchController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UISearchController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UISearchController alloc] init];
    }
    if (self) {
      NUISearchController *wrapper = new NUISearchController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISearchController::New: invalid arguments");
    }
  }
}
