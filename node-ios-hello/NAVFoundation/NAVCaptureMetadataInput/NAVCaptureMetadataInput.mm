//
//  NAVCaptureMetadataInput.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureMetadataInput.h"

#define instancetype AVCaptureMetadataInput
#define js_value_instancetype js_value_AVCaptureMetadataInput

NAVCaptureMetadataInput::NAVCaptureMetadataInput() {}
NAVCaptureMetadataInput::~NAVCaptureMetadataInput() {}

JS_INIT_CLASS(AVCaptureMetadataInput, AVCaptureInput);
  JS_ASSIGN_STATIC_METHOD(metadataInputWithFormatDescriptionClock);
  JS_ASSIGN_PROTO_METHOD(initWithFormatDescriptionClock);
  JS_ASSIGN_PROTO_METHOD(appendTimedMetadataGroupError);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureMetadataInput, AVCaptureInput);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureMetadataInput, AVCaptureInput);

NAN_METHOD(NAVCaptureMetadataInput::New) {
  JS_RECONSTRUCT(AVCaptureMetadataInput);
  @autoreleasepool {
    AVCaptureMetadataInput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureMetadataInput *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureMetadataInput *wrapper = new NAVCaptureMetadataInput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureMetadataInput::New: invalid arguments");
    }
  }
}

#include "NCMFormatDescription.h"
#include "NCMSync.h"

NAN_METHOD(NAVCaptureMetadataInput::metadataInputWithFormatDescriptionClock) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CMMetadataFormatDescriptionRef, desc);
    declare_value(CMClockRef, clock);
    JS_SET_RETURN(js_value_instancetype([AVCaptureMetadataInput metadataInputWithFormatDescription: desc clock: clock]));
  }
}

NAN_METHOD(NAVCaptureMetadataInput::initWithFormatDescriptionClock) {
  JS_UNWRAP_OR_ALLOC(AVCaptureMetadataInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CMMetadataFormatDescriptionRef, desc);
    declare_value(CMClockRef, clock);
    JS_SET_RETURN(js_value_instancetype([self initWithFormatDescription: desc clock: clock]));
  }
}

#include "NAVTimedMetadataGroup.h"

NAN_METHOD(NAVCaptureMetadataInput::appendTimedMetadataGroupError) {
  JS_UNWRAP(AVCaptureMetadataInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVTimedMetadataGroup, metadata);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self appendTimedMetadataGroup: metadata error: &error]));
    js_panic_NSError(error);
  }
}
