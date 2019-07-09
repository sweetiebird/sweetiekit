//
//  NAVCaptureConnection.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureConnection.h"

#define instancetype AVCaptureConnection
#define js_value_instancetype js_value_AVCaptureConnection

NAVCaptureConnection::NAVCaptureConnection() {}
NAVCaptureConnection::~NAVCaptureConnection() {}

JS_INIT_CLASS(AVCaptureConnection, NSObject);
  JS_ASSIGN_STATIC_METHOD(connectionWithInputPortsOutput);
  JS_ASSIGN_STATIC_METHOD(connectionWithInputPortVideoPreviewLayer);
  JS_ASSIGN_PROTO_METHOD(initWithInputPortsOutput);
  JS_ASSIGN_PROTO_METHOD(initWithInputPortVideoPreviewLayer);
  JS_ASSIGN_PROTO_PROP_READONLY(inputPorts);
  JS_ASSIGN_PROTO_PROP_READONLY(output);
  JS_ASSIGN_PROTO_PROP_READONLY(videoPreviewLayer);
  JS_ASSIGN_PROTO_PROP(isEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(isActive);
  JS_ASSIGN_PROTO_PROP_READONLY(audioChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoMirroringSupported);
  JS_ASSIGN_PROTO_PROP(isVideoMirrored);
  JS_ASSIGN_PROTO_PROP(automaticallyAdjustsVideoMirroring);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoOrientationSupported);
  JS_ASSIGN_PROTO_PROP(videoOrientation);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCHOS && !TARGET_OS_TVOS
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoFieldModeSupported);
  JS_ASSIGN_PROTO_PROP(videoFieldMode);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoMinFrameDurationSupported);
  JS_ASSIGN_PROTO_PROP(videoMinFrameDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoMaxFrameDurationSupported);
  JS_ASSIGN_PROTO_PROP(videoMaxFrameDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(videoMaxScaleAndCropFactor);
  JS_ASSIGN_PROTO_PROP(videoScaleAndCropFactor);
  JS_ASSIGN_PROTO_PROP(preferredVideoStabilizationMode);
  JS_ASSIGN_PROTO_PROP_READONLY(activeVideoStabilizationMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoStabilizationSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoStabilizationEnabled);
  JS_ASSIGN_PROTO_PROP(enablesVideoStabilizationWhenAvailable);
  JS_ASSIGN_PROTO_PROP_READONLY(isCameraIntrinsicMatrixDeliverySupported);
  JS_ASSIGN_PROTO_PROP(isCameraIntrinsicMatrixDeliveryEnabled);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureConnection, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureConnection, NSObject);

NAN_METHOD(NAVCaptureConnection::New) {
  JS_RECONSTRUCT(AVCaptureConnection);
  @autoreleasepool {
    AVCaptureConnection* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureConnection *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureConnection *wrapper = new NAVCaptureConnection();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureConnection::New: invalid arguments");
    }
  }
}

#include "NAVCaptureOutput.h"

NAN_METHOD(NAVCaptureConnection::connectionWithInputPortsOutput) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<AVCaptureInputPort*>, ports);
    declare_pointer(AVCaptureOutput, output);
    JS_SET_RETURN(js_value_instancetype([AVCaptureConnection connectionWithInputPorts: ports output: output]));
  }
}

#include "NAVCaptureInputPort.h"
#include "NAVCaptureVideoPreviewLayer.h"

NAN_METHOD(NAVCaptureConnection::connectionWithInputPortVideoPreviewLayer) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureInputPort, port);
    declare_pointer(AVCaptureVideoPreviewLayer, layer);
    JS_SET_RETURN(js_value_instancetype([AVCaptureConnection connectionWithInputPort: port videoPreviewLayer: layer]));
  }
}

NAN_METHOD(NAVCaptureConnection::initWithInputPortsOutput) {
  JS_UNWRAP_OR_ALLOC(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<AVCaptureInputPort*>, ports);
    declare_pointer(AVCaptureOutput, output);
    JS_SET_RETURN(js_value_instancetype([self initWithInputPorts: ports output: output]));
  }
}

NAN_METHOD(NAVCaptureConnection::initWithInputPortVideoPreviewLayer) {
  JS_UNWRAP_OR_ALLOC(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureInputPort, port);
    declare_pointer(AVCaptureVideoPreviewLayer, layer);
    JS_SET_RETURN(js_value_instancetype([self initWithInputPort: port videoPreviewLayer: layer]));
  }
}

NAN_GETTER(NAVCaptureConnection::inputPortsGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureInputPort*>([self inputPorts]));
  }
}

NAN_GETTER(NAVCaptureConnection::outputGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureOutput([self output]));
  }
}

NAN_GETTER(NAVCaptureConnection::videoPreviewLayerGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureVideoPreviewLayer([self videoPreviewLayer]));
  }
}

NAN_GETTER(NAVCaptureConnection::isEnabledGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NAVCaptureConnection::isEnabledSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}

