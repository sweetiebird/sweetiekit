//
//  NAVCaptureDevice.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureDevice.h"

#define instancetype AVCaptureDevice
#define js_value_instancetype js_value_AVCaptureDevice

NAVCaptureDevice::NAVCaptureDevice() {}
NAVCaptureDevice::~NAVCaptureDevice() {}

#include "NMacTypes.h"

Local<Value> js_value_AVCaptureWhiteBalanceGains(const AVCaptureWhiteBalanceGains& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(float, redGain);
  js_struct_value(float, greenGain);
  js_struct_value(float, blueGain);
  return scope.Escape(result);
}

AVCaptureWhiteBalanceGains to_value_AVCaptureWhiteBalanceGains(const Local<Value>& value, bool * _Nullable failed) {
  AVCaptureWhiteBalanceGains result;
  to_struct_init_value(float, redGain, 0.0f);
  to_struct_init_value(float, greenGain, 0.0f);
  to_struct_init_value(float, blueGain, 0.0f);
  check_struct_type(AVCaptureWhiteBalanceGains);
  to_struct_value(float, redGain);
  to_struct_value(float, greenGain);
  to_struct_value(float, blueGain);
  return result;
}

bool is_value_AVCaptureWhiteBalanceGains(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(float, redGain);
  check_struct_value(float, greenGain);
  check_struct_value(float, blueGain);
  return true;
}

Local<Value> js_value_AVCaptureWhiteBalanceChromaticityValues(const AVCaptureWhiteBalanceChromaticityValues& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(float, x);
  js_struct_value(float, y);
  return scope.Escape(result);
}

AVCaptureWhiteBalanceChromaticityValues to_value_AVCaptureWhiteBalanceChromaticityValues(const Local<Value>& value, bool * _Nullable failed) {
  AVCaptureWhiteBalanceChromaticityValues result;
  to_struct_init_value(float, x, 0.0f);
  to_struct_init_value(float, y, 0.0f);
  check_struct_type(AVCaptureWhiteBalanceChromaticityValues);
  to_struct_value(float, x);
  to_struct_value(float, y);
  return result;
}

bool is_value_AVCaptureWhiteBalanceChromaticityValues(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(float, x);
  check_struct_value(float, y);
  return true;
}

Local<Value> js_value_AVCaptureWhiteBalanceTemperatureAndTintValues(const AVCaptureWhiteBalanceTemperatureAndTintValues& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(float, temperature);
  js_struct_value(float, tint);
  return scope.Escape(result);
}

AVCaptureWhiteBalanceTemperatureAndTintValues to_value_AVCaptureWhiteBalanceTemperatureAndTintValues(const Local<Value>& value, bool * _Nullable failed) {
  AVCaptureWhiteBalanceTemperatureAndTintValues result;
  to_struct_init_value(float, temperature, 0.0f);
  to_struct_init_value(float, tint, 0.0f);
  check_struct_type(AVCaptureWhiteBalanceTemperatureAndTintValues);
  to_struct_value(float, temperature);
  to_struct_value(float, tint);
  return result;
}

bool is_value_AVCaptureWhiteBalanceTemperatureAndTintValues(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(float, temperature);
  check_struct_value(float, tint);
  return true;
}

#include "NCMTime.h"

