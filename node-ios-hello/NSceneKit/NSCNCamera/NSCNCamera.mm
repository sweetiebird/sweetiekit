//
//  NSCNCamera.mm
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNCamera.h"

NSCNCamera::NSCNCamera() {}
NSCNCamera::~NSCNCamera() {}

JS_INIT_CLASS(SCNCamera, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, name);
  JS_ASSIGN_PROP(proto, fieldOfView);
  JS_ASSIGN_PROP(proto, projectionDirection);
  JS_ASSIGN_PROP(proto, focalLength);
  JS_ASSIGN_PROP(proto, sensorHeight);
  JS_ASSIGN_PROP(proto, zNear);
  JS_ASSIGN_PROP(proto, zFar);
  JS_ASSIGN_PROP(proto, automaticallyAdjustsZRange);
  JS_ASSIGN_PROP(proto, usesOrthographicProjection);
  JS_ASSIGN_PROP(proto, orthographicScale);
  JS_ASSIGN_PROP(proto, projectionTransform);
  JS_ASSIGN_PROP(proto, wantsDepthOfField);
  JS_ASSIGN_PROP(proto, focusDistance);
  JS_ASSIGN_PROP(proto, focalBlurSampleCount);
  JS_ASSIGN_PROP(proto, fStop);
  JS_ASSIGN_PROP(proto, apertureBladeCount);
  JS_ASSIGN_PROP(proto, motionBlurIntensity);
  JS_ASSIGN_PROP(proto, screenSpaceAmbientOcclusionIntensity);
  JS_ASSIGN_PROP(proto, screenSpaceAmbientOcclusionRadius);
  JS_ASSIGN_PROP(proto, screenSpaceAmbientOcclusionBias);
  JS_ASSIGN_PROP(proto, screenSpaceAmbientOcclusionDepthThreshold);
  JS_ASSIGN_PROP(proto, screenSpaceAmbientOcclusionNormalThreshold);
  JS_ASSIGN_PROP(proto, wantsHDR);
  JS_ASSIGN_PROP(proto, exposureOffset);
  JS_ASSIGN_PROP(proto, averageGray);
  JS_ASSIGN_PROP(proto, whitePoint);
  JS_ASSIGN_PROP(proto, wantsExposureAdaptation);
  JS_ASSIGN_PROP(proto, exposureAdaptationBrighteningSpeedFactor);
  JS_ASSIGN_PROP(proto, exposureAdaptationDarkeningSpeedFactor);
  JS_ASSIGN_PROP(proto, minimumExposure);
  JS_ASSIGN_PROP(proto, maximumExposure);
  JS_ASSIGN_PROP(proto, bloomThreshold);
  JS_ASSIGN_PROP(proto, bloomIntensity);
  JS_ASSIGN_PROP(proto, bloomBlurRadius);
  JS_ASSIGN_PROP(proto, vignettingPower);
  JS_ASSIGN_PROP(proto, vignettingIntensity);
  JS_ASSIGN_PROP(proto, colorFringeStrength);
  JS_ASSIGN_PROP(proto, colorFringeIntensity);
  JS_ASSIGN_PROP(proto, saturation);
  JS_ASSIGN_PROP(proto, contrast);
  JS_ASSIGN_PROP_READONLY(proto, colorGrading);
  JS_ASSIGN_PROP(proto, categoryBitMask);
  JS_ASSIGN_PROP(proto, focalBlurRadius);
  JS_ASSIGN_PROP(proto, xFov);
  JS_ASSIGN_PROP(proto, yFov);
  JS_ASSIGN_PROP(proto, aperture);
  JS_ASSIGN_PROP(proto, focalSize);
  JS_ASSIGN_PROP(proto, focalDistance);
  // static members (ctor)
  JS_INIT_CTOR(SCNCamera, NSObject);
JS_INIT_CLASS_END(SCNCamera, NSObject);

NAN_METHOD(NSCNCamera::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'SCNCamera(...)', turn into construct call.
      JS_SET_RETURN_NEW(SCNCamera, info);
      return;
    }

    SCNCamera* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNCamera *)(info[0].As<External>()->Value());
    } else if(info.Length() <= 0) {
      self = [[SCNCamera alloc] init];
    }
    if (self) {
      NSCNCamera *wrapper = new NSCNCamera();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNCamera::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNCamera::nameGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self name]));
    return;
  }
}

NAN_SETTER(NSCNCamera::nameSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setName: to_value_NSString(value)];
  }
}

NAN_GETTER(NSCNCamera::fieldOfViewGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self fieldOfView]));
    return;
  }
}

NAN_SETTER(NSCNCamera::fieldOfViewSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFieldOfView: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::projectionDirectionGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNCameraProjectionDirection([self projectionDirection]));
    return;
  }
}

