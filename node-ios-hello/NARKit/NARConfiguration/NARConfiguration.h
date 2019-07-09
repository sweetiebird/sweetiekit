//
//  NARConfiguration.h
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARConfiguration_h
#define NARConfiguration_h

#include "NNSObject.h"

#ifdef __IPHONEOS__

#define js_value_ARConfiguration(x) js_value_wrapper(x, ARConfiguration)
#define to_value_ARConfiguration(x) to_value_wrapper(x, ARConfiguration)
#define is_value_ARConfiguration(x) is_value_wrapper(x, ARConfiguration)

#define js_value_ARWorldAlignment(x) JS_ENUM(ARWorldAlignment, NSInteger, x)
#define to_value_ARWorldAlignment(x) TO_ENUM(ARWorldAlignment, NSInteger, x)
#define is_value_ARWorldAlignment(x) IS_ENUM(ARWorldAlignment, NSInteger, x)

#define js_value_AREnvironmentTexturing(x) JS_ENUM(AREnvironmentTexturing, NSInteger, x)
#define to_value_AREnvironmentTexturing(x) TO_ENUM(AREnvironmentTexturing, NSInteger, x)
#define is_value_AREnvironmentTexturing(x) IS_ENUM(AREnvironmentTexturing, NSInteger, x)

#define js_value_ARPlaneDetection(x) JS_OPTS(ARPlaneDetection, NSUInteger, x)
#define to_value_ARPlaneDetection(x) TO_OPTS(ARPlaneDetection, NSUInteger, x)
#define is_value_ARPlaneDetection(x) IS_OPTS(ARPlaneDetection, NSUInteger, x)

JS_WRAP_CLASS(ARConfiguration, NSObject);
  JS_PROP(videoFormat);
  JS_PROP(worldAlignment);
  JS_PROP(isLightEstimationEnabled);
  JS_PROP(providesAudioData);
JS_WRAP_CLASS_END(ARConfiguration);

#endif

#endif /* NARConfiguration_h */
