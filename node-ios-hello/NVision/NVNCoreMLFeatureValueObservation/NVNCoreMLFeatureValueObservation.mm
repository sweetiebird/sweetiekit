//
//  NVNCoreMLFeatureValueObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNCoreMLFeatureValueObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNCoreMLFeatureValueObservation
#define js_value_instancetype js_value_VNCoreMLFeatureValueObservation

NVNCoreMLFeatureValueObservation::NVNCoreMLFeatureValueObservation() {}
NVNCoreMLFeatureValueObservation::~NVNCoreMLFeatureValueObservation() {}

JS_INIT_CLASS(VNCoreMLFeatureValueObservation, VNObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(featureValue);
  JS_ASSIGN_PROTO_PROP_READONLY(featureName);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNCoreMLFeatureValueObservation, VNObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNCoreMLFeatureValueObservation, VNObservation);

NAN_METHOD(NVNCoreMLFeatureValueObservation::New) {
  JS_RECONSTRUCT(VNCoreMLFeatureValueObservation);
  @autoreleasepool {
    VNCoreMLFeatureValueObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNCoreMLFeatureValueObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNCoreMLFeatureValueObservation alloc] init];
    }
    if (self) {
      NVNCoreMLFeatureValueObservation *wrapper = new NVNCoreMLFeatureValueObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNCoreMLFeatureValueObservation::New: invalid arguments");
    }
  }
}

#define js_value_MLFeatureValue(x) js_value_wrapper_unknown(x, MLFeatureValue)
#define to_value_MLFeatureValue(x) to_value_wrapper_unknown(x, MLFeatureValue)
#define is_value_MLFeatureValue(x) is_value_wrapper_unknown(x, MLFeatureValue)

NAN_GETTER(NVNCoreMLFeatureValueObservation::featureValueGetter) {
  JS_UNWRAP(VNCoreMLFeatureValueObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MLFeatureValue([self featureValue]));
  }
}

NAN_GETTER(NVNCoreMLFeatureValueObservation::featureNameGetter) {
  JS_UNWRAP(VNCoreMLFeatureValueObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self featureName]));
  }
}
