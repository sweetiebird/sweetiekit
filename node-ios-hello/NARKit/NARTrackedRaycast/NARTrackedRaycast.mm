//
//  NARTrackedRaycast.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARTrackedRaycast.h"

#define instancetype ARTrackedRaycast
#define js_value_instancetype js_value_ARTrackedRaycast

NARTrackedRaycast::NARTrackedRaycast() {}
NARTrackedRaycast::~NARTrackedRaycast() {}

JS_INIT_CLASS(ARTrackedRaycast, NSObject);
  JS_ASSIGN_PROTO_METHOD(updateQuery);
  JS_ASSIGN_PROTO_METHOD(stopTracking);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARTrackedRaycast, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(ARTrackedRaycast, NSObject);

NAN_METHOD(NARTrackedRaycast::New) {
  JS_RECONSTRUCT(ARTrackedRaycast);
  @autoreleasepool {
    ARTrackedRaycast* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARTrackedRaycast *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARTrackedRaycast *wrapper = new NARTrackedRaycast();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARTrackedRaycast::New: invalid arguments");
    }
  }
}

#include "NARRaycastQuery.h"

NAN_METHOD(NARTrackedRaycast::updateQuery) {
  JS_UNWRAP(ARTrackedRaycast, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARRaycastQuery, query);
    [self updateQuery: query];
  }
}

NAN_METHOD(NARTrackedRaycast::stopTracking) {
  JS_UNWRAP(ARTrackedRaycast, self);
  declare_autoreleasepool {
    [self stopTracking];
  }
}
