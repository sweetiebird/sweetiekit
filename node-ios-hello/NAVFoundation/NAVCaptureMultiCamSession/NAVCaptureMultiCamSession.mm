//
//  NAVCaptureMultiCamSession.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureMultiCamSession.h"

#define instancetype AVCaptureMultiCamSession
#define js_value_instancetype js_value_AVCaptureMultiCamSession

NAVCaptureMultiCamSession::NAVCaptureMultiCamSession() {}
NAVCaptureMultiCamSession::~NAVCaptureMultiCamSession() {}

JS_INIT_CLASS(AVCaptureMultiCamSession, AVCaptureSession);
  JS_ASSIGN_STATIC_PROP_READONLY(isMultiCamSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(hardwareCost);
  JS_ASSIGN_PROTO_PROP_READONLY(systemPressureCost);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureMultiCamSession, AVCaptureSession);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureMultiCamSession, AVCaptureSession);

NAN_METHOD(NAVCaptureMultiCamSession::New) {
  JS_RECONSTRUCT(AVCaptureMultiCamSession);
  @autoreleasepool {
    AVCaptureMultiCamSession* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureMultiCamSession *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVCaptureMultiCamSession alloc] init];
    }
    if (self) {
      NAVCaptureMultiCamSession *wrapper = new NAVCaptureMultiCamSession();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureMultiCamSession::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVCaptureMultiCamSession::isMultiCamSupportedGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([AVCaptureMultiCamSession isMultiCamSupported]));
  }
}

NAN_GETTER(NAVCaptureMultiCamSession::hardwareCostGetter) {
  JS_UNWRAP(AVCaptureMultiCamSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self hardwareCost]));
  }
}

NAN_GETTER(NAVCaptureMultiCamSession::systemPressureCostGetter) {
  JS_UNWRAP(AVCaptureMultiCamSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self systemPressureCost]));
  }
}
