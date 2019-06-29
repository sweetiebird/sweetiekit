//
//  NAROrientationTrackingConfiguration.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAROrientationTrackingConfiguration_h
#define NAROrientationTrackingConfiguration_h    

#include "NARConfiguration.h"

#define js_value_AROrientationTrackingConfiguration(x) js_value_wrapper(x, AROrientationTrackingConfiguration)
#define to_value_AROrientationTrackingConfiguration(x) to_value_wrapper(x, AROrientationTrackingConfiguration)
#define is_value_AROrientationTrackingConfiguration(x) is_value_wrapper(x, AROrientationTrackingConfiguration)

JS_WRAP_CLASS(AROrientationTrackingConfiguration, ARConfiguration);
  JS_STATIC_PROP_READONLY(isSupported);
  JS_STATIC_PROP_READONLY(supportedVideoFormats);
  JS_PROP(isAutoFocusEnabled);
JS_WRAP_CLASS_END(AROrientationTrackingConfiguration);

#endif /* NAROrientationTrackingConfiguration_h */
