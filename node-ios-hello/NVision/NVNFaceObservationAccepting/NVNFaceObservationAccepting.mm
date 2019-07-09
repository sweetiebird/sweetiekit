//
//  NVNFaceObservationAccepting.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNFaceObservationAccepting.h"

#import <Vision/VNFaceObservationAccepting.h>

#define instancetype VNFaceObservationAccepting
#define js_value_instancetype js_value_VNFaceObservationAccepting

NVNFaceObservationAccepting::NVNFaceObservationAccepting() {}
NVNFaceObservationAccepting::~NVNFaceObservationAccepting() {}

JS_INIT_PROTOCOL(VNFaceObservationAccepting, NSObject);
  JS_ASSIGN_PROTO_PROP(inputFaceObservations);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNFaceObservationAccepting, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(VNFaceObservationAccepting, NSObject);

NAN_METHOD(NVNFaceObservationAccepting::New) {
  JS_RECONSTRUCT_PROTOCOL(VNFaceObservationAccepting);
  @autoreleasepool {
    id<VNFaceObservationAccepting> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<VNFaceObservationAccepting>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<VNFaceObservationAccepting> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], VNFaceObservationAccepting, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[VNFaceObservationAcceptingType alloc] init];
    }
    if (self) {
      NVNFaceObservationAccepting *wrapper = new NVNFaceObservationAccepting();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNFaceObservationAccepting::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNFaceObservationAccepting::inputFaceObservationsGetter) {
  JS_UNWRAP_PROTOCOL(VNFaceObservationAccepting, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<VNFaceObservation*>([self inputFaceObservations]));
  }
}

NAN_SETTER(NVNFaceObservationAccepting::inputFaceObservationsSetter) {
  JS_UNWRAP_PROTOCOL(VNFaceObservationAccepting, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<VNFaceObservation*>, input);
    [self setInputFaceObservations: input];
  }
}

@implementation VNFaceObservationAcceptingType
@end
