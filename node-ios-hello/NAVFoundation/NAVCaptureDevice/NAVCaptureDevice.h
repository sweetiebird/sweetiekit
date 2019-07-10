//
//  NAVCaptureDevice.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureDevice_h
#define NAVCaptureDevice_h    

#include "NNSObject.h"

#define js_value_AVCaptureDevice(x) js_value_wrapper(x, AVCaptureDevice)
#define to_value_AVCaptureDevice(x) to_value_wrapper(x, AVCaptureDevice)
#define is_value_AVCaptureDevice(x) is_value_wrapper(x, AVCaptureDevice)

#define js_value_AVCaptureDevicePosition(x) JS_ENUM(AVCaptureDevicePosition, NSInteger, x)
#define to_value_AVCaptureDevicePosition(x) TO_ENUM(AVCaptureDevicePosition, NSInteger, x)
#define is_value_AVCaptureDevicePosition(x) IS_ENUM(AVCaptureDevicePosition, NSInteger, x)

#define js_value_AVCaptureFlashMode(x) JS_ENUM(AVCaptureFlashMode, NSInteger, x)
#define to_value_AVCaptureFlashMode(x) TO_ENUM(AVCaptureFlashMode, NSInteger, x)
#define is_value_AVCaptureFlashMode(x) IS_ENUM(AVCaptureFlashMode, NSInteger, x)

#define js_value_AVCaptureTorchMode(x) JS_ENUM(AVCaptureTorchMode, NSInteger, x)
#define to_value_AVCaptureTorchMode(x) TO_ENUM(AVCaptureTorchMode, NSInteger, x)
#define is_value_AVCaptureTorchMode(x) IS_ENUM(AVCaptureTorchMode, NSInteger, x)

#define js_value_AVCaptureFocusMode(x) JS_ENUM(AVCaptureFocusMode, NSInteger, x)
#define to_value_AVCaptureFocusMode(x) TO_ENUM(AVCaptureFocusMode, NSInteger, x)
#define is_value_AVCaptureFocusMode(x) IS_ENUM(AVCaptureFocusMode, NSInteger, x)

#define js_value_AVCaptureAutoFocusRangeRestriction(x) JS_ENUM(AVCaptureAutoFocusRangeRestriction, NSInteger, x)
#define to_value_AVCaptureAutoFocusRangeRestriction(x) TO_ENUM(AVCaptureAutoFocusRangeRestriction, NSInteger, x)
#define is_value_AVCaptureAutoFocusRangeRestriction(x) IS_ENUM(AVCaptureAutoFocusRangeRestriction, NSInteger, x)

#define js_value_AVCaptureExposureMode(x) JS_ENUM(AVCaptureExposureMode, NSInteger, x)
#define to_value_AVCaptureExposureMode(x) TO_ENUM(AVCaptureExposureMode, NSInteger, x)
#define is_value_AVCaptureExposureMode(x) IS_ENUM(AVCaptureExposureMode, NSInteger, x)

#define js_value_AVCaptureWhiteBalanceMode(x) JS_ENUM(AVCaptureWhiteBalanceMode, NSInteger, x)
#define to_value_AVCaptureWhiteBalanceMode(x) TO_ENUM(AVCaptureWhiteBalanceMode, NSInteger, x)
#define is_value_AVCaptureWhiteBalanceMode(x) IS_ENUM(AVCaptureWhiteBalanceMode, NSInteger, x)

#define js_value_AVAuthorizationStatus(x) JS_ENUM(AVAuthorizationStatus, NSInteger, x)
#define to_value_AVAuthorizationStatus(x) TO_ENUM(AVAuthorizationStatus, NSInteger, x)
#define is_value_AVAuthorizationStatus(x) IS_ENUM(AVAuthorizationStatus, NSInteger, x)

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
#define js_value_AVCaptureDeviceTransportControlsSpeed(x) JS_ENUM(AVCaptureDeviceTransportControlsSpeed, float, x)
#define to_value_AVCaptureDeviceTransportControlsSpeed(x) TO_ENUM(AVCaptureDeviceTransportControlsSpeed, float, x)
#define is_value_AVCaptureDeviceTransportControlsSpeed(x) IS_ENUM(AVCaptureDeviceTransportControlsSpeed, float, x)

