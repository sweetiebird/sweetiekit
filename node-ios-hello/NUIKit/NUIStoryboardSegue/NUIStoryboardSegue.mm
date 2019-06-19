//
//  NUIStoryboardSegue.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIStoryboardSegue.h"

#define instancetype UIStoryboardSegue
#define js_value_instancetype js_value_UIStoryboardSegue

NUIStoryboardSegue::NUIStoryboardSegue() {}
NUIStoryboardSegue::~NUIStoryboardSegue() {}

JS_INIT_CLASS(UIStoryboardSegue, NSObject);
  JS_ASSIGN_STATIC_METHOD(segueWithIdentifierSourceDestinationPerformHandler);
  JS_ASSIGN_PROTO_METHOD(initWithIdentifierSourceDestination);
  JS_ASSIGN_PROTO_METHOD(perform);
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
  JS_ASSIGN_PROTO_PROP_READONLY(sourceViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(destinationViewController);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIStoryboardSegue, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIStoryboardSegue, NSObject);

NAN_METHOD(NUIStoryboardSegue::New) {
  JS_RECONSTRUCT(UIStoryboardSegue);
  @autoreleasepool {
    UIStoryboardSegue* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIStoryboardSegue *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIStoryboardSegue *wrapper = new NUIStoryboardSegue();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIStoryboardSegue::New: invalid arguments");
    }
  }
}

#include "NUIViewController.h"

NAN_METHOD(NUIStoryboardSegue::segueWithIdentifierSourceDestinationPerformHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, identifier);
    declare_pointer(UIViewController, source);
    declare_pointer(UIViewController, destination);
    declare_callback(performHandler);
    JS_SET_RETURN(js_value_instancetype([UIStoryboardSegue segueWithIdentifier: identifier source: source destination: destination performHandler:^{
      dispatch_main(^{
        if (performHandler) {
          [performHandler jsFunction]->Call("NUIStoryboardSegue::segueWithIdentifierSourceDestinationPerformHandler");
          clear_callback(performHandler);
        }
      });
    }]));
  }
}

NAN_METHOD(NUIStoryboardSegue::initWithIdentifierSourceDestination) {
  JS_UNWRAP_OR_ALLOC(UIStoryboardSegue, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, identifier);
    declare_pointer(UIViewController, source);
    declare_pointer(UIViewController, destination);
    JS_SET_RETURN(js_value_instancetype([self initWithIdentifier: identifier source: source destination: destination]));
  }
}

NAN_METHOD(NUIStoryboardSegue::perform) {
  JS_UNWRAP(UIStoryboardSegue, self);
  declare_autoreleasepool {
    [self perform];
  }
}

NAN_GETTER(NUIStoryboardSegue::identifierGetter) {
  JS_UNWRAP(UIStoryboardSegue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_GETTER(NUIStoryboardSegue::sourceViewControllerGetter) {
  JS_UNWRAP(UIStoryboardSegue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self sourceViewController]));
  }
}

NAN_GETTER(NUIStoryboardSegue::destinationViewControllerGetter) {
  JS_UNWRAP(UIStoryboardSegue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self destinationViewController]));
  }
}