NAN_SETTER(NSCNCamera::projectionDirectionSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setProjectionDirection: to_value_SCNCameraProjectionDirection(value)];
  }
}

NAN_GETTER(NSCNCamera::focalLengthGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self focalLength]));
    return;
  }
}

NAN_SETTER(NSCNCamera::focalLengthSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFocalLength: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::sensorHeightGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self sensorHeight]));
    return;
  }
}

NAN_SETTER(NSCNCamera::sensorHeightSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setSensorHeight: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::zNearGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_double([self zNear]));
    return;
  }
}

NAN_SETTER(NSCNCamera::zNearSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setZNear: to_value_double(value)];
  }
}

NAN_GETTER(NSCNCamera::zFarGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_double([self zFar]));
    return;
  }
}

NAN_SETTER(NSCNCamera::zFarSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setZFar: to_value_double(value)];
  }
}

NAN_GETTER(NSCNCamera::automaticallyAdjustsZRangeGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self automaticallyAdjustsZRange]));
    return;
  }
}

NAN_SETTER(NSCNCamera::automaticallyAdjustsZRangeSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setAutomaticallyAdjustsZRange: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNCamera::usesOrthographicProjectionGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self usesOrthographicProjection]));
    return;
  }
}

NAN_SETTER(NSCNCamera::usesOrthographicProjectionSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setUsesOrthographicProjection: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNCamera::orthographicScaleGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_double([self orthographicScale]));
    return;
  }
}

NAN_SETTER(NSCNCamera::orthographicScaleSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setOrthographicScale: to_value_double(value)];
  }
}

NAN_GETTER(NSCNCamera::projectionTransformGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMatrix4([self projectionTransform]));
    return;
  }
}

NAN_SETTER(NSCNCamera::projectionTransformSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setProjectionTransform: to_value_SCNMatrix4(value)];
  }
}

NAN_GETTER(NSCNCamera::wantsDepthOfFieldGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self wantsDepthOfField]));
    return;
  }
}

NAN_SETTER(NSCNCamera::wantsDepthOfFieldSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setWantsDepthOfField: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNCamera::focusDistanceGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self focusDistance]));
    return;
  }
}

NAN_SETTER(NSCNCamera::focusDistanceSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFocusDistance: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::focalBlurSampleCountGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self focalBlurSampleCount]));
    return;
  }
}

NAN_SETTER(NSCNCamera::focalBlurSampleCountSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFocalBlurSampleCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNCamera::fStopGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self fStop]));
    return;
  }
}

NAN_SETTER(NSCNCamera::fStopSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFStop: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::apertureBladeCountGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self apertureBladeCount]));
    return;
  }
}

NAN_SETTER(NSCNCamera::apertureBladeCountSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setApertureBladeCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNCamera::motionBlurIntensityGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self motionBlurIntensity]));
    return;
  }
}

NAN_SETTER(NSCNCamera::motionBlurIntensitySetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setMotionBlurIntensity: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::screenSpaceAmbientOcclusionIntensityGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self screenSpaceAmbientOcclusionIntensity]));
    return;
  }
}

NAN_SETTER(NSCNCamera::screenSpaceAmbientOcclusionIntensitySetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setScreenSpaceAmbientOcclusionIntensity: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::screenSpaceAmbientOcclusionRadiusGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self screenSpaceAmbientOcclusionRadius]));
    return;
  }
}

NAN_SETTER(NSCNCamera::screenSpaceAmbientOcclusionRadiusSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setScreenSpaceAmbientOcclusionRadius: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::screenSpaceAmbientOcclusionBiasGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self screenSpaceAmbientOcclusionBias]));
    return;
  }
}

NAN_SETTER(NSCNCamera::screenSpaceAmbientOcclusionBiasSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setScreenSpaceAmbientOcclusionBias: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::screenSpaceAmbientOcclusionDepthThresholdGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self screenSpaceAmbientOcclusionDepthThreshold]));
    return;
  }
}

NAN_SETTER(NSCNCamera::screenSpaceAmbientOcclusionDepthThresholdSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setScreenSpaceAmbientOcclusionDepthThreshold: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::screenSpaceAmbientOcclusionNormalThresholdGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self screenSpaceAmbientOcclusionNormalThreshold]));
    return;
  }
}

NAN_SETTER(NSCNCamera::screenSpaceAmbientOcclusionNormalThresholdSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setScreenSpaceAmbientOcclusionNormalThreshold: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::wantsHDRGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self wantsHDR]));
    return;
  }
}

NAN_SETTER(NSCNCamera::wantsHDRSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setWantsHDR: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNCamera::exposureOffsetGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self exposureOffset]));
    return;
  }
}

