//
//  NVNRecognizedTextObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNRecognizedTextObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNRecognizedTextObservation
#define js_value_instancetype js_value_VNRecognizedTextObservation

NVNRecognizedTextObservation::NVNRecognizedTextObservation() {}
NVNRecognizedTextObservation::~NVNRecognizedTextObservation() {}

JS_INIT_CLASS(VNRecognizedTextObservation, VNRectangleObservation);
  JS_ASSIGN_PROTO_METHOD(topCandidates);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNRecognizedTextObservation, VNRectangleObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNRecognizedTextObservation, VNRectangleObservation);

NAN_METHOD(NVNRecognizedTextObservation::New) {
  JS_RECONSTRUCT(VNRecognizedTextObservation);
  @autoreleasepool {
    VNRecognizedTextObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNRecognizedTextObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNRecognizedTextObservation alloc] init];
    }
    if (self) {
      NVNRecognizedTextObservation *wrapper = new NVNRecognizedTextObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNRecognizedTextObservation::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNRecognizedTextObservation::topCandidates) {
  JS_UNWRAP(VNRecognizedTextObservation, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, maxCandidateCount);
    JS_SET_RETURN(js_value_NSArray<VNRecognizedText*>([self topCandidates: maxCandidateCount]));
  }
}