JS_INIT_CLASS(AVCaptureDevice, NSObject);
  JS_ASSIGN_STATIC_METHOD(devices);
  JS_ASSIGN_STATIC_METHOD(devicesWithMediaType);
  JS_ASSIGN_STATIC_METHOD(defaultDeviceWithMediaType);
  JS_ASSIGN_STATIC_METHOD(deviceWithUniqueID);
  JS_ASSIGN_STATIC_METHOD(defaultDeviceWithDeviceTypeMediaTypePosition);
  JS_ASSIGN_STATIC_METHOD(authorizationStatusForMediaType);
  JS_ASSIGN_STATIC_METHOD(requestAccessForMediaTypeCompletionHandler);
  JS_ASSIGN_STATIC_METHOD(extrinsicMatrixFromDeviceToDevice);
  JS_ASSIGN_PROTO_METHOD(hasMediaType);
  JS_ASSIGN_PROTO_METHOD(lockForConfiguration);
  JS_ASSIGN_PROTO_METHOD(unlockForConfiguration);
  JS_ASSIGN_PROTO_METHOD(supportsAVCaptureSessionPreset);
  JS_ASSIGN_PROTO_METHOD(isFlashModeSupported);
  JS_ASSIGN_PROTO_METHOD(isTorchModeSupported);
  JS_ASSIGN_PROTO_METHOD(setTorchModeOnWithLevelError);
  JS_ASSIGN_PROTO_METHOD(isFocusModeSupported);
  JS_ASSIGN_PROTO_METHOD(setFocusModeLockedWithLensPositionCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(isExposureModeSupported);
  JS_ASSIGN_PROTO_METHOD(setExposureModeCustomWithDurationISOCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(setExposureTargetBiasCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(isWhiteBalanceModeSupported);
  JS_ASSIGN_PROTO_METHOD(setWhiteBalanceModeLockedWithDeviceWhiteBalanceGainsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(chromaticityValuesForDeviceWhiteBalanceGains);
  JS_ASSIGN_PROTO_METHOD(deviceWhiteBalanceGainsForChromaticityValues);
  JS_ASSIGN_PROTO_METHOD(temperatureAndTintValuesForDeviceWhiteBalanceGains);
  JS_ASSIGN_PROTO_METHOD(deviceWhiteBalanceGainsForTemperatureAndTintValues);
  JS_ASSIGN_PROTO_METHOD(rampToVideoZoomFactorWithRate);
  JS_ASSIGN_PROTO_METHOD(cancelVideoZoomRamp);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  JS_ASSIGN_PROTO_METHOD(setTransportControlsPlaybackModeSpeed);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(uniqueID);
  JS_ASSIGN_PROTO_PROP_READONLY(modelID);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedName);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  JS_ASSIGN_PROTO_PROP_READONLY(manufacturer);
  JS_ASSIGN_PROTO_PROP_READONLY(transportType);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(isConnected);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  JS_ASSIGN_PROTO_PROP_READONLY(isInUseByAnotherApplication);
  JS_ASSIGN_PROTO_PROP_READONLY(isSuspended);
  JS_ASSIGN_PROTO_PROP_READONLY(linkedDevices);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(formats);
  JS_ASSIGN_PROTO_PROP(activeFormat);
  JS_ASSIGN_PROTO_PROP(activeVideoMinFrameDuration);
  JS_ASSIGN_PROTO_PROP(activeVideoMaxFrameDuration);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  JS_ASSIGN_PROTO_PROP_READONLY(inputSources);
  JS_ASSIGN_PROTO_PROP(activeInputSource);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(position);
  JS_ASSIGN_PROTO_PROP_READONLY(deviceType);
  JS_ASSIGN_PROTO_PROP_READONLY(systemPressureState);
  JS_ASSIGN_PROTO_PROP_READONLY(isVirtualDevice);
  JS_ASSIGN_PROTO_PROP_READONLY(constituentDevices);
  JS_ASSIGN_PROTO_PROP_READONLY(hasFlash);
  JS_ASSIGN_PROTO_PROP_READONLY(isFlashAvailable);
#if !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_PROP_READONLY(isFlashActive);
#endif
  JS_ASSIGN_PROTO_PROP(flashMode);
  JS_ASSIGN_PROTO_PROP_READONLY(hasTorch);
  JS_ASSIGN_PROTO_PROP_READONLY(isTorchAvailable);
  JS_ASSIGN_PROTO_PROP_READONLY(isTorchActive);
  JS_ASSIGN_PROTO_PROP_READONLY(torchLevel);
  JS_ASSIGN_PROTO_PROP(torchMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isLockingFocusWithCustomLensPositionSupported);
  JS_ASSIGN_PROTO_PROP(focusMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isFocusPointOfInterestSupported);
  JS_ASSIGN_PROTO_PROP(focusPointOfInterest);
  JS_ASSIGN_PROTO_PROP_READONLY(isAdjustingFocus);
  JS_ASSIGN_PROTO_PROP_READONLY(isAutoFocusRangeRestrictionSupported);
  JS_ASSIGN_PROTO_PROP(autoFocusRangeRestriction);
  JS_ASSIGN_PROTO_PROP_READONLY(isSmoothAutoFocusSupported);
  JS_ASSIGN_PROTO_PROP(isSmoothAutoFocusEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(lensPosition);
  JS_ASSIGN_PROTO_PROP(exposureMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isExposurePointOfInterestSupported);
  JS_ASSIGN_PROTO_PROP(exposurePointOfInterest);
  JS_ASSIGN_PROTO_PROP(activeMaxExposureDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(isAdjustingExposure);
  JS_ASSIGN_PROTO_PROP_READONLY(lensAperture);
  JS_ASSIGN_PROTO_PROP_READONLY(exposureDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(ISO);
  JS_ASSIGN_PROTO_PROP_READONLY(exposureTargetOffset);
  JS_ASSIGN_PROTO_PROP_READONLY(exposureTargetBias);
  JS_ASSIGN_PROTO_PROP_READONLY(minExposureTargetBias);
  JS_ASSIGN_PROTO_PROP_READONLY(maxExposureTargetBias);
  JS_ASSIGN_PROTO_PROP_READONLY(isLockingWhiteBalanceWithCustomDeviceGainsSupported);
  JS_ASSIGN_PROTO_PROP(whiteBalanceMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isAdjustingWhiteBalance);
  JS_ASSIGN_PROTO_PROP_READONLY(deviceWhiteBalanceGains);
  JS_ASSIGN_PROTO_PROP_READONLY(grayWorldDeviceWhiteBalanceGains);
  JS_ASSIGN_PROTO_PROP_READONLY(maxWhiteBalanceGain);
  JS_ASSIGN_PROTO_PROP(isSubjectAreaChangeMonitoringEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(isLowLightBoostSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(isLowLightBoostEnabled);
  JS_ASSIGN_PROTO_PROP(automaticallyEnablesLowLightBoostWhenAvailable);
  JS_ASSIGN_PROTO_PROP(videoZoomFactor);
  JS_ASSIGN_PROTO_PROP_READONLY(isRampingVideoZoom);
  JS_ASSIGN_PROTO_PROP_READONLY(dualCameraSwitchOverVideoZoomFactor);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  JS_ASSIGN_PROTO_PROP_READONLY(transportControlsSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(transportControlsPlaybackMode);
  JS_ASSIGN_PROTO_PROP_READONLY(transportControlsSpeed);
#endif
  JS_ASSIGN_PROTO_PROP(automaticallyAdjustsVideoHDREnabled);
  JS_ASSIGN_PROTO_PROP(isVideoHDREnabled);
  JS_ASSIGN_PROTO_PROP(activeColorSpace);
  JS_ASSIGN_PROTO_PROP(activeDepthDataFormat);
  JS_ASSIGN_PROTO_PROP(activeDepthDataMinFrameDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(minAvailableVideoZoomFactor);
  JS_ASSIGN_PROTO_PROP_READONLY(maxAvailableVideoZoomFactor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureDevice, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(AVCaptureDeviceWasConnectedNotification, NSString); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(AVCaptureDeviceWasDisconnectedNotification, NSString); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#if !TARGET_OS_MAC
  JS_ASSIGN_ENUM(AVCaptureDeviceSubjectAreaDidChangeNotification, NSString); //  API_AVAILABLE(ios(5.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  JS_ASSIGN_ENUM(AVCaptureDeviceTypeExternalUnknown, AVCaptureDeviceType); //  API_AVAILABLE(macos(10.15)) API_UNAVAILABLE(ios, watchos, tvos);
#endif
  JS_ASSIGN_ENUM(AVCaptureDeviceTypeBuiltInMicrophone, AVCaptureDeviceType); //  API_AVAILABLE(macos(10.15), ios(10.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceType); //  API_AVAILABLE(macos(10.15), ios(10.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#if !TARGET_OS_MAC
  JS_ASSIGN_ENUM(AVCaptureDeviceTypeBuiltInTelephotoCamera, AVCaptureDeviceType); //  API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(AVCaptureDeviceTypeBuiltInDualCamera, AVCaptureDeviceType); //  API_AVAILABLE(ios(10.2)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(AVCaptureDeviceTypeBuiltInTrueDepthCamera, AVCaptureDeviceType); //  API_AVAILABLE(ios(11.1)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif
#if !TARGET_OS_MAC && !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_ENUM(AVCaptureDeviceTypeBuiltInDuoCamera, AVCaptureDeviceType); //  API_DEPRECATED("Use AVCaptureDeviceTypeBuiltInDualCamera instead.", ios(10.0, 10.2)) API_UNAVAILABLE(macos, uikitformac) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif
  JS_ASSIGN_ENUM(AVCaptureMaxAvailableTorchLevel, float); //  API_AVAILABLE(macos(10.15), ios(6.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#if !TARGET_OS_MAC
  JS_ASSIGN_ENUM(AVCaptureLensPositionCurrent, float); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos);
#endif
#if !TARGET_OS_MAC && !TARGET_OS_WATCH && !TARGET_OS_TV
  JS_ASSIGN_ENUM(AVCaptureExposureDurationCurrent, CMTime); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(AVCaptureISOCurrent, float); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(AVCaptureExposureTargetBiasCurrent, float); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(AVCaptureWhiteBalanceGainsCurrent, AVCaptureWhiteBalanceGains); //  API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif

#if !TARGET_OS_WATCH && !TARGET_OS_TV
  //typedef NS_ENUM(NSInteger, AVCaptureDevicePosition) {
    JS_ASSIGN_ENUM(AVCaptureDevicePositionUnspecified, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(AVCaptureDevicePositionBack, NSInteger); //         = 1,
    JS_ASSIGN_ENUM(AVCaptureDevicePositionFront, NSInteger); //        = 2,
  //} API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVCaptureFlashMode) {
    JS_ASSIGN_ENUM(AVCaptureFlashModeOff, NSInteger); //   = 0,
    JS_ASSIGN_ENUM(AVCaptureFlashModeOn, NSInteger); //    = 1,
    JS_ASSIGN_ENUM(AVCaptureFlashModeAuto, NSInteger); //  = 2,
  //} API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVCaptureTorchMode) {
    JS_ASSIGN_ENUM(AVCaptureTorchModeOff, NSInteger); //   = 0,
    JS_ASSIGN_ENUM(AVCaptureTorchModeOn, NSInteger); //    = 1,
    JS_ASSIGN_ENUM(AVCaptureTorchModeAuto, NSInteger); //  = 2,
  //} API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVCaptureFocusMode) {
    JS_ASSIGN_ENUM(AVCaptureFocusModeLocked, NSInteger); //               = 0,
    JS_ASSIGN_ENUM(AVCaptureFocusModeAutoFocus, NSInteger); //            = 1,
    JS_ASSIGN_ENUM(AVCaptureFocusModeContinuousAutoFocus, NSInteger); //  = 2,
  //} API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif

#if !TARGET_OS_MAC && !TARGET_OS_WATCH && !TARGET_OS_TV
  //typedef NS_ENUM(NSInteger, AVCaptureAutoFocusRangeRestriction) {
    JS_ASSIGN_ENUM(AVCaptureAutoFocusRangeRestrictionNone, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(AVCaptureAutoFocusRangeRestrictionNear, NSInteger); //  = 1,
    JS_ASSIGN_ENUM(AVCaptureAutoFocusRangeRestrictionFar, NSInteger); //   = 2,
  //} API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif

#if !TARGET_OS_WATCH && !TARGET_OS_TV
  //typedef NS_ENUM(NSInteger, AVCaptureExposureMode) {
    JS_ASSIGN_ENUM(AVCaptureExposureModeLocked, NSInteger); //                             = 0,
    JS_ASSIGN_ENUM(AVCaptureExposureModeAutoExpose, NSInteger); //                         = 1,
    JS_ASSIGN_ENUM(AVCaptureExposureModeContinuousAutoExposure, NSInteger); //             = 2,
    JS_ASSIGN_ENUM(AVCaptureExposureModeCustom, NSInteger); //  API_AVAILABLE(macos(10.15), ios(8.0)) = 3,
  //} API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVCaptureWhiteBalanceMode) {
    JS_ASSIGN_ENUM(AVCaptureWhiteBalanceModeLocked, NSInteger); // (AVCaptureWhiteBalanceModeLocked, NSInteger); //                      = 0,
    JS_ASSIGN_ENUM(AVCaptureWhiteBalanceModeAutoWhiteBalance, NSInteger); // (AVCaptureWhiteBalanceModeAutoWhiteBalance, NSInteger); //            = 1,
    JS_ASSIGN_ENUM(AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance, NSInteger); // (AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance, NSInteger); //  = 2,
  //} API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVAuthorizationStatus) {
    JS_ASSIGN_ENUM(AVAuthorizationStatusNotDetermined, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(AVAuthorizationStatusRestricted, NSInteger); //     = 1,
    JS_ASSIGN_ENUM(AVAuthorizationStatusDenied, NSInteger); //         = 2,
    JS_ASSIGN_ENUM(AVAuthorizationStatusAuthorized, NSInteger); //     = 3,
  //} API_AVAILABLE(macos(10.14), ios(7.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  //typedef float AVCaptureDeviceTransportControlsSpeed API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, watchos, tvos);

  //typedef NS_ENUM(NSInteger, AVCaptureDeviceTransportControlsPlaybackMode) {
    JS_ASSIGN_ENUM(AVCaptureDeviceTransportControlsNotPlayingMode, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(AVCaptureDeviceTransportControlsPlayingMode, NSInteger); //     = 1,
  //} API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

#if !TARGET_OS_WATCH && !TARGET_OS_TV
  //typedef NS_ENUM(NSInteger, AVCaptureColorSpace) {
    JS_ASSIGN_ENUM(AVCaptureColorSpace_sRGB, NSInteger); //        = 0,
    JS_ASSIGN_ENUM(AVCaptureColorSpace_P3_D65, NSInteger); //      = 1,
  //} API_AVAILABLE(macos(10.15), ios(10.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVCaptureVideoStabilizationMode) {
    JS_ASSIGN_ENUM(AVCaptureVideoStabilizationModeOff, NSInteger); //        = 0,
    JS_ASSIGN_ENUM(AVCaptureVideoStabilizationModeStandard, NSInteger); //   = 1,
    JS_ASSIGN_ENUM(AVCaptureVideoStabilizationModeCinematic, NSInteger); //  = 2,
    JS_ASSIGN_ENUM(AVCaptureVideoStabilizationModeAuto, NSInteger); //       = -1,
  //} API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVCaptureAutoFocusSystem) {
    JS_ASSIGN_ENUM(AVCaptureAutoFocusSystemNone, NSInteger); //               = 0,
    JS_ASSIGN_ENUM(AVCaptureAutoFocusSystemContrastDetection, NSInteger); //  = 1,
    JS_ASSIGN_ENUM(AVCaptureAutoFocusSystemPhaseDetection, NSInteger); //     = 2,
  //} API_AVAILABLE(macos(10.15), ios(8.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
#endif

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
  //typedef NS_ENUM(NSInteger, AVCaptureDeviceTransportControlsPlaybackMode) {
    JS_ASSIGN_ENUM(AVCaptureDeviceTransportControlsNotPlayingMode, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(AVCaptureDeviceTransportControlsPlayingMode, NSInteger); //     = 1,
  //} API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

JS_INIT_CLASS_END(AVCaptureDevice, NSObject);

NAN_METHOD(NAVCaptureDevice::New) {
  JS_RECONSTRUCT(AVCaptureDevice);
  @autoreleasepool {
    AVCaptureDevice* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureDevice *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureDevice *wrapper = new NAVCaptureDevice();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureDevice::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVCaptureDevice::devices) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureDevice*>([AVCaptureDevice devices]));
  }
}

#include "NAVMediaFormat.h"

NAN_METHOD(NAVCaptureDevice::devicesWithMediaType) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVMediaType, mediaType);
    JS_SET_RETURN(js_value_NSArray<AVCaptureDevice*>([AVCaptureDevice devicesWithMediaType: mediaType]));
  }
}

NAN_METHOD(NAVCaptureDevice::defaultDeviceWithMediaType) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVMediaType, mediaType);
    JS_SET_RETURN(js_value_AVCaptureDevice([AVCaptureDevice defaultDeviceWithMediaType: mediaType]));
  }
}

NAN_METHOD(NAVCaptureDevice::deviceWithUniqueID) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, deviceUniqueID);
    JS_SET_RETURN(js_value_AVCaptureDevice([AVCaptureDevice deviceWithUniqueID: deviceUniqueID]));
  }
}

NAN_METHOD(NAVCaptureDevice::defaultDeviceWithDeviceTypeMediaTypePosition) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureDeviceType, deviceType);
    declare_nullable_value(AVMediaType, mediaType);
    declare_value(AVCaptureDevicePosition, position);
    JS_SET_RETURN(js_value_AVCaptureDevice([AVCaptureDevice defaultDeviceWithDeviceType: deviceType mediaType: mediaType position: position]));
  }
}

NAN_METHOD(NAVCaptureDevice::authorizationStatusForMediaType) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVMediaType, mediaType);
    JS_SET_RETURN(js_value_AVAuthorizationStatus([AVCaptureDevice authorizationStatusForMediaType: mediaType]));
  }
}

