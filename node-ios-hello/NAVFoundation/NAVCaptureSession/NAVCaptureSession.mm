//
//  NAVCaptureSession.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureSession.h"

#define instancetype AVCaptureSession
#define js_value_instancetype js_value_AVCaptureSession

NAVCaptureSession::NAVCaptureSession() {}
NAVCaptureSession::~NAVCaptureSession() {}

JS_INIT_CLASS(AVCaptureSession, NSObject);
  JS_ASSIGN_PROTO_METHOD(canSetSessionPreset);
  JS_ASSIGN_PROTO_METHOD(canAddInput);
  JS_ASSIGN_PROTO_METHOD(addInput);
  JS_ASSIGN_PROTO_METHOD(removeInput);
  JS_ASSIGN_PROTO_METHOD(canAddOutput);
  JS_ASSIGN_PROTO_METHOD(addOutput);
  JS_ASSIGN_PROTO_METHOD(removeOutput);
  JS_ASSIGN_PROTO_METHOD(addInputWithNoConnections);
  JS_ASSIGN_PROTO_METHOD(addOutputWithNoConnections);
  JS_ASSIGN_PROTO_METHOD(canAddConnection);
  JS_ASSIGN_PROTO_METHOD(addConnection);
  JS_ASSIGN_PROTO_METHOD(removeConnection);
  JS_ASSIGN_PROTO_METHOD(beginConfiguration);
  JS_ASSIGN_PROTO_METHOD(commitConfiguration);
  JS_ASSIGN_PROTO_METHOD(startRunning);
  JS_ASSIGN_PROTO_METHOD(stopRunning);
  JS_ASSIGN_PROTO_PROP(sessionPreset);
  JS_ASSIGN_PROTO_PROP_READONLY(inputs);
  JS_ASSIGN_PROTO_PROP_READONLY(outputs);
  JS_ASSIGN_PROTO_PROP_READONLY(connections);
  JS_ASSIGN_PROTO_PROP_READONLY(isRunning);
  JS_ASSIGN_PROTO_PROP_READONLY(isInterrupted);
  JS_ASSIGN_PROTO_PROP(usesApplicationAudioSession);
  JS_ASSIGN_PROTO_PROP(automaticallyConfiguresApplicationAudioSession);
  JS_ASSIGN_PROTO_PROP(automaticallyConfiguresCaptureDeviceForWideColor);
  JS_ASSIGN_PROTO_PROP_READONLY(masterClock);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureSession, NSObject);
  // constant values (exports)

  /*!
   @enum AVCaptureVideoOrientation
   @abstract
      Constants indicating video orientation, for use with AVCaptureVideoPreviewLayer (see AVCaptureVideoPreviewLayer.h) and AVCaptureConnection (see below).
   
   @constant AVCaptureVideoOrientationPortrait
      Indicates that video should be oriented vertically, home button on the bottom.
   @constant AVCaptureVideoOrientationPortraitUpsideDown
      Indicates that video should be oriented vertically, home button on the top.
   @constant AVCaptureVideoOrientationLandscapeRight
      Indicates that video should be oriented horizontally, home button on the right.
   @constant AVCaptureVideoOrientationLandscapeLeft
      Indicates that video should be oriented horizontally, home button on the left.
   */
  //typedef NS_ENUM(NSInteger, AVCaptureVideoOrientation) {
    JS_ASSIGN_ENUM(AVCaptureVideoOrientationPortrait, NSInteger); //            = 1,
    JS_ASSIGN_ENUM(AVCaptureVideoOrientationPortraitUpsideDown, NSInteger); //  = 2,
    JS_ASSIGN_ENUM(AVCaptureVideoOrientationLandscapeRight, NSInteger); //      = 3,
    JS_ASSIGN_ENUM(AVCaptureVideoOrientationLandscapeLeft, NSInteger); //       = 4,
  //} API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @enum AVVideoFieldMode
   @abstract
      Constants indicating video field mode, for use with AVCaptureConnection's videoFieldMode property (see below).
   
   @constant AVVideoFieldModeBoth
      Indicates that both top and bottom video fields in interlaced content should be passed thru.
   @constant AVVideoFieldModeTopOnly
      Indicates that only the top video field in interlaced content should be passed thru.
   @constant AVVideoFieldModeBottomOnly
      Indicates that the bottom video field only in interlaced content should be passed thru.
   @constant AVVideoFieldModeDeinterlace
      Indicates that top and bottom video fields in interlaced content should be deinterlaced.
   */
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCHOS && !TARGET_OS_TVOS
  //typedef NS_ENUM(NSInteger, AVVideoFieldMode) {
    JS_ASSIGN_ENUM(AVVideoFieldModeBoth, NSInteger); //         = 0,
    JS_ASSIGN_ENUM(AVVideoFieldModeTopOnly, NSInteger); //      = 1,
    JS_ASSIGN_ENUM(AVVideoFieldModeBottomOnly, NSInteger); //   = 2,
    JS_ASSIGN_ENUM(AVVideoFieldModeDeinterlace, NSInteger); //  = 3,
  //} API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

