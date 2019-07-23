//
//  NARSessionProviding.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSessionProviding.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define instancetype ARSessionProviding
#define js_value_instancetype js_value_ARSessionProviding

NARSessionProviding::NARSessionProviding() {}
NARSessionProviding::~NARSessionProviding() {}

JS_INIT_PROTOCOL(ARSessionProviding, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(session);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSessionProviding, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(ARSessionProviding, NSObject);

NAN_METHOD(NARSessionProviding::New) {
  JS_RECONSTRUCT_PROTOCOL(ARSessionProviding);
  @autoreleasepool {
    id<ARSessionProviding> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<ARSessionProviding>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<ARSessionProviding> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], ARSessionProviding, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[ARSessionProvidingType alloc] init];
    }
    if (self) {
      NARSessionProviding *wrapper = new NARSessionProviding();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSessionProviding::New: invalid arguments");
    }
  }
}

#include "NARSession.h"

NAN_GETTER(NARSessionProviding::sessionGetter) {
  JS_UNWRAP_PROTOCOL(ARSessionProviding, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARSession([self session]));
  }
}

@implementation ARSessionProvidingType
@end

#endif