NAN_METHOD(NAVCaptureDevice::requestAccessForMediaTypeCompletionHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVMediaType, mediaType);
    declare_callback(handler);
    [AVCaptureDevice requestAccessForMediaType: mediaType completionHandler:^(BOOL granted) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NAVCaptureDevice::requestAccessForMediaTypeCompletionHandler",
            js_value_BOOL(granted));
        }
      });
    }];
  }
}

NAN_METHOD(NAVCaptureDevice::extrinsicMatrixFromDeviceToDevice) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureDevice, fromDevice);
    declare_pointer(AVCaptureDevice, toDevice);
    JS_SET_RETURN(js_value_NSData([AVCaptureDevice extrinsicMatrixFromDevice: fromDevice toDevice: toDevice]));
  }
}

NAN_METHOD(NAVCaptureDevice::hasMediaType) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVMediaType, mediaType);
    JS_SET_RETURN(js_value_BOOL([self hasMediaType: mediaType]));
  }
}

NAN_METHOD(NAVCaptureDevice::lockForConfiguration) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self lockForConfiguration: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVCaptureDevice::unlockForConfiguration) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    [self unlockForConfiguration];
  }
}

#include "NAVCaptureSessionPreset.h"

NAN_METHOD(NAVCaptureDevice::supportsAVCaptureSessionPreset) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureSessionPreset, preset);
    JS_SET_RETURN(js_value_BOOL([self supportsAVCaptureSessionPreset: preset]));
  }
}

