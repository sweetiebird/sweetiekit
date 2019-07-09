//
//  NVNDetectTextRectanglesRequest.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNDetectTextRectanglesRequest.h"

#import <Vision/VNDetectTextRectanglesRequest.h>

#define instancetype VNDetectTextRectanglesRequest
#define js_value_instancetype js_value_VNDetectTextRectanglesRequest

NVNDetectTextRectanglesRequest::NVNDetectTextRectanglesRequest() {}
NVNDetectTextRectanglesRequest::~NVNDetectTextRectanglesRequest() {}

JS_INIT_CLASS(VNDetectTextRectanglesRequest, VNImageBasedRequest);
  JS_ASSIGN_PROTO_PROP(reportCharacterBoxes);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNDetectTextRectanglesRequest, VNImageBasedRequest);
  // constant values (exports)
JS_INIT_CLASS_END(VNDetectTextRectanglesRequest, VNImageBasedRequest);

NAN_METHOD(NVNDetectTextRectanglesRequest::New) {
  JS_RECONSTRUCT(VNDetectTextRectanglesRequest);
  @autoreleasepool {
    VNDetectTextRectanglesRequest* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNDetectTextRectanglesRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNDetectTextRectanglesRequest alloc] init];
    }
    if (self) {
      NVNDetectTextRectanglesRequest *wrapper = new NVNDetectTextRectanglesRequest();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNDetectTextRectanglesRequest::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNDetectTextRectanglesRequest::reportCharacterBoxesGetter) {
  JS_UNWRAP(VNDetectTextRectanglesRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self reportCharacterBoxes]));
  }
}

NAN_SETTER(NVNDetectTextRectanglesRequest::reportCharacterBoxesSetter) {
  JS_UNWRAP(VNDetectTextRectanglesRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setReportCharacterBoxes: input];
  }
}
