//
//  NVNImageAlignmentObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNImageAlignmentObservation_h
#define NVNImageAlignmentObservation_h    

#include "NVNObservation.h"

#define js_value_VNImageAlignmentObservation(x) js_value_wrapper(x, VNImageAlignmentObservation)
#define to_value_VNImageAlignmentObservation(x) to_value_wrapper(x, VNImageAlignmentObservation)
#define is_value_VNImageAlignmentObservation(x) is_value_wrapper(x, VNImageAlignmentObservation)

JS_WRAP_CLASS(VNImageAlignmentObservation, VNObservation);
  // TODO: declare VNImageAlignmentObservation methods and properties
JS_WRAP_CLASS_END(VNImageAlignmentObservation);

#endif /* NVNImageAlignmentObservation_h */