NAN_METHOD(NAVCaptureDevice::isFlashModeSupported) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureFlashMode, flashMode);
    JS_SET_RETURN(js_value_BOOL([self isFlashModeSupported: flashMode]));
  }
}

NAN_METHOD(NAVCaptureDevice::isTorchModeSupported) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureTorchMode, torchMode);
    JS_SET_RETURN(js_value_BOOL([self isTorchModeSupported: torchMode]));
  }
}

NAN_METHOD(NAVCaptureDevice::setTorchModeOnWithLevelError) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, torchLevel);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setTorchModeOnWithLevel: torchLevel error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVCaptureDevice::isFocusModeSupported) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureFocusMode, focusMode);
    JS_SET_RETURN(js_value_BOOL([self isFocusModeSupported: focusMode]));
  }
}

#include "NCMTime.h"

NAN_METHOD(NAVCaptureDevice::setFocusModeLockedWithLensPositionCompletionHandler) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, lensPosition);
    declare_callback(handler);
    [self setFocusModeLockedWithLensPosition: lensPosition completionHandler:^(CMTime syncTime) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NAVCaptureDevice::setFocusModeLockedWithLensPositionCompletionHandler",
            js_value_CMTime(syncTime));
        }
      });
    }];
  }
}

NAN_METHOD(NAVCaptureDevice::isExposureModeSupported) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureExposureMode, exposureMode);
    JS_SET_RETURN(js_value_BOOL([self isExposureModeSupported: exposureMode]));
  }
}

