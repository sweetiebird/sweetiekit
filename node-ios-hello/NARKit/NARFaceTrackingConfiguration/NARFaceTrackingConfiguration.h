//
//  NARFaceTrackingConfiguration.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARFaceTrackingConfiguration_h
#define NARFaceTrackingConfiguration_h    

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#include "NARConfiguration.h"

#define js_value_ARFaceTrackingConfiguration(x) js_value_wrapper(x, ARFaceTrackingConfiguration)
#define to_value_ARFaceTrackingConfiguration(x) to_value_wrapper(x, ARFaceTrackingConfiguration)
#define is_value_ARFaceTrackingConfiguration(x) is_value_wrapper(x, ARFaceTrackingConfiguration)

JS_WRAP_CLASS(ARFaceTrackingConfiguration, ARConfiguration);
  JS_STATIC_PROP_READONLY(isSupported);
  JS_STATIC_PROP_READONLY(supportedVideoFormats);
JS_WRAP_CLASS_END(ARFaceTrackingConfiguration);

#endif

#endif /* NARFaceTrackingConfiguration_h */
