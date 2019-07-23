//
//  NVNPixelBufferObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNPixelBufferObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNPixelBufferObservation
#define js_value_instancetype js_value_VNPixelBufferObservation

NVNPixelBufferObservation::NVNPixelBufferObservation() {}
NVNPixelBufferObservation::~NVNPixelBufferObservation() {}

JS_INIT_CLASS(VNPixelBufferObservation, VNObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(pixelBuffer);
  JS_ASSIGN_PROTO_PROP_READONLY(featureName);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNPixelBufferObservation, VNObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNPixelBufferObservation, VNObservation);

NAN_METHOD(NVNPixelBufferObservation::New) {
  JS_RECONSTRUCT(VNPixelBufferObservation);
  @autoreleasepool {
    VNPixelBufferObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNPixelBufferObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNPixelBufferObservation alloc] init];
    }
    if (self) {
      NVNPixelBufferObservation *wrapper = new NVNPixelBufferObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNPixelBufferObservation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNPixelBufferObservation::pixelBufferGetter) {
  JS_UNWRAP(VNPixelBufferObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CVPixelBufferRef([self pixelBuffer]));
  }
}

NAN_GETTER(NVNPixelBufferObservation::featureNameGetter) {
  JS_UNWRAP(VNPixelBufferObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self featureName]));
  }
}
