//
//  NVNDetectedObjectObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNDetectedObjectObservation_h
#define NVNDetectedObjectObservation_h    

#include "NVNObservation.h"

#define js_value_VNDetectedObjectObservation(x) js_value_wrapper(x, VNDetectedObjectObservation)
#define to_value_VNDetectedObjectObservation(x) to_value_wrapper(x, VNDetectedObjectObservation)
#define is_value_VNDetectedObjectObservation(x) is_value_wrapper(x, VNDetectedObjectObservation)

JS_WRAP_CLASS(VNDetectedObjectObservation, VNObservation);
  JS_STATIC_METHOD(observationWithBoundingBox);
  JS_STATIC_METHOD(observationWithRequestRevisionBoundingBox);
  JS_PROP_READONLY(boundingBox);
JS_WRAP_CLASS_END(VNDetectedObjectObservation);

#endif /* NVNDetectedObjectObservation_h */
