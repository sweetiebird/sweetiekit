//
//  NVNSaliencyImageObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNSaliencyImageObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNSaliencyImageObservation
#define js_value_instancetype js_value_VNSaliencyImageObservation

NVNSaliencyImageObservation::NVNSaliencyImageObservation() {}
NVNSaliencyImageObservation::~NVNSaliencyImageObservation() {}

JS_INIT_CLASS(VNSaliencyImageObservation, VNPixelBufferObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(salientObjects);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNSaliencyImageObservation, VNPixelBufferObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNSaliencyImageObservation, VNPixelBufferObservation);

NAN_METHOD(NVNSaliencyImageObservation::New) {
  JS_RECONSTRUCT(VNSaliencyImageObservation);
  @autoreleasepool {
    VNSaliencyImageObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNSaliencyImageObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNSaliencyImageObservation alloc] init];
    }
    if (self) {
      NVNSaliencyImageObservation *wrapper = new NVNSaliencyImageObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNSaliencyImageObservation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNSaliencyImageObservation::salientObjectsGetter) {
  JS_UNWRAP(VNSaliencyImageObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<VNRectangleObservation*>([self salientObjects]));
  }
}
