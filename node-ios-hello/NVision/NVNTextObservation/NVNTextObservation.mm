//
//  NVNTextObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNTextObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNTextObservation
#define js_value_instancetype js_value_VNTextObservation

NVNTextObservation::NVNTextObservation() {}
NVNTextObservation::~NVNTextObservation() {}

JS_INIT_CLASS(VNTextObservation, VNRectangleObservation);
  JS_ASSIGN_PROTO_PROP_READONLY(characterBoxes);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNTextObservation, VNRectangleObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNTextObservation, VNRectangleObservation);

NAN_METHOD(NVNTextObservation::New) {
  JS_RECONSTRUCT(VNTextObservation);
  @autoreleasepool {
    VNTextObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNTextObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNTextObservation alloc] init];
    }
    if (self) {
      NVNTextObservation *wrapper = new NVNTextObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNTextObservation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNTextObservation::characterBoxesGetter) {
  JS_UNWRAP(VNTextObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<VNRectangleObservation*>([self characterBoxes]));
  }
}
