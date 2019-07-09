//
//  NARImageTrackingConfiguration.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARImageTrackingConfiguration_h
#define NARImageTrackingConfiguration_h    

#include "NARConfiguration.h"

#ifdef __IPHONEOS__

#define js_value_ARImageTrackingConfiguration(x) js_value_wrapper(x, ARImageTrackingConfiguration)
#define to_value_ARImageTrackingConfiguration(x) to_value_wrapper(x, ARImageTrackingConfiguration)
#define is_value_ARImageTrackingConfiguration(x) is_value_wrapper(x, ARImageTrackingConfiguration)

JS_WRAP_CLASS(ARImageTrackingConfiguration, ARConfiguration);
  JS_STATIC_PROP_READONLY(isSupported);
  JS_STATIC_PROP_READONLY(supportedVideoFormats);
  JS_PROP(isAutoFocusEnabled);
  JS_PROP(trackingImages);
  JS_PROP(maximumNumberOfTrackedImages);
JS_WRAP_CLASS_END(ARImageTrackingConfiguration);

#endif

#endif /* NARImageTrackingConfiguration_h */
