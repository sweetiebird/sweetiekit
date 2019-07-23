//
//  NVNDetectedObjectObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNDetectedObjectObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNDetectedObjectObservation
#define js_value_instancetype js_value_VNDetectedObjectObservation

NVNDetectedObjectObservation::NVNDetectedObjectObservation() {}
NVNDetectedObjectObservation::~NVNDetectedObjectObservation() {}

JS_INIT_CLASS(VNDetectedObjectObservation, VNObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(boundingBox);

  JS_ASSIGN_STATIC_METHOD(observationWithBoundingBox);
  JS_ASSIGN_STATIC_METHOD(observationWithRequestRevisionBoundingBox);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNDetectedObjectObservation, VNObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNDetectedObjectObservation, VNObservation);

NAN_METHOD(NVNDetectedObjectObservation::New) {
  JS_RECONSTRUCT(VNDetectedObjectObservation);
  @autoreleasepool {
    VNDetectedObjectObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNDetectedObjectObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNDetectedObjectObservation alloc] init];
    }
    if (self) {
      NVNDetectedObjectObservation *wrapper = new NVNDetectedObjectObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNDetectedObjectObservation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNDetectedObjectObservation::observationWithBoundingBox) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, boundingBox);
    JS_SET_RETURN(js_value_instancetype([VNDetectedObjectObservation observationWithBoundingBox: boundingBox]));
  }
}

NAN_METHOD(NVNDetectedObjectObservation::observationWithRequestRevisionBoundingBox) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, requestRevision);
    declare_value(CGRect, boundingBox);
    JS_SET_RETURN(js_value_instancetype([VNDetectedObjectObservation observationWithRequestRevision: requestRevision boundingBox: boundingBox]));
  }
}

NAN_GETTER(NVNDetectedObjectObservation::boundingBoxGetter) {
  JS_UNWRAP(VNDetectedObjectObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self boundingBox]));
  }
}
