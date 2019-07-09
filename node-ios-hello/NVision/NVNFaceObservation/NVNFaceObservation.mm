//
//  NVNFaceObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNFaceObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNFaceObservation
#define js_value_instancetype js_value_VNFaceObservation

NVNFaceObservation::NVNFaceObservation() {}
NVNFaceObservation::~NVNFaceObservation() {}

JS_INIT_CLASS(VNFaceObservation, VNDetectedObjectObservation);
  JS_ASSIGN_STATIC_METHOD(faceObservationWithRequestRevisionBoundingBoxRollYaw);
  JS_ASSIGN_PROTO_PROP_READONLY(landmarks);
  JS_ASSIGN_PROTO_PROP_READONLY(faceCaptureQuality);
  JS_ASSIGN_PROTO_PROP_READONLY(roll);
  JS_ASSIGN_PROTO_PROP_READONLY(yaw);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNFaceObservation, VNDetectedObjectObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNFaceObservation, VNDetectedObjectObservation);

NAN_METHOD(NVNFaceObservation::New) {
  JS_RECONSTRUCT(VNFaceObservation);
  @autoreleasepool {
    VNFaceObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNFaceObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNFaceObservation alloc] init];
    }
    if (self) {
      NVNFaceObservation *wrapper = new NVNFaceObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNFaceObservation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNFaceObservation::faceObservationWithRequestRevisionBoundingBoxRollYaw) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, requestRevision);
    declare_value(CGRect, boundingBox);
    declare_nullable_pointer(NSNumber, roll);
    declare_nullable_pointer(NSNumber, yaw);
    JS_SET_RETURN(js_value_instancetype([VNFaceObservation faceObservationWithRequestRevision: requestRevision boundingBox: boundingBox roll: roll yaw: yaw]));
  }
}

#define js_value_VNFaceLandmarks2D(x) js_value_wrapper_unknown(x, VNFaceLandmarks2D)
#define to_value_VNFaceLandmarks2D(x) to_value_wrapper_unknown(x, VNFaceLandmarks2D)
#define is_value_VNFaceLandmarks2D(x) is_value_wrapper_unknown(x, VNFaceLandmarks2D)

NAN_GETTER(NVNFaceObservation::landmarksGetter) {
  JS_UNWRAP(VNFaceObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_VNFaceLandmarks2D([self landmarks]));
  }
}

NAN_GETTER(NVNFaceObservation::faceCaptureQualityGetter) {
  JS_UNWRAP(VNFaceObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self faceCaptureQuality]));
  }
}

NAN_GETTER(NVNFaceObservation::rollGetter) {
  JS_UNWRAP(VNFaceObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self roll]));
  }
}

NAN_GETTER(NVNFaceObservation::yawGetter) {
  JS_UNWRAP(VNFaceObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self yaw]));
  }
}
