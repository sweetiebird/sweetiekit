//
//  NARObjectScanningConfiguration.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARObjectScanningConfiguration_h
#define NARObjectScanningConfiguration_h    

#include "NARConfiguration.h"

#define js_value_ARObjectScanningConfiguration(x) js_value_wrapper(x, ARObjectScanningConfiguration)
#define to_value_ARObjectScanningConfiguration(x) to_value_wrapper(x, ARObjectScanningConfiguration)
#define is_value_ARObjectScanningConfiguration(x) is_value_wrapper(x, ARObjectScanningConfiguration)

JS_WRAP_CLASS(ARObjectScanningConfiguration, ARConfiguration);
  JS_STATIC_PROP_READONLY(isSupported);
  JS_STATIC_PROP_READONLY(supportedVideoFormats);
  JS_PROP(isAutoFocusEnabled);
  JS_PROP(planeDetection);
JS_WRAP_CLASS_END(ARObjectScanningConfiguration);

#endif /* NARObjectScanningConfiguration_h */
