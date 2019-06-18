//
//  NUIStoryboardUnwindSegueSource.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIStoryboardUnwindSegueSource.h"

#define instancetype UIStoryboardUnwindSegueSource
#define js_value_instancetype js_value_UIStoryboardUnwindSegueSource

NUIStoryboardUnwindSegueSource::NUIStoryboardUnwindSegueSource() {}
NUIStoryboardUnwindSegueSource::~NUIStoryboardUnwindSegueSource() {}

JS_INIT_CLASS(UIStoryboardUnwindSegueSource, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(sourceViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(unwindAction);
  JS_ASSIGN_PROTO_PROP_READONLY(sender);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIStoryboardUnwindSegueSource, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIStoryboardUnwindSegueSource, NSObject);

NAN_METHOD(NUIStoryboardUnwindSegueSource::New) {
  JS_RECONSTRUCT(UIStoryboardUnwindSegueSource);
  @autoreleasepool {
    UIStoryboardUnwindSegueSource* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIStoryboardUnwindSegueSource *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIStoryboardUnwindSegueSource *wrapper = new NUIStoryboardUnwindSegueSource();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIStoryboardUnwindSegueSource::New: invalid arguments");
    }
  }
}

#include "NUIViewController.h"

NAN_GETTER(NUIStoryboardUnwindSegueSource::sourceViewControllerGetter) {
  JS_UNWRAP(UIStoryboardUnwindSegueSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self sourceViewController]));
  }
}

NAN_GETTER(NUIStoryboardUnwindSegueSource::unwindActionGetter) {
  JS_UNWRAP(UIStoryboardUnwindSegueSource, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_SEL([self unwindAction]));
    #endif
  }
}

NAN_GETTER(NUIStoryboardUnwindSegueSource::senderGetter) {
  JS_UNWRAP(UIStoryboardUnwindSegueSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self sender]));
  }
}