NAN_SETTER(NSCNCamera::exposureOffsetSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setExposureOffset: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::averageGrayGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self averageGray]));
    return;
  }
}

NAN_SETTER(NSCNCamera::averageGraySetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setAverageGray: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::whitePointGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self whitePoint]));
    return;
  }
}

NAN_SETTER(NSCNCamera::whitePointSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setWhitePoint: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::wantsExposureAdaptationGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self wantsExposureAdaptation]));
    return;
  }
}

NAN_SETTER(NSCNCamera::wantsExposureAdaptationSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setWantsExposureAdaptation: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNCamera::exposureAdaptationBrighteningSpeedFactorGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self exposureAdaptationBrighteningSpeedFactor]));
    return;
  }
}

NAN_SETTER(NSCNCamera::exposureAdaptationBrighteningSpeedFactorSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setExposureAdaptationBrighteningSpeedFactor: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::exposureAdaptationDarkeningSpeedFactorGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self exposureAdaptationDarkeningSpeedFactor]));
    return;
  }
}

NAN_SETTER(NSCNCamera::exposureAdaptationDarkeningSpeedFactorSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setExposureAdaptationDarkeningSpeedFactor: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::minimumExposureGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self minimumExposure]));
    return;
  }
}

NAN_SETTER(NSCNCamera::minimumExposureSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setMinimumExposure: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::maximumExposureGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self maximumExposure]));
    return;
  }
}

NAN_SETTER(NSCNCamera::maximumExposureSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setMaximumExposure: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::bloomThresholdGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self bloomThreshold]));
    return;
  }
}

NAN_SETTER(NSCNCamera::bloomThresholdSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setBloomThreshold: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::bloomIntensityGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self bloomIntensity]));
    return;
  }
}

NAN_SETTER(NSCNCamera::bloomIntensitySetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setBloomIntensity: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::bloomBlurRadiusGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self bloomBlurRadius]));
    return;
  }
}

NAN_SETTER(NSCNCamera::bloomBlurRadiusSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setBloomBlurRadius: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::vignettingPowerGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self vignettingPower]));
    return;
  }
}

NAN_SETTER(NSCNCamera::vignettingPowerSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setVignettingPower: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::vignettingIntensityGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self vignettingIntensity]));
    return;
  }
}

NAN_SETTER(NSCNCamera::vignettingIntensitySetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setVignettingIntensity: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::colorFringeStrengthGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self colorFringeStrength]));
    return;
  }
}

NAN_SETTER(NSCNCamera::colorFringeStrengthSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setColorFringeStrength: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::colorFringeIntensityGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self colorFringeIntensity]));
    return;
  }
}

NAN_SETTER(NSCNCamera::colorFringeIntensitySetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setColorFringeIntensity: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::saturationGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self saturation]));
    return;
  }
}

NAN_SETTER(NSCNCamera::saturationSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setSaturation: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::contrastGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self contrast]));
    return;
  }
}

NAN_SETTER(NSCNCamera::contrastSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setContrast: to_value_CGFloat(value)];
  }
}

#include "NSCNMaterialProperty.h"

NAN_GETTER(NSCNCamera::colorGradingGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self colorGrading]));
    return;
  }
}

NAN_GETTER(NSCNCamera::categoryBitMaskGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self categoryBitMask]));
    return;
  }
}

NAN_SETTER(NSCNCamera::categoryBitMaskSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setCategoryBitMask: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSCNCamera::focalBlurRadiusGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self focalBlurRadius]));
    return;
  }
}

NAN_SETTER(NSCNCamera::focalBlurRadiusSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFocalBlurRadius: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::xFovGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_double([self xFov]));
    return;
  }
}

NAN_SETTER(NSCNCamera::xFovSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setXFov: to_value_double(value)];
  }
}

NAN_GETTER(NSCNCamera::yFovGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_double([self yFov]));
    return;
  }
}

NAN_SETTER(NSCNCamera::yFovSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setYFov: to_value_double(value)];
  }
}

NAN_GETTER(NSCNCamera::apertureGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self aperture]));
    return;
  }
}

NAN_SETTER(NSCNCamera::apertureSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setAperture: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::focalSizeGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self focalSize]));
    return;
  }
}

NAN_SETTER(NSCNCamera::focalSizeSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFocalSize: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNCamera::focalDistanceGetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self focalDistance]));
    return;
  }
}

NAN_SETTER(NSCNCamera::focalDistanceSetter) {
  JS_UNWRAP(SCNCamera, self);
  @autoreleasepool
  {
    [self setFocalDistance: to_value_CGFloat(value)];
  }
}
