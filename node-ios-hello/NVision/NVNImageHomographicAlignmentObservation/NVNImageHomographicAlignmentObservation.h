//
//  NVNImageHomographicAlignmentObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNImageHomographicAlignmentObservation_h
#define NVNImageHomographicAlignmentObservation_h    

#include "NVNImageAlignmentObservation.h"

#define js_value_VNImageHomographicAlignmentObservation(x) js_value_wrapper(x, VNImageHomographicAlignmentObservation)
#define to_value_VNImageHomographicAlignmentObservation(x) to_value_wrapper(x, VNImageHomographicAlignmentObservation)
#define is_value_VNImageHomographicAlignmentObservation(x) is_value_wrapper(x, VNImageHomographicAlignmentObservation)

JS_WRAP_CLASS(VNImageHomographicAlignmentObservation, VNImageAlignmentObservation);
  JS_PROP(warpTransform);
JS_WRAP_CLASS_END(VNImageHomographicAlignmentObservation);

#endif /* NVNImageHomographicAlignmentObservation_h */