NAN_GETTER(NAVCaptureConnection::isActiveGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isActive]));
  }
}

NAN_GETTER(NAVCaptureConnection::audioChannelsGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureAudioChannel*>([self audioChannels]));
  }
}

NAN_GETTER(NAVCaptureConnection::isVideoMirroringSupportedGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoMirroringSupported]));
  }
}

NAN_GETTER(NAVCaptureConnection::isVideoMirroredGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoMirrored]));
  }
}

NAN_SETTER(NAVCaptureConnection::isVideoMirroredSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setVideoMirrored: input];
  }
}

NAN_GETTER(NAVCaptureConnection::automaticallyAdjustsVideoMirroringGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyAdjustsVideoMirroring]));
  }
}

NAN_SETTER(NAVCaptureConnection::automaticallyAdjustsVideoMirroringSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyAdjustsVideoMirroring: input];
  }
}

NAN_GETTER(NAVCaptureConnection::isVideoOrientationSupportedGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoOrientationSupported]));
  }
}

#include "NAVCaptureSession.h"

NAN_GETTER(NAVCaptureConnection::videoOrientationGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureVideoOrientation([self videoOrientation]));
  }
}

NAN_SETTER(NAVCaptureConnection::videoOrientationSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureVideoOrientation, input);
    [self setVideoOrientation: input];
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCHOS && !TARGET_OS_TVOS
NAN_GETTER(NAVCaptureConnection::isVideoFieldModeSupportedGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoFieldModeSupported]));
  }
}

NAN_GETTER(NAVCaptureConnection::videoFieldModeGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVVideoFieldMode([self videoFieldMode]));
  }
}

NAN_SETTER(NAVCaptureConnection::videoFieldModeSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVVideoFieldMode, input);
    [self setVideoFieldMode: input];
  }
}
#endif

NAN_GETTER(NAVCaptureConnection::isVideoMinFrameDurationSupportedGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoMinFrameDurationSupported]));
  }
}

#include "NCMTime.h"

NAN_GETTER(NAVCaptureConnection::videoMinFrameDurationGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self videoMinFrameDuration]));
  }
}

NAN_SETTER(NAVCaptureConnection::videoMinFrameDurationSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setVideoMinFrameDuration: input];
  }
}

NAN_GETTER(NAVCaptureConnection::isVideoMaxFrameDurationSupportedGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoMaxFrameDurationSupported]));
  }
}

NAN_GETTER(NAVCaptureConnection::videoMaxFrameDurationGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self videoMaxFrameDuration]));
  }
}

NAN_SETTER(NAVCaptureConnection::videoMaxFrameDurationSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setVideoMaxFrameDuration: input];
  }
}

NAN_GETTER(NAVCaptureConnection::videoMaxScaleAndCropFactorGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self videoMaxScaleAndCropFactor]));
  }
}

NAN_GETTER(NAVCaptureConnection::videoScaleAndCropFactorGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self videoScaleAndCropFactor]));
  }
}

NAN_SETTER(NAVCaptureConnection::videoScaleAndCropFactorSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setVideoScaleAndCropFactor: input];
  }
}

#include "NAVCaptureDevice.h"

NAN_GETTER(NAVCaptureConnection::preferredVideoStabilizationModeGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureVideoStabilizationMode([self preferredVideoStabilizationMode]));
  }
}

NAN_SETTER(NAVCaptureConnection::preferredVideoStabilizationModeSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureVideoStabilizationMode, input);
    [self setPreferredVideoStabilizationMode: input];
  }
}

NAN_GETTER(NAVCaptureConnection::activeVideoStabilizationModeGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureVideoStabilizationMode([self activeVideoStabilizationMode]));
  }
}

NAN_GETTER(NAVCaptureConnection::isVideoStabilizationSupportedGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoStabilizationSupported]));
  }
}

NAN_GETTER(NAVCaptureConnection::isVideoStabilizationEnabledGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoStabilizationEnabled]));
  }
}

NAN_GETTER(NAVCaptureConnection::enablesVideoStabilizationWhenAvailableGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self enablesVideoStabilizationWhenAvailable]));
  }
}

NAN_SETTER(NAVCaptureConnection::enablesVideoStabilizationWhenAvailableSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnablesVideoStabilizationWhenAvailable: input];
  }
}

NAN_GETTER(NAVCaptureConnection::isCameraIntrinsicMatrixDeliverySupportedGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCameraIntrinsicMatrixDeliverySupported]));
  }
}

NAN_GETTER(NAVCaptureConnection::isCameraIntrinsicMatrixDeliveryEnabledGetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCameraIntrinsicMatrixDeliveryEnabled]));
  }
}

NAN_SETTER(NAVCaptureConnection::isCameraIntrinsicMatrixDeliveryEnabledSetter) {
  JS_UNWRAP(AVCaptureConnection, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCameraIntrinsicMatrixDeliveryEnabled: input];
  }
}
