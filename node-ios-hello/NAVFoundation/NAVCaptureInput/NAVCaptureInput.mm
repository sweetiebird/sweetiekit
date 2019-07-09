//
//  NAVCaptureInput.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureInput.h"

#define instancetype AVCaptureInput
#define js_value_instancetype js_value_AVCaptureInput

NAVCaptureInput::NAVCaptureInput() {}
NAVCaptureInput::~NAVCaptureInput() {}

JS_INIT_CLASS(AVCaptureInput, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(ports);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureInput, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(AVCaptureInputPortFormatDescriptionDidChangeNotification, NSString); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

JS_INIT_CLASS_END(AVCaptureInput, NSObject);

NAN_METHOD(NAVCaptureInput::New) {
  JS_RECONSTRUCT(AVCaptureInput);
  @autoreleasepool {
    AVCaptureInput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureInput *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureInput *wrapper = new NAVCaptureInput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureInput::New: invalid arguments");
    }
  }
}

#include "NAVCaptureInputPort.h"

NAN_GETTER(NAVCaptureInput::portsGetter) {
  JS_UNWRAP(AVCaptureInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureInputPort*>([self ports]));
  }
}
