//
//  NAVCaptureDeviceDiscoverySession.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureDeviceDiscoverySession.h"

#define instancetype AVCaptureDeviceDiscoverySession
#define js_value_instancetype js_value_AVCaptureDeviceDiscoverySession

NAVCaptureDeviceDiscoverySession::NAVCaptureDeviceDiscoverySession() {}
NAVCaptureDeviceDiscoverySession::~NAVCaptureDeviceDiscoverySession() {}

JS_INIT_CLASS(AVCaptureDeviceDiscoverySession, NSObject);
  JS_ASSIGN_STATIC_METHOD(discoverySessionWithDeviceTypesMediaTypePosition);
  JS_ASSIGN_PROTO_PROP_READONLY(devices);
  JS_ASSIGN_PROTO_PROP_READONLY(supportedMultiCamDeviceSets);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureDeviceDiscoverySession, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureDeviceDiscoverySession, NSObject);

NAN_METHOD(NAVCaptureDeviceDiscoverySession::New) {
  JS_RECONSTRUCT(AVCaptureDeviceDiscoverySession);
  @autoreleasepool {
    AVCaptureDeviceDiscoverySession* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureDeviceDiscoverySession *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureDeviceDiscoverySession *wrapper = new NAVCaptureDeviceDiscoverySession();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureDeviceDiscoverySession::New: invalid arguments");
    }
  }
}

#include "NAVMediaFormat.h"
#include "NAVCaptureDevice.h"

NAN_METHOD(NAVCaptureDeviceDiscoverySession::discoverySessionWithDeviceTypesMediaTypePosition) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<AVCaptureDeviceType>, deviceTypes);
    declare_nullable_value(AVMediaType, mediaType);
    declare_value(AVCaptureDevicePosition, position);
    JS_SET_RETURN(js_value_instancetype([AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes: deviceTypes mediaType: mediaType position: position]));
  }
}

NAN_GETTER(NAVCaptureDeviceDiscoverySession::devicesGetter) {
  JS_UNWRAP(AVCaptureDeviceDiscoverySession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureDevice*>([self devices]));
  }
}

NAN_GETTER(NAVCaptureDeviceDiscoverySession::supportedMultiCamDeviceSetsGetter) {
  JS_UNWRAP(AVCaptureDeviceDiscoverySession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSSet<AVCaptureDevice*>*>([self supportedMultiCamDeviceSets]));
  }
}
