//
//  NVNImageTranslationAlignmentObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNImageTranslationAlignmentObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNImageTranslationAlignmentObservation
#define js_value_instancetype js_value_VNImageTranslationAlignmentObservation

NVNImageTranslationAlignmentObservation::NVNImageTranslationAlignmentObservation() {}
NVNImageTranslationAlignmentObservation::~NVNImageTranslationAlignmentObservation() {}

JS_INIT_CLASS(VNImageTranslationAlignmentObservation, VNImageAlignmentObservation);
  JS_ASSIGN_PROTO_PROP(alignmentTransform);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNImageTranslationAlignmentObservation, VNImageAlignmentObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNImageTranslationAlignmentObservation, VNImageAlignmentObservation);

NAN_METHOD(NVNImageTranslationAlignmentObservation::New) {
  JS_RECONSTRUCT(VNImageTranslationAlignmentObservation);
  @autoreleasepool {
    VNImageTranslationAlignmentObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNImageTranslationAlignmentObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNImageTranslationAlignmentObservation alloc] init];
    }
    if (self) {
      NVNImageTranslationAlignmentObservation *wrapper = new NVNImageTranslationAlignmentObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNImageTranslationAlignmentObservation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNImageTranslationAlignmentObservation::alignmentTransformGetter) {
  JS_UNWRAP(VNImageTranslationAlignmentObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGAffineTransform([self alignmentTransform]));
  }
}

NAN_SETTER(NVNImageTranslationAlignmentObservation::alignmentTransformSetter) {
  JS_UNWRAP(VNImageTranslationAlignmentObservation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGAffineTransform, input);
    [self setAlignmentTransform: input];
  }
}