NAN_METHOD(NAVCaptureDevice::setExposureModeCustomWithDurationISOCompletionHandler) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CMTime, duration);
    declare_value(float, ISO);
    declare_callback(handler);
    [self setExposureModeCustomWithDuration: duration ISO: ISO completionHandler:^(CMTime syncTime) {
      if (handler) {
        [handler jsFunction]->Call("NAVCaptureDevice::setExposureModeCustomWithDurationISOCompletionHandler",
          js_value_CMTime(syncTime));
      }
    }];
  }
}

NAN_METHOD(NAVCaptureDevice::setExposureTargetBiasCompletionHandler) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, bias);
    declare_callback(handler);
    [self setExposureTargetBias: bias completionHandler:^(CMTime syncTime) {
      if (handler) {
        [handler jsFunction]->Call("NAVCaptureDevice::setExposureTargetBiasCompletionHandler",
          js_value_CMTime(syncTime));
      }
    }];
  }
}

NAN_METHOD(NAVCaptureDevice::isWhiteBalanceModeSupported) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureWhiteBalanceMode, whiteBalanceMode);
    JS_SET_RETURN(js_value_BOOL([self isWhiteBalanceModeSupported: whiteBalanceMode]));
  }
}

NAN_METHOD(NAVCaptureDevice::setWhiteBalanceModeLockedWithDeviceWhiteBalanceGainsCompletionHandler) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureWhiteBalanceGains, whiteBalanceGains);
    declare_callback(handler);
    [self setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains: whiteBalanceGains completionHandler:^(CMTime syncTime) {
      if (handler) {
        [handler jsFunction]->Call("NAVCaptureDevice::setWhiteBalanceModeLockedWithDeviceWhiteBalanceGainsCompletionHandler",
          js_value_CMTime(syncTime));
      }
    }];
  }
}

