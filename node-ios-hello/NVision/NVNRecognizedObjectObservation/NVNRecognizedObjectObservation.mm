//
//  NVNRecognizedObjectObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNRecognizedObjectObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNRecognizedObjectObservation
#define js_value_instancetype js_value_VNRecognizedObjectObservation

NVNRecognizedObjectObservation::NVNRecognizedObjectObservation() {}
NVNRecognizedObjectObservation::~NVNRecognizedObjectObservation() {}

JS_INIT_CLASS(VNRecognizedObjectObservation, VNDetectedObjectObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(labels);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNRecognizedObjectObservation, VNDetectedObjectObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNRecognizedObjectObservation, VNDetectedObjectObservation);

NAN_METHOD(NVNRecognizedObjectObservation::New) {
  JS_RECONSTRUCT(VNRecognizedObjectObservation);
  @autoreleasepool {
    VNRecognizedObjectObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNRecognizedObjectObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNRecognizedObjectObservation alloc] init];
    }
    if (self) {
      NVNRecognizedObjectObservation *wrapper = new NVNRecognizedObjectObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNRecognizedObjectObservation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNRecognizedObjectObservation::labelsGetter) {
  JS_UNWRAP(VNRecognizedObjectObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<VNClassificationObservation*>([self labels]));
  }
}
