//
//  NVNImageBasedRequest.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNImageBasedRequest.h"

#import <Vision/VNRequest.h>

#define instancetype VNImageBasedRequest
#define js_value_instancetype js_value_VNImageBasedRequest

NVNImageBasedRequest::NVNImageBasedRequest() {}
NVNImageBasedRequest::~NVNImageBasedRequest() {}

JS_INIT_CLASS(VNImageBasedRequest, VNRequest);
  JS_ASSIGN_PROTO_PROP(regionOfInterest);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNImageBasedRequest, VNRequest);
  // constant values (exports)
JS_INIT_CLASS_END(VNImageBasedRequest, VNRequest);

NAN_METHOD(NVNImageBasedRequest::New) {
  JS_RECONSTRUCT(VNImageBasedRequest);
  @autoreleasepool {
    VNImageBasedRequest* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNImageBasedRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNImageBasedRequest alloc] init];
    }
    if (self) {
      NVNImageBasedRequest *wrapper = new NVNImageBasedRequest();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNImageBasedRequest::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNImageBasedRequest::regionOfInterestGetter) {
  JS_UNWRAP(VNImageBasedRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self regionOfInterest]));
  }
}

NAN_SETTER(NVNImageBasedRequest::regionOfInterestSetter) {
  JS_UNWRAP(VNImageBasedRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setRegionOfInterest: input];
  }
}