NAN_METHOD(NAVCaptureDevice::chromaticityValuesForDeviceWhiteBalanceGains) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureWhiteBalanceGains, whiteBalanceGains);
    JS_SET_RETURN(js_value_AVCaptureWhiteBalanceChromaticityValues([self chromaticityValuesForDeviceWhiteBalanceGains: whiteBalanceGains]));
  }
}

NAN_METHOD(NAVCaptureDevice::deviceWhiteBalanceGainsForChromaticityValues) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureWhiteBalanceChromaticityValues, chromaticityValues);
    JS_SET_RETURN(js_value_AVCaptureWhiteBalanceGains([self deviceWhiteBalanceGainsForChromaticityValues: chromaticityValues]));
  }
}

NAN_METHOD(NAVCaptureDevice::temperatureAndTintValuesForDeviceWhiteBalanceGains) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureWhiteBalanceGains, whiteBalanceGains);
    JS_SET_RETURN(js_value_AVCaptureWhiteBalanceTemperatureAndTintValues([self temperatureAndTintValuesForDeviceWhiteBalanceGains: whiteBalanceGains]));
  }
}

NAN_METHOD(NAVCaptureDevice::deviceWhiteBalanceGainsForTemperatureAndTintValues) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureWhiteBalanceTemperatureAndTintValues, tempAndTintValues);
    JS_SET_RETURN(js_value_AVCaptureWhiteBalanceGains([self deviceWhiteBalanceGainsForTemperatureAndTintValues: tempAndTintValues]));
  }
}

NAN_METHOD(NAVCaptureDevice::rampToVideoZoomFactorWithRate) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, factor);
    declare_value(float, rate);
    [self rampToVideoZoomFactor: factor withRate: rate];
  }
}

NAN_METHOD(NAVCaptureDevice::cancelVideoZoomRamp) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    [self cancelVideoZoomRamp];
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
NAN_METHOD(NAVCaptureDevice::setTransportControlsPlaybackModeSpeed) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureDeviceTransportControlsPlaybackMode, mode);
    declare_value(AVCaptureDeviceTransportControlsSpeed, speed);
    [self setTransportControlsPlaybackMode: mode speed: speed];
  }
}
#endif

NAN_GETTER(NAVCaptureDevice::uniqueIDGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self uniqueID]));
  }
}

NAN_GETTER(NAVCaptureDevice::modelIDGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self modelID]));
  }
}

NAN_GETTER(NAVCaptureDevice::localizedNameGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedName]));
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
NAN_GETTER(NAVCaptureDevice::manufacturerGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self manufacturer]));
  }
}

NAN_GETTER(NAVCaptureDevice::transportTypeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_int32_t([self transportType]));
  }
}
#endif

NAN_GETTER(NAVCaptureDevice::isConnectedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isConnected]));
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
NAN_GETTER(NAVCaptureDevice::isInUseByAnotherApplicationGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInUseByAnotherApplication]));
  }
}

NAN_GETTER(NAVCaptureDevice::isSuspendedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSuspended]));
  }
}

NAN_GETTER(NAVCaptureDevice::linkedDevicesGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureDevice*>([self linkedDevices]));
  }
}
#endif

NAN_GETTER(NAVCaptureDevice::formatsGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureDeviceFormat*>([self formats]));
  }
}

#include "NAVCaptureDeviceFormat.h"

NAN_GETTER(NAVCaptureDevice::activeFormatGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDeviceFormat([self activeFormat]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeFormatSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(AVCaptureDeviceFormat, input);
    [self setActiveFormat: input];
  }
}

NAN_GETTER(NAVCaptureDevice::activeVideoMinFrameDurationGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self activeVideoMinFrameDuration]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeVideoMinFrameDurationSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setActiveVideoMinFrameDuration: input];
  }
}

