//
//  NVNRectangleObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNRectangleObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNRectangleObservation
#define js_value_instancetype js_value_VNRectangleObservation

NVNRectangleObservation::NVNRectangleObservation() {}
NVNRectangleObservation::~NVNRectangleObservation() {}

JS_INIT_CLASS(VNRectangleObservation, VNDetectedObjectObservation);
  JS_ASSIGN_STATIC_METHOD(rectangleObservationWithRequestRevisionTopLeftBottomLeftBottomRightTopRight);
  JS_ASSIGN_PROTO_PROP_READONLY(topLeft);
  JS_ASSIGN_PROTO_PROP_READONLY(topRight);
  JS_ASSIGN_PROTO_PROP_READONLY(bottomLeft);
  JS_ASSIGN_PROTO_PROP_READONLY(bottomRight);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNRectangleObservation, VNDetectedObjectObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNRectangleObservation, VNDetectedObjectObservation);

NAN_METHOD(NVNRectangleObservation::New) {
  JS_RECONSTRUCT(VNRectangleObservation);
  @autoreleasepool {
    VNRectangleObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNRectangleObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNRectangleObservation alloc] init];
    }
    if (self) {
      NVNRectangleObservation *wrapper = new NVNRectangleObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNRectangleObservation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNRectangleObservation::rectangleObservationWithRequestRevisionTopLeftBottomLeftBottomRightTopRight) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, requestRevision);
    declare_value(CGPoint, topLeft);
    declare_value(CGPoint, bottomLeft);
    declare_value(CGPoint, bottomRight);
    declare_value(CGPoint, topRight);
    JS_SET_RETURN(js_value_instancetype([VNRectangleObservation rectangleObservationWithRequestRevision: requestRevision topLeft: topLeft bottomLeft: bottomLeft bottomRight: bottomRight topRight: topRight]));
  }
}

NAN_GETTER(NVNRectangleObservation::topLeftGetter) {
  JS_UNWRAP(VNRectangleObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self topLeft]));
  }
}

NAN_GETTER(NVNRectangleObservation::topRightGetter) {
  JS_UNWRAP(VNRectangleObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self topRight]));
  }
}

NAN_GETTER(NVNRectangleObservation::bottomLeftGetter) {
  JS_UNWRAP(VNRectangleObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self bottomLeft]));
  }
}

NAN_GETTER(NVNRectangleObservation::bottomRightGetter) {
  JS_UNWRAP(VNRectangleObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self bottomRight]));
  }
}
