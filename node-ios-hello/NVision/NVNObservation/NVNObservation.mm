//
//  NVNObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNObservation
#define js_value_instancetype js_value_VNObservation

NVNObservation::NVNObservation() {}
NVNObservation::~NVNObservation() {}

JS_INIT_CLASS(VNObservation, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(uuid);
  JS_ASSIGN_PROTO_PROP_READONLY(confidence);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNObservation, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(VNObservation, NSObject);

NAN_METHOD(NVNObservation::New) {
  JS_RECONSTRUCT(VNObservation);
  @autoreleasepool {
    VNObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNObservation alloc] init];
    }
    if (self) {
      NVNObservation *wrapper = new NVNObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNObservation::New: invalid arguments");
    }
  }
}

#include "NNSUUID.h"

NAN_GETTER(NVNObservation::uuidGetter) {
  JS_UNWRAP(VNObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUUID([self uuid]));
  }
}

#include "NVNTypes.h"

NAN_GETTER(NVNObservation::confidenceGetter) {
  JS_UNWRAP(VNObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_VNConfidence([self confidence]));
  }
}
