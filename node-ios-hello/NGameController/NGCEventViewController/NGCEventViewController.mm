//
//  NGCEventViewController.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGCEventViewController.h"

@import GameController;

#define instancetype GCEventViewController
#define js_value_instancetype js_value_GCEventViewController

NGCEventViewController::NGCEventViewController() {}
NGCEventViewController::~NGCEventViewController() {}

JS_INIT_CLASS(GCEventViewController, UIViewController);
  JS_ASSIGN_PROTO_PROP(controllerUserInteractionEnabled);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GCEventViewController, UIViewController);
  // constant values (exports)
JS_INIT_CLASS_END(GCEventViewController, UIViewController);

NAN_METHOD(NGCEventViewController::New) {
  JS_RECONSTRUCT(GCEventViewController);
  @autoreleasepool {
    GCEventViewController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GCEventViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GCEventViewController alloc] init];
    }
    if (self) {
      NGCEventViewController *wrapper = new NGCEventViewController();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GCEventViewController::New: invalid arguments");
    }
  }
}

NAN_GETTER(NGCEventViewController::controllerUserInteractionEnabledGetter) {
  JS_UNWRAP(GCEventViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self controllerUserInteractionEnabled]));
  }
}

NAN_SETTER(NGCEventViewController::controllerUserInteractionEnabledSetter) {
  JS_UNWRAP(GCEventViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setControllerUserInteractionEnabled: input];
  }
}
