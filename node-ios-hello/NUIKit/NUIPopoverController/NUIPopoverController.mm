//
//  NUIPopoverController.mm
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPopoverController.h"

#define instancetype UIPopoverController
#define js_value_instancetype js_value_UIPopoverController

NUIPopoverController::NUIPopoverController() {}
NUIPopoverController::~NUIPopoverController() {}

JS_INIT_CLASS(UIPopoverController, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIPopoverController, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIPopoverController, NSObject);

NAN_METHOD(NUIPopoverController::New) {
  JS_RECONSTRUCT(UIPopoverController);
  @autoreleasepool {
    UIPopoverController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIPopoverController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIPopoverController alloc] init];
    }
    if (self) {
      NUIPopoverController *wrapper = new NUIPopoverController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPopoverController::New: invalid arguments");
    }
  }
}
