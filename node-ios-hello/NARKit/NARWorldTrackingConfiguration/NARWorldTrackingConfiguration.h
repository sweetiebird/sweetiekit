//
//  NARWorldTrackingConfiguration.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARWorldTrackingConfiguration_h
#define NARWorldTrackingConfiguration_h

#include "NARConfiguration.h"

#define js_value_ARWorldTrackingConfiguration(x) js_value_wrapper(x, ARWorldTrackingConfiguration)
#define to_value_ARWorldTrackingConfiguration(x) to_value_wrapper(x, ARWorldTrackingConfiguration)
#define is_value_ARWorldTrackingConfiguration(x) is_value_wrapper(x, ARWorldTrackingConfiguration)

JS_WRAP_CLASS(ARWorldTrackingConfiguration, ARConfiguration);
JS_WRAP_CLASS_END(ARWorldTrackingConfiguration);

#endif /* NARWorldTrackingConfiguration_h */
