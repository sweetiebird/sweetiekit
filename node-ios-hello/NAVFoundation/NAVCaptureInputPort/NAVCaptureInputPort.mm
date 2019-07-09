//
//  NAVCaptureInputPort.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureInputPort.h"

#define instancetype AVCaptureInputPort
#define js_value_instancetype js_value_AVCaptureInputPort

NAVCaptureInputPort::NAVCaptureInputPort() {}
NAVCaptureInputPort::~NAVCaptureInputPort() {}

JS_INIT_CLASS(AVCaptureInputPort, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(input);
  JS_ASSIGN_PROTO_PROP_READONLY(mediaType);
  JS_ASSIGN_PROTO_PROP_READONLY(formatDescription);
  JS_ASSIGN_PROTO_PROP(isEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(clock);
  #if TARGET_OS_IPHONE_13_0
    JS_ASSIGN_PROTO_PROP_READONLY(sourceDeviceType);
    JS_ASSIGN_PROTO_PROP_READONLY(sourceDevicePosition);
  #endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureInputPort, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureInputPort, NSObject);

NAN_METHOD(NAVCaptureInputPort::New) {
  JS_RECONSTRUCT(AVCaptureInputPort);
  @autoreleasepool {
    AVCaptureInputPort* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureInputPort *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureInputPort *wrapper = new NAVCaptureInputPort();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureInputPort::New: invalid arguments");
    }
  }
}

#include "NAVCaptureInput.h"

NAN_GETTER(NAVCaptureInputPort::inputGetter) {
  JS_UNWRAP(AVCaptureInputPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureInput([self input]));
  }
}

#include "NAVMediaFormat.h"

NAN_GETTER(NAVCaptureInputPort::mediaTypeGetter) {
  JS_UNWRAP(AVCaptureInputPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVMediaType([self mediaType]));
  }
}

#include "NCMFormatDescription.h"

NAN_GETTER(NAVCaptureInputPort::formatDescriptionGetter) {
  JS_UNWRAP(AVCaptureInputPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMFormatDescriptionRef([self formatDescription]));
  }
}

NAN_GETTER(NAVCaptureInputPort::isEnabledGetter) {
  JS_UNWRAP(AVCaptureInputPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NAVCaptureInputPort::isEnabledSetter) {
  JS_UNWRAP(AVCaptureInputPort, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}

#include "NCMSync.h"

NAN_GETTER(NAVCaptureInputPort::clockGetter) {
  JS_UNWRAP(AVCaptureInputPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMClockRef([self clock]));
  }
}

#include "NAVCaptureDevice.h"

#if TARGET_OS_IPHONE_13_0
  NAN_GETTER(NAVCaptureInputPort::sourceDeviceTypeGetter) {
    JS_UNWRAP(AVCaptureInputPort, self);
    declare_autoreleasepool {
      JS_SET_RETURN(js_value_AVCaptureDeviceType([self sourceDeviceType]));
    }
  }

  NAN_GETTER(NAVCaptureInputPort::sourceDevicePositionGetter) {
    JS_UNWRAP(AVCaptureInputPort, self);
    declare_autoreleasepool {
      JS_SET_RETURN(js_value_AVCaptureDevicePosition([self sourceDevicePosition]));
    }
  }
#endif
