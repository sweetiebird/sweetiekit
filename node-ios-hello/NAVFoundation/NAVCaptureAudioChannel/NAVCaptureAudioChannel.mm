//
//  NAVCaptureAudioChannel.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureAudioChannel.h"

#define instancetype AVCaptureAudioChannel
#define js_value_instancetype js_value_AVCaptureAudioChannel

NAVCaptureAudioChannel::NAVCaptureAudioChannel() {}
NAVCaptureAudioChannel::~NAVCaptureAudioChannel() {}

JS_INIT_CLASS(AVCaptureAudioChannel, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(averagePowerLevel);
  JS_ASSIGN_PROTO_PROP_READONLY(peakHoldLevel);
#if !defined(__IPHONEOS__) && !defined(__WATCHOS__) && !defined(__TVOS__)
  JS_ASSIGN_PROTO_PROP(volume);
  JS_ASSIGN_PROTO_PROP(isEnabled);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureAudioChannel, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureAudioChannel, NSObject);

NAN_METHOD(NAVCaptureAudioChannel::New) {
  JS_RECONSTRUCT(AVCaptureAudioChannel);
  @autoreleasepool {
    AVCaptureAudioChannel* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureAudioChannel *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureAudioChannel *wrapper = new NAVCaptureAudioChannel();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureAudioChannel::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVCaptureAudioChannel::averagePowerLevelGetter) {
  JS_UNWRAP(AVCaptureAudioChannel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self averagePowerLevel]));
  }
}

NAN_GETTER(NAVCaptureAudioChannel::peakHoldLevelGetter) {
  JS_UNWRAP(AVCaptureAudioChannel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self peakHoldLevel]));
  }
}

#if !defined(__IPHONEOS__) && !defined(__WATCHOS__) && !defined(__TVOS__)
NAN_GETTER(NAVCaptureAudioChannel::volumeGetter) {
  JS_UNWRAP(AVCaptureAudioChannel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self volume]));
  }
}

NAN_SETTER(NAVCaptureAudioChannel::volumeSetter) {
  JS_UNWRAP(AVCaptureAudioChannel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setVolume: input];
  }
}

NAN_GETTER(NAVCaptureAudioChannel::isEnabledGetter) {
  JS_UNWRAP(AVCaptureAudioChannel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NAVCaptureAudioChannel::isEnabledSetter) {
  JS_UNWRAP(AVCaptureAudioChannel, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}
#endif
