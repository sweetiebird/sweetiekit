//
//  NSCNCamera.h
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNCamera_h
#define NSCNCamera_h    

#include "NNSObject.h"

#define js_value_SCNCamera(x) js_value_wrapper(x, SCNCamera)
#define to_value_SCNCamera(x) to_value_wrapper(x, SCNCamera)
#define is_value_SCNCamera(x) is_value_wrapper(x, SCNCamera)

// SceneKit enums
#define js_value_SCNCameraProjectionDirection(x) JS_ENUM(SCNCameraProjectionDirection, NSInteger, x)
#define to_value_SCNCameraProjectionDirection(x) TO_ENUM(SCNCameraProjectionDirection, NSInteger, x)
#define is_value_SCNCameraProjectionDirection(x) IS_ENUM(SCNCameraProjectionDirection, NSInteger, x)

JS_WRAP_CLASS(SCNCamera, NSObject);
  JS_PROP(name);
  JS_PROP(fieldOfView);
  JS_PROP(projectionDirection);
  JS_PROP(focalLength);
  JS_PROP(sensorHeight);
  JS_PROP(zNear);
  JS_PROP(zFar);
  JS_PROP(automaticallyAdjustsZRange);
  JS_PROP(usesOrthographicProjection);
  JS_PROP(orthographicScale);
  JS_PROP(projectionTransform);
  JS_PROP(wantsDepthOfField);
  JS_PROP(focusDistance);
  JS_PROP(focalBlurSampleCount);
  JS_PROP(fStop);
  JS_PROP(apertureBladeCount);
  JS_PROP(motionBlurIntensity);
  JS_PROP(screenSpaceAmbientOcclusionIntensity);
  JS_PROP(screenSpaceAmbientOcclusionRadius);
  JS_PROP(screenSpaceAmbientOcclusionBias);
  JS_PROP(screenSpaceAmbientOcclusionDepthThreshold);
  JS_PROP(screenSpaceAmbientOcclusionNormalThreshold);
  JS_PROP(wantsHDR);
  JS_PROP(exposureOffset);
  JS_PROP(averageGray);
  JS_PROP(whitePoint);
  JS_PROP(wantsExposureAdaptation);
  JS_PROP(exposureAdaptationBrighteningSpeedFactor);
  JS_PROP(exposureAdaptationDarkeningSpeedFactor);
  JS_PROP(minimumExposure);
  JS_PROP(maximumExposure);
  JS_PROP(bloomThreshold);
  JS_PROP(bloomIntensity);
  JS_PROP(bloomBlurRadius);
  JS_PROP(vignettingPower);
  JS_PROP(vignettingIntensity);
  JS_PROP(colorFringeStrength);
  JS_PROP(colorFringeIntensity);
  JS_PROP(saturation);
  JS_PROP(contrast);
  JS_PROP(colorGrading);
  JS_PROP(categoryBitMask);
  JS_PROP(focalBlurRadius);
  JS_PROP(xFov);
  JS_PROP(yFov);
  JS_PROP(aperture);
  JS_PROP(focalSize);
  JS_PROP(focalDistance);
JS_WRAP_CLASS_END(SCNCamera);

#endif /* NSCNCamera_h */
