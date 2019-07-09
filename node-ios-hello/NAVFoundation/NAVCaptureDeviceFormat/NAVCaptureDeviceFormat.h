//
//  NAVCaptureDeviceFormat.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureDeviceFormat_h
#define NAVCaptureDeviceFormat_h    

#include "NNSObject.h"

#define js_value_AVCaptureDeviceFormat(x) js_value_wrapper(x, AVCaptureDeviceFormat)
#define to_value_AVCaptureDeviceFormat(x) to_value_wrapper(x, AVCaptureDeviceFormat)
#define is_value_AVCaptureDeviceFormat(x) is_value_wrapper(x, AVCaptureDeviceFormat)

JS_WRAP_CLASS(AVCaptureDeviceFormat, NSObject);
  JS_METHOD(isVideoStabilizationModeSupported);
  JS_PROP_READONLY(mediaType);
  JS_PROP_READONLY(formatDescription);
  JS_PROP_READONLY(videoSupportedFrameRateRanges);
  JS_PROP_READONLY(videoFieldOfView);
  JS_PROP_READONLY(isVideoBinned);
  JS_PROP_READONLY(isVideoStabilizationSupported);
  JS_PROP_READONLY(videoMaxZoomFactor);
  JS_PROP_READONLY(videoZoomFactorUpscaleThreshold);
  JS_PROP_READONLY(minExposureDuration);
  JS_PROP_READONLY(maxExposureDuration);
  JS_PROP_READONLY(minISO);
  JS_PROP_READONLY(maxISO);
  JS_PROP_READONLY(isVideoHDRSupported);
  JS_PROP_READONLY(highResolutionStillImageDimensions);
  JS_PROP_READONLY(isHighestPhotoQualitySupported);
  JS_PROP_READONLY(autoFocusSystem);
  JS_PROP_READONLY(supportedColorSpaces);
  JS_PROP_READONLY(videoMinZoomFactorForDepthDataDelivery);
  JS_PROP_READONLY(videoMaxZoomFactorForDepthDataDelivery);
  JS_PROP_READONLY(supportedDepthDataFormats);
  JS_PROP_READONLY(unsupportedCaptureOutputClasses);
  JS_PROP_READONLY(isPortraitEffectsMatteStillImageDeliverySupported);
  JS_PROP_READONLY(isMultiCamSupported);
JS_WRAP_CLASS_END(AVCaptureDeviceFormat);

#endif /* NAVCaptureDeviceFormat_h */
