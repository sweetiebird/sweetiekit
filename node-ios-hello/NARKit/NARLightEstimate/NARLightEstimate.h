//
//  NARLightEstimate.h
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARLightEstimate_h
#define NARLightEstimate_h

#include "NNSObject.h"

#ifdef __IPHONEOS__

#define js_value_ARLightEstimate(x) js_value_wrapper(x, ARLightEstimate)
#define to_value_ARLightEstimate(x) to_value_wrapper(x, ARLightEstimate)
#define is_value_ARLightEstimate(x) is_value_wrapper(x, ARLightEstimate)

JS_WRAP_CLASS(ARLightEstimate, NSObject);
  JS_PROP(ambientIntensity);
  JS_PROP(ambientColorTemperature);
JS_WRAP_CLASS_END(ARLightEstimate);

#endif

#endif /* NARLightEstimate_h */
