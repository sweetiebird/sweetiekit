//
//  NARWorldTrackingConfiguration.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARWorldTrackingConfiguration_h
#define NARWorldTrackingConfiguration_h

#include "NARConfiguration.h"

#if TARGET_OS_IPHONE

#define js_value_ARWorldTrackingConfiguration(x) js_value_wrapper(x, ARWorldTrackingConfiguration)
#define to_value_ARWorldTrackingConfiguration(x) to_value_wrapper(x, ARWorldTrackingConfiguration)
#define is_value_ARWorldTrackingConfiguration(x) is_value_wrapper(x, ARWorldTrackingConfiguration)

JS_WRAP_CLASS(ARWorldTrackingConfiguration, ARConfiguration);
  JS_STATIC_PROP_READONLY(isSupported);
  JS_STATIC_PROP_READONLY(supportedVideoFormats);
  JS_PROP(isAutoFocusEnabled);
  JS_PROP(environmentTexturing);
  JS_PROP(planeDetection);
  JS_PROP(initialWorldMap);
  JS_PROP(detectionImages);
  JS_PROP(maximumNumberOfTrackedImages);
  JS_PROP(detectionObjects);
JS_WRAP_CLASS_END(ARWorldTrackingConfiguration);

#endif

#endif /* NARWorldTrackingConfiguration_h */
