//
//  NAVCaptureDeviceInput.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureDeviceInput.h"

#define instancetype AVCaptureDeviceInput
#define js_value_instancetype js_value_AVCaptureDeviceInput

NAVCaptureDeviceInput::NAVCaptureDeviceInput() {}
NAVCaptureDeviceInput::~NAVCaptureDeviceInput() {}

JS_INIT_CLASS(AVCaptureDeviceInput, AVCaptureInput);
  JS_ASSIGN_STATIC_METHOD(deviceInputWithDeviceError);
  JS_ASSIGN_PROTO_METHOD(initWithDeviceError);
  #if TARGET_OS_IPHONE_13_0
    JS_ASSIGN_PROTO_METHOD(portsWithMediaTypeSourceDeviceTypeSourceDevicePosition);
  #endif
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP(unifiedAutoExposureDefaultsEnabled);
  #if TARGET_OS_IPHONE_13_0
    JS_ASSIGN_PROTO_PROP(videoMinFrameDurationOverride);
  #endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureDeviceInput, AVCaptureInput);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureDeviceInput, AVCaptureInput);

NAN_METHOD(NAVCaptureDeviceInput::New) {
  JS_RECONSTRUCT(AVCaptureDeviceInput);
  @autoreleasepool {
    AVCaptureDeviceInput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureDeviceInput *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureDeviceInput *wrapper = new NAVCaptureDeviceInput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureDeviceInput::New: invalid arguments");
    }
  }
}

#include "NAVCaptureDevice.h"

NAN_METHOD(NAVCaptureDeviceInput::deviceInputWithDeviceError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureDevice, device);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([AVCaptureDeviceInput deviceInputWithDevice: device error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVCaptureDeviceInput::initWithDeviceError) {
  JS_UNWRAP_OR_ALLOC(AVCaptureDeviceInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureDevice, device);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([self initWithDevice: device error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAVMediaFormat.h"

#if TARGET_OS_IPHONE_13_0
  NAN_METHOD(NAVCaptureDeviceInput::portsWithMediaTypeSourceDeviceTypeSourceDevicePosition) {
    JS_UNWRAP(AVCaptureDeviceInput, self);
    declare_autoreleasepool {
      declare_args();
      declare_nullable_value(AVMediaType, mediaType);
      declare_nullable_value(AVCaptureDeviceType, sourceDeviceType);
      declare_value(AVCaptureDevicePosition, sourceDevicePosition);
      JS_SET_RETURN(js_value_NSArray<AVCaptureInputPort*>([self portsWithMediaType: mediaType sourceDeviceType: sourceDeviceType sourceDevicePosition: sourceDevicePosition]));
    }
  }
#endif

NAN_GETTER(NAVCaptureDeviceInput::deviceGetter) {
  JS_UNWRAP(AVCaptureDeviceInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDevice([self device]));
  }
}

NAN_GETTER(NAVCaptureDeviceInput::unifiedAutoExposureDefaultsEnabledGetter) {
  JS_UNWRAP(AVCaptureDeviceInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self unifiedAutoExposureDefaultsEnabled]));
  }
}

NAN_SETTER(NAVCaptureDeviceInput::unifiedAutoExposureDefaultsEnabledSetter) {
  JS_UNWRAP(AVCaptureDeviceInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUnifiedAutoExposureDefaultsEnabled: input];
  }
}

#include "NCMTime.h"

#if TARGET_OS_IPHONE_13_0
  NAN_GETTER(NAVCaptureDeviceInput::videoMinFrameDurationOverrideGetter) {
    JS_UNWRAP(AVCaptureDeviceInput, self);
    declare_autoreleasepool {
      JS_SET_RETURN(js_value_CMTime([self videoMinFrameDurationOverride]));
    }
  }

  NAN_SETTER(NAVCaptureDeviceInput::videoMinFrameDurationOverrideSetter) {
    JS_UNWRAP(AVCaptureDeviceInput, self);
    declare_autoreleasepool {
      declare_setter();
      declare_value(CMTime, input);
      [self setVideoMinFrameDurationOverride: input];
    }
  }
#endif
