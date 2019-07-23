//
//  NAVCaptureSystemPressureState.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureSystemPressureState.h"

#define instancetype AVCaptureSystemPressureState
#define js_value_instancetype js_value_AVCaptureSystemPressureState

NAVCaptureSystemPressureState::NAVCaptureSystemPressureState() {}
NAVCaptureSystemPressureState::~NAVCaptureSystemPressureState() {}

JS_INIT_CLASS(AVCaptureSystemPressureState, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(level);
  JS_ASSIGN_PROTO_PROP_READONLY(factors);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureSystemPressureState, NSObject);
  // constant values (exports)

  /*!
   @group AVCaptureSystemPressureLevel string constants
   
   @discussion
      The AVCaptureSystemPressureLevel string constants describe varying levels of system pressure that affect capture hardware availability and/or quality.
   */
#if !TARGET_OS_MAC && !TARGET_OS_WATCH && !TARGET_OS_TV
//typedef NSString *AVCaptureSystemPressureLevel NS_STRING_ENUM API_AVAILABLE(ios(11.1)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

  /*!
   @constant AVCaptureSystemPressureLevelNominal
      System pressure level is normal (not pressured).
   */
  JS_ASSIGN_ENUM(AVCaptureSystemPressureLevelNominal, NSString); //  API_AVAILABLE(ios(11.1)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

  /*!
   @constant AVCaptureSystemPressureLevelFair
      System pressure is slightly elevated.
   */
  JS_ASSIGN_ENUM(AVCaptureSystemPressureLevelFair, NSString); //  API_AVAILABLE(ios(11.1)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

  /*!
   @constant AVCaptureSystemPressureLevelSerious
      System pressure is highly elevated. Capture performance may be impacted. Frame rate throttling is advised.
   */
  JS_ASSIGN_ENUM(AVCaptureSystemPressureLevelSerious, NSString); //  API_AVAILABLE(ios(11.1)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

  /*!
   @constant AVCaptureSystemPressureLevelCritical
      System pressure is critically elevated. Capture quality and performance are significantly impacted. Frame rate throttling is highly advised.
   */
  JS_ASSIGN_ENUM(AVCaptureSystemPressureLevelCritical, NSString); //  API_AVAILABLE(ios(11.1)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

  /*!
   @constant AVCaptureSystemPressureLevelShutdown
      System pressure is beyond critical. Capture must immediately stop.
   */
  JS_ASSIGN_ENUM(AVCaptureSystemPressureLevelShutdown, NSString); //  API_AVAILABLE(ios(11.1)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);
#endif

  /*!
   @enum AVCaptureDeviceTransportControlsPlaybackMode
   @abstract
      Constants indicating the transport controls' current mode of play back, if it has one.
   
   @constant AVCaptureDeviceTransportControlsNotPlayingMode
      Indicates that the tape transport is not threaded through the play head.
   @constant AVCaptureDeviceTransportControlsPlayingMode
      Indicates that the tape transport is threaded through the play head.
   */
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  //typedef NS_ENUM(NSInteger, AVCaptureDeviceTransportControlsPlaybackMode) {
    JS_ASSIGN_ENUM(AVCaptureDeviceTransportControlsNotPlayingMode, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(AVCaptureDeviceTransportControlsPlayingMode, NSInteger); //     = 1,
  //} API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

JS_INIT_CLASS_END(AVCaptureSystemPressureState, NSObject);

NAN_METHOD(NAVCaptureSystemPressureState::New) {
  JS_RECONSTRUCT(AVCaptureSystemPressureState);
  @autoreleasepool {
    AVCaptureSystemPressureState* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureSystemPressureState *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureSystemPressureState *wrapper = new NAVCaptureSystemPressureState();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureSystemPressureState::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVCaptureSystemPressureState::levelGetter) {
  JS_UNWRAP(AVCaptureSystemPressureState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureSystemPressureLevel([self level]));
  }
}

NAN_GETTER(NAVCaptureSystemPressureState::factorsGetter) {
  JS_UNWRAP(AVCaptureSystemPressureState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureSystemPressureFactors([self factors]));
  }
}
