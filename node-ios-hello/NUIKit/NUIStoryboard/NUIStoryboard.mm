//
//  NUIStoryboard.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIStoryboard.h"

#define instancetype UIStoryboard
#define js_value_instancetype js_value_UIStoryboard

NUIStoryboard::NUIStoryboard() {}
NUIStoryboard::~NUIStoryboard() {}

JS_INIT_CLASS(UIStoryboard, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(instantiateInitialViewController);
  JS_ASSIGN_PROTO_METHOD(instantiateViewControllerWithIdentifier);
  JS_ASSIGN_PROTO_METHOD(instantiateViewController);
  // static members (ctor)
  JS_INIT_CTOR(UIStoryboard, NSObject);
  JS_ASSIGN_STATIC_METHOD(storyboardWithNameBundle);
JS_INIT_CLASS_END(UIStoryboard, NSObject);

#include "NNSBundle.h"

NAN_METHOD(NUIStoryboard::New) {
  JS_RECONSTRUCT(UIStoryboard);
  @autoreleasepool {
    UIStoryboard* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIStoryboard *)(info[0].As<External>()->Value());
    } else if (is_value_NSString(info[0])) {
      declare_args();
      declare_pointer(NSString, name);
      declare_nullable_pointer(NSBundle, bundle);
      self = [UIStoryboard storyboardWithName:name bundle:bundle];
    } else if (info.Length() <= 0) {
      self = [[UIStoryboard alloc] init];
    }
    if (self) {
      NUIStoryboard *wrapper = new NUIStoryboard();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIStoryboard::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIStoryboard::storyboardWithNameBundle) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSBundle, storyboardBundleOrNil);
    JS_SET_RETURN(js_value_UIStoryboard([UIStoryboard storyboardWithName: name bundle: storyboardBundleOrNil]));
  }
}

#include "NUIViewController.h"

NAN_METHOD(NUIStoryboard::instantiateInitialViewController) {
  JS_UNWRAP(UIStoryboard, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self instantiateInitialViewController]));
  }
}

NAN_METHOD(NUIStoryboard::instantiateViewControllerWithIdentifier) {
  JS_UNWRAP(UIStoryboard, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_UIViewController([self instantiateViewControllerWithIdentifier: identifier]));
  }
}

NAN_METHOD(NUIStoryboard::instantiateViewController) {
  JS_UNWRAP(UIStoryboard, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, identifier);
    if (identifier)
      JS_SET_RETURN(js_value_UIViewController([self instantiateViewControllerWithIdentifier: identifier]));
    else
      JS_SET_RETURN(js_value_UIViewController([self instantiateInitialViewController]));
  }
}

