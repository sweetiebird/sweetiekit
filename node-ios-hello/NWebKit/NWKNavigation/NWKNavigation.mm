//
//  NWKNavigation.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NWKNavigation.h"

#define instancetype WKNavigation
#define js_value_instancetype js_value_WKNavigation

NWKNavigation::NWKNavigation() {}
NWKNavigation::~NWKNavigation() {}

JS_INIT_CLASS(WKNavigation, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(WKNavigation, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(WKNavigation, NSObject);

NAN_METHOD(NWKNavigation::New) {
  JS_RECONSTRUCT(WKNavigation);
  @autoreleasepool {
    WKNavigation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge WKNavigation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[WKNavigation alloc] init];
    }
    if (self) {
      NWKNavigation *wrapper = new NWKNavigation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("WKNavigation::New: invalid arguments");
    }
  }
}
