//
//  NVNTextObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNTextObservation_h
#define NVNTextObservation_h    

#include "NVNRectangleObservation.h"

#define js_value_VNTextObservation(x) js_value_wrapper(x, VNTextObservation)
#define to_value_VNTextObservation(x) to_value_wrapper(x, VNTextObservation)
#define is_value_VNTextObservation(x) is_value_wrapper(x, VNTextObservation)

JS_WRAP_CLASS(VNTextObservation, VNRectangleObservation);
  JS_PROP_READONLY(characterBoxes);
JS_WRAP_CLASS_END(VNTextObservation);

#endif /* NVNTextObservation_h */
