//
//  NVNHorizonObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNHorizonObservation_h
#define NVNHorizonObservation_h    

#include "NVNObservation.h"

#define js_value_VNHorizonObservation(x) js_value_wrapper(x, VNHorizonObservation)
#define to_value_VNHorizonObservation(x) to_value_wrapper(x, VNHorizonObservation)
#define is_value_VNHorizonObservation(x) is_value_wrapper(x, VNHorizonObservation)

JS_WRAP_CLASS(VNHorizonObservation, VNObservation);
  JS_PROP_READONLY(transform);
  JS_PROP_READONLY(angle);
JS_WRAP_CLASS_END(VNHorizonObservation);

#endif /* NVNHorizonObservation_h */
