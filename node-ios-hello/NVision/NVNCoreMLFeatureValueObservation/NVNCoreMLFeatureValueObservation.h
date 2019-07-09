//
//  NVNCoreMLFeatureValueObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNCoreMLFeatureValueObservation_h
#define NVNCoreMLFeatureValueObservation_h    

#include "NVNObservation.h"

#define js_value_VNCoreMLFeatureValueObservation(x) js_value_wrapper(x, VNCoreMLFeatureValueObservation)
#define to_value_VNCoreMLFeatureValueObservation(x) to_value_wrapper(x, VNCoreMLFeatureValueObservation)
#define is_value_VNCoreMLFeatureValueObservation(x) is_value_wrapper(x, VNCoreMLFeatureValueObservation)

JS_WRAP_CLASS(VNCoreMLFeatureValueObservation, VNObservation);
  JS_PROP_READONLY(featureValue);
  JS_PROP_READONLY(featureName);
JS_WRAP_CLASS_END(VNCoreMLFeatureValueObservation);

#endif /* NVNCoreMLFeatureValueObservation_h */
