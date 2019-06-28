//
//  NARFaceTrackingConfiguration.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARFaceTrackingConfiguration_h
#define NARFaceTrackingConfiguration_h    

#include "NARConfiguration.h"

#define js_value_ARFaceTrackingConfiguration(x) js_value_wrapper(x, ARFaceTrackingConfiguration)
#define to_value_ARFaceTrackingConfiguration(x) to_value_wrapper(x, ARFaceTrackingConfiguration)
#define is_value_ARFaceTrackingConfiguration(x) is_value_wrapper(x, ARFaceTrackingConfiguration)

JS_WRAP_CLASS(ARFaceTrackingConfiguration, ARConfiguration);
  // TODO: declare ARFaceTrackingConfiguration methods and properties
JS_WRAP_CLASS_END(ARFaceTrackingConfiguration);

#endif /* NARFaceTrackingConfiguration_h */