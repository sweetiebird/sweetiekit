//
//  NARConfiguration.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARConfiguration_h
#define NARConfiguration_h

#include "NNSObject.h"

#define js_value_ARConfiguration(x) js_value_wrapper(x, ARConfiguration)
#define to_value_ARConfiguration(x) to_value_wrapper(x, ARConfiguration)
#define is_value_ARConfiguration(x) is_value_wrapper(x, ARConfiguration)

JS_WRAP_CLASS(ARConfiguration, NSObject);
  JS_PROP(isLightEstimationEnabled);
  JS_PROP(worldAlignment);
JS_WRAP_CLASS_END(ARConfiguration);

#endif /* NARConfiguration_h */
