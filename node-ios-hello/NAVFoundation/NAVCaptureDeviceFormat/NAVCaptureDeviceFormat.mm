//
//  NAVCaptureDeviceFormat.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureDeviceFormat.h"

#define instancetype AVCaptureDeviceFormat
#define js_value_instancetype js_value_AVCaptureDeviceFormat

NAVCaptureDeviceFormat::NAVCaptureDeviceFormat() {}
NAVCaptureDeviceFormat::~NAVCaptureDeviceFormat() {}

JS_INIT_CLASS(AVCaptureDeviceFormat, NSObject);
  JS_ASSIGN_PROTO_METHOD(isVideoStabilizationModeSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(mediaType);
  JS_ASSIGN_PROTO_PROP_READONLY(formatDescription);
  JS_ASSIGN_PROTO_PROP_READONLY(videoSupportedFrameRateRanges);
  JS_ASSIGN_PROTO_PROP_READONLY(videoFieldOfView);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoBinned);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoStabilizationSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(videoMaxZoomFactor);
  JS_ASSIGN_PROTO_PROP_READONLY(videoZoomFactorUpscaleThreshold);
  JS_ASSIGN_PROTO_PROP_READONLY(minExposureDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(maxExposureDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(minISO);
  JS_ASSIGN_PROTO_PROP_READONLY(maxISO);
  JS_ASSIGN_PROTO_PROP_READONLY(isVideoHDRSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(highResolutionStillImageDimensions);
  #if TARGET_OS_IPHONE_13_0
    JS_ASSIGN_PROTO_PROP_READONLY(isHighestPhotoQualitySupported);
  #endif
  JS_ASSIGN_PROTO_PROP_READONLY(autoFocusSystem);
  JS_ASSIGN_PROTO_PROP_READONLY(supportedColorSpaces);
  JS_ASSIGN_PROTO_PROP_READONLY(videoMinZoomFactorForDepthDataDelivery);
  JS_ASSIGN_PROTO_PROP_READONLY(videoMaxZoomFactorForDepthDataDelivery);
  JS_ASSIGN_PROTO_PROP_READONLY(supportedDepthDataFormats);
  JS_ASSIGN_PROTO_PROP_READONLY(unsupportedCaptureOutputClasses);
  JS_ASSIGN_PROTO_PROP_READONLY(isPortraitEffectsMatteStillImageDeliverySupported);
  #if TARGET_OS_IPHONE_13_0
    JS_ASSIGN_PROTO_PROP_READONLY(isMultiCamSupported);
  #endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureDeviceFormat, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureDeviceFormat, NSObject);

NAN_METHOD(NAVCaptureDeviceFormat::New) {
  JS_RECONSTRUCT(AVCaptureDeviceFormat);
  @autoreleasepool {
    AVCaptureDeviceFormat* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureDeviceFormat *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureDeviceFormat *wrapper = new NAVCaptureDeviceFormat();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureDeviceFormat::New: invalid arguments");
    }
  }
}

#include "NAVCaptureDevice.h"

NAN_METHOD(NAVCaptureDeviceFormat::isVideoStabilizationModeSupported) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVCaptureVideoStabilizationMode, videoStabilizationMode);
    JS_SET_RETURN(js_value_BOOL([self isVideoStabilizationModeSupported: videoStabilizationMode]));
  }
}

#include "NAVMediaFormat.h"

NAN_GETTER(NAVCaptureDeviceFormat::mediaTypeGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVMediaType([self mediaType]));
  }
}

#include "NCMFormatDescription.h"

NAN_GETTER(NAVCaptureDeviceFormat::formatDescriptionGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMFormatDescriptionRef([self formatDescription]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::videoSupportedFrameRateRangesGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVFrameRateRange*>([self videoSupportedFrameRateRanges]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::videoFieldOfViewGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self videoFieldOfView]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::isVideoBinnedGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoBinned]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::isVideoStabilizationSupportedGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoStabilizationSupported]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::videoMaxZoomFactorGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self videoMaxZoomFactor]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::videoZoomFactorUpscaleThresholdGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self videoZoomFactorUpscaleThreshold]));
  }
}

#include "NCMTime.h"

NAN_GETTER(NAVCaptureDeviceFormat::minExposureDurationGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self minExposureDuration]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::maxExposureDurationGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self maxExposureDuration]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::minISOGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self minISO]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::maxISOGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self maxISO]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::isVideoHDRSupportedGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVideoHDRSupported]));
  }
}

#include "NCMFormatDescription.h"

NAN_GETTER(NAVCaptureDeviceFormat::highResolutionStillImageDimensionsGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMVideoDimensions([self highResolutionStillImageDimensions]));
  }
}

#if TARGET_OS_IPHONE_13_0
  NAN_GETTER(NAVCaptureDeviceFormat::isHighestPhotoQualitySupportedGetter) {
    JS_UNWRAP(AVCaptureDeviceFormat, self);
    declare_autoreleasepool {
      JS_SET_RETURN(js_value_BOOL([self isHighestPhotoQualitySupported]));
    }
  }
#endif

NAN_GETTER(NAVCaptureDeviceFormat::autoFocusSystemGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureAutoFocusSystem([self autoFocusSystem]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::supportedColorSpacesGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self supportedColorSpaces]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::videoMinZoomFactorForDepthDataDeliveryGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self videoMinZoomFactorForDepthDataDelivery]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::videoMaxZoomFactorForDepthDataDeliveryGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self videoMaxZoomFactorForDepthDataDelivery]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::supportedDepthDataFormatsGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVCaptureDeviceFormat*>([self supportedDepthDataFormats]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::unsupportedCaptureOutputClassesGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<Class>([self unsupportedCaptureOutputClasses]));
  }
}

NAN_GETTER(NAVCaptureDeviceFormat::isPortraitEffectsMatteStillImageDeliverySupportedGetter) {
  JS_UNWRAP(AVCaptureDeviceFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPortraitEffectsMatteStillImageDeliverySupported]));
  }
}

#if TARGET_OS_IPHONE_13_0
  NAN_GETTER(NAVCaptureDeviceFormat::isMultiCamSupportedGetter) {
    JS_UNWRAP(AVCaptureDeviceFormat, self);
    declare_autoreleasepool {
      JS_SET_RETURN(js_value_BOOL([self isMultiCamSupported]));
    }
  }
#endif