NAN_GETTER(NAVCaptureDevice::activeVideoMaxFrameDurationGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self activeVideoMaxFrameDuration]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeVideoMaxFrameDurationSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setActiveVideoMaxFrameDuration: input];
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
NAN_GETTER(NAVCaptureDevice::inputSourcesGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureDeviceInputSource*>([self inputSources]));
  }
}

NAN_GETTER(NAVCaptureDevice::activeInputSourceGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDeviceInputSource([self activeInputSource]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeInputSourceSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(AVCaptureDeviceInputSource, input);
    [self setActiveInputSource: input];
  }
}
#endif

NAN_GETTER(NAVCaptureDevice::positionGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDevicePosition([self position]));
  }
}

NAN_GETTER(NAVCaptureDevice::deviceTypeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDeviceType([self deviceType]));
  }
}

#include "NAVCaptureSystemPressureState.h"

NAN_GETTER(NAVCaptureDevice::systemPressureStateGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureSystemPressureState([self systemPressureState]));
  }
}

NAN_GETTER(NAVCaptureDevice::isVirtualDeviceGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVirtualDevice]));
  }
}

NAN_GETTER(NAVCaptureDevice::constituentDevicesGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureDevice*>([self constituentDevices]));
  }
}

NAN_GETTER(NAVCaptureDevice::hasFlashGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasFlash]));
  }
}

NAN_GETTER(NAVCaptureDevice::isFlashAvailableGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFlashAvailable]));
  }
}

#if !TARGET_OS_UIKITFORMAC
NAN_GETTER(NAVCaptureDevice::isFlashActiveGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFlashActive]));
  }
}
#endif

NAN_GETTER(NAVCaptureDevice::flashModeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureFlashMode([self flashMode]));
  }
}

NAN_SETTER(NAVCaptureDevice::flashModeSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureFlashMode, input);
    [self setFlashMode: input];
  }
}

NAN_GETTER(NAVCaptureDevice::hasTorchGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasTorch]));
  }
}

NAN_GETTER(NAVCaptureDevice::isTorchAvailableGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTorchAvailable]));
  }
}

NAN_GETTER(NAVCaptureDevice::isTorchActiveGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTorchActive]));
  }
}

NAN_GETTER(NAVCaptureDevice::torchLevelGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self torchLevel]));
  }
}

NAN_GETTER(NAVCaptureDevice::torchModeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureTorchMode([self torchMode]));
  }
}

NAN_SETTER(NAVCaptureDevice::torchModeSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureTorchMode, input);
    [self setTorchMode: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isLockingFocusWithCustomLensPositionSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLockingFocusWithCustomLensPositionSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::focusModeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureFocusMode([self focusMode]));
  }
}

NAN_SETTER(NAVCaptureDevice::focusModeSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureFocusMode, input);
    [self setFocusMode: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isFocusPointOfInterestSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFocusPointOfInterestSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::focusPointOfInterestGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self focusPointOfInterest]));
  }
}

NAN_SETTER(NAVCaptureDevice::focusPointOfInterestSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setFocusPointOfInterest: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isAdjustingFocusGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAdjustingFocus]));
  }
}

NAN_GETTER(NAVCaptureDevice::isAutoFocusRangeRestrictionSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAutoFocusRangeRestrictionSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::autoFocusRangeRestrictionGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureAutoFocusRangeRestriction([self autoFocusRangeRestriction]));
  }
}

NAN_SETTER(NAVCaptureDevice::autoFocusRangeRestrictionSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureAutoFocusRangeRestriction, input);
    [self setAutoFocusRangeRestriction: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isSmoothAutoFocusSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSmoothAutoFocusSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::isSmoothAutoFocusEnabledGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSmoothAutoFocusEnabled]));
  }
}

NAN_SETTER(NAVCaptureDevice::isSmoothAutoFocusEnabledSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSmoothAutoFocusEnabled: input];
  }
}

NAN_GETTER(NAVCaptureDevice::lensPositionGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self lensPosition]));
  }
}

NAN_GETTER(NAVCaptureDevice::exposureModeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureExposureMode([self exposureMode]));
  }
}

NAN_SETTER(NAVCaptureDevice::exposureModeSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureExposureMode, input);
    [self setExposureMode: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isExposurePointOfInterestSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isExposurePointOfInterestSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::exposurePointOfInterestGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self exposurePointOfInterest]));
  }
}

NAN_SETTER(NAVCaptureDevice::exposurePointOfInterestSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setExposurePointOfInterest: input];
  }
}

NAN_GETTER(NAVCaptureDevice::activeMaxExposureDurationGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self activeMaxExposureDuration]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeMaxExposureDurationSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setActiveMaxExposureDuration: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isAdjustingExposureGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAdjustingExposure]));
  }
}

NAN_GETTER(NAVCaptureDevice::lensApertureGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self lensAperture]));
  }
}

NAN_GETTER(NAVCaptureDevice::exposureDurationGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self exposureDuration]));
  }
}

NAN_GETTER(NAVCaptureDevice::ISOGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self ISO]));
  }
}

