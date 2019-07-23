//
//  NARFrame.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARFrame_h
#define NARFrame_h

#include "NNSObject.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define js_value_ARSegmentationClass(x) JS_ENUM(ARSegmentationClass, uint8_t, x)
#define to_value_ARSegmentationClass(x) TO_ENUM(ARSegmentationClass, uint8_t, x)
#define is_value_ARSegmentationClass(x) IS_ENUM(ARSegmentationClass, uint8_t, x)

#define js_value_ARWorldMappingStatus(x) JS_ENUM(ARWorldMappingStatus, NSInteger, x)
#define to_value_ARWorldMappingStatus(x) TO_ENUM(ARWorldMappingStatus, NSInteger, x)
#define is_value_ARWorldMappingStatus(x) IS_ENUM(ARWorldMappingStatus, NSInteger, x)

#define js_value_ARFrame(x) js_value_wrapper(x, ARFrame)
#define to_value_ARFrame(x) to_value_wrapper(x, ARFrame)
#define is_value_ARFrame(x) is_value_wrapper(x, ARFrame)

JS_WRAP_CLASS(ARFrame, NSObject);
  JS_METHOD(hitTestTypes);
  JS_METHOD(raycastQueryFromPointAllowingTargetAlignment);
  JS_METHOD(displayTransformForOrientationViewportSize);
  JS_PROP_READONLY(timestamp);
  JS_PROP_READONLY(capturedImage);
  JS_PROP_READONLY(cameraGrainTexture);
  JS_PROP_READONLY(cameraGrainIntensity);
  JS_PROP_READONLY(capturedDepthData);
  JS_PROP_READONLY(capturedDepthDataTimestamp);
  JS_PROP_READONLY(camera);
  JS_PROP_READONLY(anchors);
  JS_PROP_READONLY(lightEstimate);
  JS_PROP_READONLY(rawFeaturePoints);
  JS_PROP_READONLY(worldMappingStatus);
  JS_PROP_READONLY(segmentationBuffer);
  JS_PROP_READONLY(estimatedDepthData);
  JS_PROP_READONLY(detectedBody);
JS_WRAP_CLASS_END(ARFrame);

#endif

#endif /* NARFrame_h */