#define js_value_AVCaptureDeviceTransportControlsPlaybackMode(x) JS_ENUM(AVCaptureDeviceTransportControlsPlaybackMode, NSInteger, x)
#define to_value_AVCaptureDeviceTransportControlsPlaybackMode(x) TO_ENUM(AVCaptureDeviceTransportControlsPlaybackMode, NSInteger, x)
#define is_value_AVCaptureDeviceTransportControlsPlaybackMode(x) IS_ENUM(AVCaptureDeviceTransportControlsPlaybackMode, NSInteger, x)
#endif

#define js_value_AVCaptureColorSpace(x) JS_ENUM(AVCaptureColorSpace, NSInteger, x)
#define to_value_AVCaptureColorSpace(x) TO_ENUM(AVCaptureColorSpace, NSInteger, x)
#define is_value_AVCaptureColorSpace(x) IS_ENUM(AVCaptureColorSpace, NSInteger, x)

#define js_value_AVCaptureVideoStabilizationMode(x) JS_ENUM(AVCaptureVideoStabilizationMode, NSInteger, x)
#define to_value_AVCaptureVideoStabilizationMode(x) TO_ENUM(AVCaptureVideoStabilizationMode, NSInteger, x)
#define is_value_AVCaptureVideoStabilizationMode(x) IS_ENUM(AVCaptureVideoStabilizationMode, NSInteger, x)

#define js_value_AVCaptureAutoFocusSystem(x) JS_ENUM(AVCaptureAutoFocusSystem, NSInteger, x)
#define to_value_AVCaptureAutoFocusSystem(x) TO_ENUM(AVCaptureAutoFocusSystem, NSInteger, x)
#define is_value_AVCaptureAutoFocusSystem(x) IS_ENUM(AVCaptureAutoFocusSystem, NSInteger, x)

#define js_value_AVCaptureDeviceType(x) JS_ENUM(AVCaptureDeviceType, NSString, x)
#define to_value_AVCaptureDeviceType(x) TO_ENUM(AVCaptureDeviceType, NSString, x)
#define is_value_AVCaptureDeviceType(x) IS_ENUM(AVCaptureDeviceType, NSString, x)

JS_DECLARE_STRUCT(AVCaptureWhiteBalanceGains);
JS_DECLARE_STRUCT(AVCaptureWhiteBalanceChromaticityValues);
JS_DECLARE_STRUCT(AVCaptureWhiteBalanceTemperatureAndTintValues);