JS_INIT_CLASS_END(AVCaptureSession, NSObject);

NAN_METHOD(NAVCaptureSession::New) {
  JS_RECONSTRUCT(AVCaptureSession);
  @autoreleasepool {
    AVCaptureSession* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureSession *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVCaptureSession alloc] init];
    }
    if (self) {
      NAVCaptureSession *wrapper = new NAVCaptureSession();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureSession::New: invalid arguments");
    }
  }
}

#include "NAVCaptureSessionPreset.h"

NAN_METHOD(NAVCaptureSession::canSetSessionPreset) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureSessionPreset, preset);
    JS_SET_RETURN(js_value_BOOL([self canSetSessionPreset: preset]));
  }
}

#include "NAVCaptureInput.h"

NAN_METHOD(NAVCaptureSession::canAddInput) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureInput, input);
    JS_SET_RETURN(js_value_BOOL([self canAddInput: input]));
  }
}

NAN_METHOD(NAVCaptureSession::addInput) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureInput, input);
    [self addInput: input];
  }
}

NAN_METHOD(NAVCaptureSession::removeInput) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureInput, input);
    [self removeInput: input];
  }
}

#include "NAVCaptureOutput.h"

NAN_METHOD(NAVCaptureSession::canAddOutput) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureOutput, output);
    JS_SET_RETURN(js_value_BOOL([self canAddOutput: output]));
  }
}

NAN_METHOD(NAVCaptureSession::addOutput) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureOutput, output);
    [self addOutput: output];
  }
}

NAN_METHOD(NAVCaptureSession::removeOutput) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureOutput, output);
    [self removeOutput: output];
  }
}

NAN_METHOD(NAVCaptureSession::addInputWithNoConnections) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureInput, input);
    [self addInputWithNoConnections: input];
  }
}

NAN_METHOD(NAVCaptureSession::addOutputWithNoConnections) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureOutput, output);
    [self addOutputWithNoConnections: output];
  }
}

#include "NAVCaptureConnection.h"

NAN_METHOD(NAVCaptureSession::canAddConnection) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureConnection, connection);
    JS_SET_RETURN(js_value_BOOL([self canAddConnection: connection]));
  }
}

NAN_METHOD(NAVCaptureSession::addConnection) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureConnection, connection);
    [self addConnection: connection];
  }
}

NAN_METHOD(NAVCaptureSession::removeConnection) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureConnection, connection);
    [self removeConnection: connection];
  }
}

NAN_METHOD(NAVCaptureSession::beginConfiguration) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    [self beginConfiguration];
  }
}

NAN_METHOD(NAVCaptureSession::commitConfiguration) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    [self commitConfiguration];
  }
}

NAN_METHOD(NAVCaptureSession::startRunning) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    [self startRunning];
  }
}

NAN_METHOD(NAVCaptureSession::stopRunning) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    [self stopRunning];
  }
}

NAN_GETTER(NAVCaptureSession::sessionPresetGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureSessionPreset([self sessionPreset]));
  }
}

#include "NAVCaptureSessionPreset.h"

NAN_SETTER(NAVCaptureSession::sessionPresetSetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureSessionPreset, input);
    [self setSessionPreset: input];
  }
}

NAN_GETTER(NAVCaptureSession::inputsGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureInput*>([self inputs]));
  }
}

NAN_GETTER(NAVCaptureSession::outputsGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureOutput*>([self outputs]));
  }
}

NAN_GETTER(NAVCaptureSession::connectionsGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureConnection*>([self connections]));
  }
}

NAN_GETTER(NAVCaptureSession::isRunningGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRunning]));
  }
}

NAN_GETTER(NAVCaptureSession::isInterruptedGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInterrupted]));
  }
}

NAN_GETTER(NAVCaptureSession::usesApplicationAudioSessionGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self usesApplicationAudioSession]));
  }
}

NAN_SETTER(NAVCaptureSession::usesApplicationAudioSessionSetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUsesApplicationAudioSession: input];
  }
}

NAN_GETTER(NAVCaptureSession::automaticallyConfiguresApplicationAudioSessionGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyConfiguresApplicationAudioSession]));
  }
}

NAN_SETTER(NAVCaptureSession::automaticallyConfiguresApplicationAudioSessionSetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyConfiguresApplicationAudioSession: input];
  }
}

NAN_GETTER(NAVCaptureSession::automaticallyConfiguresCaptureDeviceForWideColorGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyConfiguresCaptureDeviceForWideColor]));
  }
}

NAN_SETTER(NAVCaptureSession::automaticallyConfiguresCaptureDeviceForWideColorSetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyConfiguresCaptureDeviceForWideColor: input];
  }
}

#include "NCMSync.h"

NAN_GETTER(NAVCaptureSession::masterClockGetter) {
  JS_UNWRAP(AVCaptureSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMClockRef([self masterClock]));
  }
}