NAN_GETTER(NAVCaptureDevice::exposureTargetOffsetGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self exposureTargetOffset]));
  }
}

NAN_GETTER(NAVCaptureDevice::exposureTargetBiasGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self exposureTargetBias]));
  }
}

NAN_GETTER(NAVCaptureDevice::minExposureTargetBiasGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self minExposureTargetBias]));
  }
}

NAN_GETTER(NAVCaptureDevice::maxExposureTargetBiasGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self maxExposureTargetBias]));
  }
}

NAN_GETTER(NAVCaptureDevice::isLockingWhiteBalanceWithCustomDeviceGainsSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLockingWhiteBalanceWithCustomDeviceGainsSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::whiteBalanceModeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureWhiteBalanceMode([self whiteBalanceMode]));
  }
}

NAN_SETTER(NAVCaptureDevice::whiteBalanceModeSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureWhiteBalanceMode, input);
    [self setWhiteBalanceMode: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isAdjustingWhiteBalanceGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAdjustingWhiteBalance]));
  }
}

NAN_GETTER(NAVCaptureDevice::deviceWhiteBalanceGainsGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureWhiteBalanceGains([self deviceWhiteBalanceGains]));
  }
}

NAN_GETTER(NAVCaptureDevice::grayWorldDeviceWhiteBalanceGainsGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureWhiteBalanceGains([self grayWorldDeviceWhiteBalanceGains]));
  }
}

NAN_GETTER(NAVCaptureDevice::maxWhiteBalanceGainGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self maxWhiteBalanceGain]));
  }
}

NAN_GETTER(NAVCaptureDevice::isSubjectAreaChangeMonitoringEnabledGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSubjectAreaChangeMonitoringEnabled]));
  }
}

NAN_SETTER(NAVCaptureDevice::isSubjectAreaChangeMonitoringEnabledSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSubjectAreaChangeMonitoringEnabled: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isLowLightBoostSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLowLightBoostSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::isLowLightBoostEnabledGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLowLightBoostEnabled]));
  }
}

NAN_GETTER(NAVCaptureDevice::automaticallyEnablesLowLightBoostWhenAvailableGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyEnablesLowLightBoostWhenAvailable]));
  }
}

NAN_SETTER(NAVCaptureDevice::automaticallyEnablesLowLightBoostWhenAvailableSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyEnablesLowLightBoostWhenAvailable: input];
  }
}

NAN_GETTER(NAVCaptureDevice::videoZoomFactorGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self videoZoomFactor]));
  }
}

NAN_SETTER(NAVCaptureDevice::videoZoomFactorSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setVideoZoomFactor: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isRampingVideoZoomGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRampingVideoZoom]));
  }
}

NAN_GETTER(NAVCaptureDevice::dualCameraSwitchOverVideoZoomFactorGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self dualCameraSwitchOverVideoZoomFactor]));
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
NAN_GETTER(NAVCaptureDevice::transportControlsSupportedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self transportControlsSupported]));
  }
}

NAN_GETTER(NAVCaptureDevice::transportControlsPlaybackModeGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDeviceTransportControlsPlaybackMode([self transportControlsPlaybackMode]));
  }
}

NAN_GETTER(NAVCaptureDevice::transportControlsSpeedGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDeviceTransportControlsSpeed([self transportControlsSpeed]));
  }
}
#endif

NAN_GETTER(NAVCaptureDevice::automaticallyAdjustsVideoHDREnabledGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyAdjustsVideoHDREnabled]));
  }
}

NAN_SETTER(NAVCaptureDevice::automaticallyAdjustsVideoHDREnabledSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyAdjustsVideoHDREnabled: input];
  }
}

NAN_GETTER(NAVCaptureDevice::isVideoHDREnabledGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoHDREnabled]));
  }
}

NAN_SETTER(NAVCaptureDevice::isVideoHDREnabledSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setVideoHDREnabled: input];
  }
}

NAN_GETTER(NAVCaptureDevice::activeColorSpaceGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureColorSpace([self activeColorSpace]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeColorSpaceSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureColorSpace, input);
    [self setActiveColorSpace: input];
  }
}

NAN_GETTER(NAVCaptureDevice::activeDepthDataFormatGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureDeviceFormat([self activeDepthDataFormat]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeDepthDataFormatSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(AVCaptureDeviceFormat, input);
    [self setActiveDepthDataFormat: input];
  }
}

NAN_GETTER(NAVCaptureDevice::activeDepthDataMinFrameDurationGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self activeDepthDataMinFrameDuration]));
  }
}

NAN_SETTER(NAVCaptureDevice::activeDepthDataMinFrameDurationSetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setActiveDepthDataMinFrameDuration: input];
  }
}

NAN_GETTER(NAVCaptureDevice::minAvailableVideoZoomFactorGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minAvailableVideoZoomFactor]));
  }
}

NAN_GETTER(NAVCaptureDevice::maxAvailableVideoZoomFactorGetter) {
  JS_UNWRAP(AVCaptureDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maxAvailableVideoZoomFactor]));
  }
}
