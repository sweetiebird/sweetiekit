//
//  NVNRecognizedObjectObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNRecognizedObjectObservation_h
#define NVNRecognizedObjectObservation_h    

#include "NVNDetectedObjectObservation.h"

#define js_value_VNRecognizedObjectObservation(x) js_value_wrapper(x, VNRecognizedObjectObservation)
#define to_value_VNRecognizedObjectObservation(x) to_value_wrapper(x, VNRecognizedObjectObservation)
#define is_value_VNRecognizedObjectObservation(x) is_value_wrapper(x, VNRecognizedObjectObservation)

JS_WRAP_CLASS(VNRecognizedObjectObservation, VNDetectedObjectObservation);
  JS_PROP_READONLY(labels);
JS_WRAP_CLASS_END(VNRecognizedObjectObservation);

#endif /* NVNRecognizedObjectObservation_h */
