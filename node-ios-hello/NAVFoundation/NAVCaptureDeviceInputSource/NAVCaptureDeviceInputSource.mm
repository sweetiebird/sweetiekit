//
//  NAVCaptureDeviceInputSource.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureDeviceInputSource.h"

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV

#define instancetype AVCaptureDeviceInputSource
#define js_value_instancetype js_value_AVCaptureDeviceInputSource

NAVCaptureDeviceInputSource::NAVCaptureDeviceInputSource() {}
NAVCaptureDeviceInputSource::~NAVCaptureDeviceInputSource() {}

JS_INIT_CLASS(AVCaptureDeviceInputSource, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(inputSourceID);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedName);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureDeviceInputSource, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureDeviceInputSource, NSObject);

NAN_METHOD(NAVCaptureDeviceInputSource::New) {
  JS_RECONSTRUCT(AVCaptureDeviceInputSource);
  @autoreleasepool {
    AVCaptureDeviceInputSource* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureDeviceInputSource *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVCaptureDeviceInputSource alloc] init];
    }
    if (self) {
      NAVCaptureDeviceInputSource *wrapper = new NAVCaptureDeviceInputSource();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureDeviceInputSource::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVCaptureDeviceInputSource::inputSourceIDGetter) {
  JS_UNWRAP(AVCaptureDeviceInputSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self inputSourceID]));
  }
}

NAN_GETTER(NAVCaptureDeviceInputSource::localizedNameGetter) {
  JS_UNWRAP(AVCaptureDeviceInputSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedName]));
  }
}

#endif // #if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
