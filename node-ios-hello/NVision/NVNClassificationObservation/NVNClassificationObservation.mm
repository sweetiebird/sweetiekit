//
//  NVNClassificationObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNClassificationObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNClassificationObservation
#define js_value_instancetype js_value_VNClassificationObservation

NVNClassificationObservation::NVNClassificationObservation() {}
NVNClassificationObservation::~NVNClassificationObservation() {}

JS_INIT_CLASS(VNClassificationObservation, VNObservation);
  JS_ASSIGN_PROTO_METHOD(hasMinimumRecallForPrecision);
  JS_ASSIGN_PROTO_METHOD(hasMinimumPrecisionForRecall);
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
  JS_ASSIGN_PROTO_PROP_READONLY(hasPrecisionRecallCurve);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNClassificationObservation, VNObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNClassificationObservation, VNObservation);

NAN_METHOD(NVNClassificationObservation::New) {
  JS_RECONSTRUCT(VNClassificationObservation);
  @autoreleasepool {
    VNClassificationObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNClassificationObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNClassificationObservation alloc] init];
    }
    if (self) {
      NVNClassificationObservation *wrapper = new NVNClassificationObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNClassificationObservation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNClassificationObservation::hasMinimumRecallForPrecision) {
  JS_UNWRAP(VNClassificationObservation, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, minimumRecall);
    declare_value(float, precision);
    JS_SET_RETURN(js_value_BOOL([self hasMinimumRecall: minimumRecall forPrecision: precision]));
  }
}

NAN_METHOD(NVNClassificationObservation::hasMinimumPrecisionForRecall) {
  JS_UNWRAP(VNClassificationObservation, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, minimumPrecision);
    declare_value(float, recall);
    JS_SET_RETURN(js_value_BOOL([self hasMinimumPrecision: minimumPrecision forRecall: recall]));
  }
}

NAN_GETTER(NVNClassificationObservation::identifierGetter) {
  JS_UNWRAP(VNClassificationObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_GETTER(NVNClassificationObservation::hasPrecisionRecallCurveGetter) {
  JS_UNWRAP(VNClassificationObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasPrecisionRecallCurve]));
  }
}
