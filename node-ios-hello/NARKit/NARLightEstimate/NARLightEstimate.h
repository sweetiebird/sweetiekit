//
//  NARLightEstimate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARLightEstimate_h
#define NARLightEstimate_h

#include "NNSObject.h"

#define js_value_ARLightEstimate(x) js_value_wrapper(x, ARLightEstimate)
#define to_value_ARLightEstimate(x) to_value_wrapper(x, ARLightEstimate)
#define is_value_ARLightEstimate(x) is_value_wrapper(x, ARLightEstimate)

JS_WRAP_CLASS(ARLightEstimate, NSObject);
  JS_PROP(AmbientIntensity);
  JS_PROP(AmbientColorTemperature);
JS_WRAP_CLASS_END(ARLightEstimate);

#endif /* NARLightEstimate_h */
