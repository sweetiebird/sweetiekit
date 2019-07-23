//
//  NVNImageAlignmentObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNImageAlignmentObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNImageAlignmentObservation
#define js_value_instancetype js_value_VNImageAlignmentObservation

NVNImageAlignmentObservation::NVNImageAlignmentObservation() {}
NVNImageAlignmentObservation::~NVNImageAlignmentObservation() {}

JS_INIT_CLASS(VNImageAlignmentObservation, VNObservation);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNImageAlignmentObservation, VNObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNImageAlignmentObservation, VNObservation);

NAN_METHOD(NVNImageAlignmentObservation::New) {
  JS_RECONSTRUCT(VNImageAlignmentObservation);
  @autoreleasepool {
    VNImageAlignmentObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNImageAlignmentObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNImageAlignmentObservation alloc] init];
    }
    if (self) {
      NVNImageAlignmentObservation *wrapper = new NVNImageAlignmentObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNImageAlignmentObservation::New: invalid arguments");
    }
  }
}
