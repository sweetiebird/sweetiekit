//
//  NVNHorizonObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNHorizonObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNHorizonObservation
#define js_value_instancetype js_value_VNHorizonObservation

NVNHorizonObservation::NVNHorizonObservation() {}
NVNHorizonObservation::~NVNHorizonObservation() {}

JS_INIT_CLASS(VNHorizonObservation, VNObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(transform);
  JS_ASSIGN_PROTO_PROP_READONLY(angle);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNHorizonObservation, VNObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNHorizonObservation, VNObservation);

NAN_METHOD(NVNHorizonObservation::New) {
  JS_RECONSTRUCT(VNHorizonObservation);
  @autoreleasepool {
    VNHorizonObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNHorizonObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNHorizonObservation alloc] init];
    }
    if (self) {
      NVNHorizonObservation *wrapper = new NVNHorizonObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNHorizonObservation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNHorizonObservation::transformGetter) {
  JS_UNWRAP(VNHorizonObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGAffineTransform([self transform]));
  }
}

NAN_GETTER(NVNHorizonObservation::angleGetter) {
  JS_UNWRAP(VNHorizonObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self angle]));
  }
}
