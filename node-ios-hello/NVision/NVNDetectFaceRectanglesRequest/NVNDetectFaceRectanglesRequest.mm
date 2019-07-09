//
//  NVNDetectFaceRectanglesRequest.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNDetectFaceRectanglesRequest.h"

#import <Vision/VNDetectFaceRectanglesRequest.h>

#define instancetype VNDetectFaceRectanglesRequest
#define js_value_instancetype js_value_VNDetectFaceRectanglesRequest

NVNDetectFaceRectanglesRequest::NVNDetectFaceRectanglesRequest() {}
NVNDetectFaceRectanglesRequest::~NVNDetectFaceRectanglesRequest() {}

JS_INIT_CLASS(VNDetectFaceRectanglesRequest, VNImageBasedRequest);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNDetectFaceRectanglesRequest, VNImageBasedRequest);
  // constant values (exports)
JS_INIT_CLASS_END(VNDetectFaceRectanglesRequest, VNImageBasedRequest);

NAN_METHOD(NVNDetectFaceRectanglesRequest::New) {
  JS_RECONSTRUCT(VNDetectFaceRectanglesRequest);
  @autoreleasepool {
    VNDetectFaceRectanglesRequest* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNDetectFaceRectanglesRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNDetectFaceRectanglesRequest alloc] init];
    }
    if (self) {
      NVNDetectFaceRectanglesRequest *wrapper = new NVNDetectFaceRectanglesRequest();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNDetectFaceRectanglesRequest::New: invalid arguments");
    }
  }
}
