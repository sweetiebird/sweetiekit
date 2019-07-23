//
//  NVNObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNObservation_h
#define NVNObservation_h    

#include "NNSObject.h"

#define js_value_VNObservation(x) js_value_wrapper(x, VNObservation)
#define to_value_VNObservation(x) to_value_wrapper(x, VNObservation)
#define is_value_VNObservation(x) is_value_wrapper(x, VNObservation)

JS_WRAP_CLASS(VNObservation, NSObject);
  JS_PROP_READONLY(uuid);
  JS_PROP_READONLY(confidence);
JS_WRAP_CLASS_END(VNObservation);

#endif /* NVNObservation_h */