JS_WRAP_CLASS(AVCaptureDevice, NSObject);
  JS_STATIC_METHOD(devices);
  JS_STATIC_METHOD(devicesWithMediaType);
  JS_STATIC_METHOD(defaultDeviceWithMediaType);
  JS_STATIC_METHOD(deviceWithUniqueID);
  JS_STATIC_METHOD(defaultDeviceWithDeviceTypeMediaTypePosition);
  JS_STATIC_METHOD(authorizationStatusForMediaType);
  JS_STATIC_METHOD(requestAccessForMediaTypeCompletionHandler);
  JS_STATIC_METHOD(extrinsicMatrixFromDeviceToDevice);
  JS_METHOD(hasMediaType);
  JS_METHOD(lockForConfiguration);
  JS_METHOD(unlockForConfiguration);
  JS_METHOD(supportsAVCaptureSessionPreset);
  JS_METHOD(isFlashModeSupported);
  JS_METHOD(isTorchModeSupported);
  JS_METHOD(setTorchModeOnWithLevelError);
  JS_METHOD(isFocusModeSupported);
  JS_METHOD(setFocusModeLockedWithLensPositionCompletionHandler);
  JS_METHOD(isExposureModeSupported);
  JS_METHOD(setExposureModeCustomWithDurationISOCompletionHandler);
  JS_METHOD(setExposureTargetBiasCompletionHandler);
  JS_METHOD(isWhiteBalanceModeSupported);
  JS_METHOD(setWhiteBalanceModeLockedWithDeviceWhiteBalanceGainsCompletionHandler);
  JS_METHOD(chromaticityValuesForDeviceWhiteBalanceGains);
  JS_METHOD(deviceWhiteBalanceGainsForChromaticityValues);
  JS_METHOD(temperatureAndTintValuesForDeviceWhiteBalanceGains);
  JS_METHOD(deviceWhiteBalanceGainsForTemperatureAndTintValues);
  JS_METHOD(rampToVideoZoomFactorWithRate);
  JS_METHOD(cancelVideoZoomRamp);
  JS_METHOD(setTransportControlsPlaybackModeSpeed);
  JS_PROP_READONLY(uniqueID);
  JS_PROP_READONLY(modelID);
  JS_PROP_READONLY(localizedName);
  JS_PROP_READONLY(manufacturer);
  JS_PROP_READONLY(transportType);
  JS_PROP_READONLY(isConnected);
  JS_PROP_READONLY(isInUseByAnotherApplication);
  JS_PROP_READONLY(isSuspended);
  JS_PROP_READONLY(linkedDevices);
  JS_PROP_READONLY(formats);
  JS_PROP(activeFormat);
  JS_PROP(activeVideoMinFrameDuration);
  JS_PROP(activeVideoMaxFrameDuration);
  JS_PROP_READONLY(inputSources);
  JS_PROP(activeInputSource);
  JS_PROP_READONLY(position);
  JS_PROP_READONLY(deviceType);
  JS_PROP_READONLY(systemPressureState);
  JS_PROP_READONLY(isVirtualDevice);
  JS_PROP_READONLY(constituentDevices);
  JS_PROP_READONLY(hasFlash);
  JS_PROP_READONLY(isFlashAvailable);
  JS_PROP_READONLY(isFlashActive);
  JS_PROP(flashMode);
  JS_PROP_READONLY(hasTorch);
  JS_PROP_READONLY(isTorchAvailable);
  JS_PROP_READONLY(isTorchActive);
  JS_PROP_READONLY(torchLevel);
  JS_PROP(torchMode);
  JS_PROP_READONLY(isLockingFocusWithCustomLensPositionSupported);
  JS_PROP(focusMode);
  JS_PROP_READONLY(isFocusPointOfInterestSupported);
  JS_PROP(focusPointOfInterest);
  JS_PROP_READONLY(isAdjustingFocus);
  JS_PROP_READONLY(isAutoFocusRangeRestrictionSupported);
  JS_PROP(autoFocusRangeRestriction);
  JS_PROP_READONLY(isSmoothAutoFocusSupported);
  JS_PROP(isSmoothAutoFocusEnabled);
  JS_PROP_READONLY(lensPosition);
  JS_PROP(exposureMode);
  JS_PROP_READONLY(isExposurePointOfInterestSupported);
  JS_PROP(exposurePointOfInterest);
  JS_PROP(activeMaxExposureDuration);
  JS_PROP_READONLY(isAdjustingExposure);
  JS_PROP_READONLY(lensAperture);
  JS_PROP_READONLY(exposureDuration);
  JS_PROP_READONLY(ISO);
  JS_PROP_READONLY(exposureTargetOffset);
  JS_PROP_READONLY(exposureTargetBias);
  JS_PROP_READONLY(minExposureTargetBias);
  JS_PROP_READONLY(maxExposureTargetBias);
  JS_PROP_READONLY(isLockingWhiteBalanceWithCustomDeviceGainsSupported);
  JS_PROP(whiteBalanceMode);
  JS_PROP_READONLY(isAdjustingWhiteBalance);
  JS_PROP_READONLY(deviceWhiteBalanceGains);
  JS_PROP_READONLY(grayWorldDeviceWhiteBalanceGains);
  JS_PROP_READONLY(maxWhiteBalanceGain);
  JS_PROP(isSubjectAreaChangeMonitoringEnabled);
  JS_PROP_READONLY(isLowLightBoostSupported);
  JS_PROP_READONLY(isLowLightBoostEnabled);
  JS_PROP(automaticallyEnablesLowLightBoostWhenAvailable);
  JS_PROP(videoZoomFactor);
  JS_PROP_READONLY(isRampingVideoZoom);
  JS_PROP_READONLY(dualCameraSwitchOverVideoZoomFactor);
  JS_PROP_READONLY(transportControlsSupported);
  JS_PROP_READONLY(transportControlsPlaybackMode);
  JS_PROP_READONLY(transportControlsSpeed);
  JS_PROP(automaticallyAdjustsVideoHDREnabled);
  JS_PROP(isVideoHDREnabled);
  JS_PROP(activeColorSpace);
  JS_PROP(activeDepthDataFormat);
  JS_PROP(activeDepthDataMinFrameDuration);
  JS_PROP_READONLY(minAvailableVideoZoomFactor);
  JS_PROP_READONLY(maxAvailableVideoZoomFactor);
JS_WRAP_CLASS_END(AVCaptureDevice);

#endif /* NAVCaptureDevice_h */
