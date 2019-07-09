//
//  NVNClassificationObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNClassificationObservation_h
#define NVNClassificationObservation_h    

#include "NVNObservation.h"

#define js_value_VNClassificationObservation(x) js_value_wrapper(x, VNClassificationObservation)
#define to_value_VNClassificationObservation(x) to_value_wrapper(x, VNClassificationObservation)
#define is_value_VNClassificationObservation(x) is_value_wrapper(x, VNClassificationObservation)

JS_WRAP_CLASS(VNClassificationObservation, VNObservation);
  JS_METHOD(hasMinimumRecallForPrecision);
  JS_METHOD(hasMinimumPrecisionForRecall);
  JS_PROP_READONLY(identifier);
  JS_PROP_READONLY(hasPrecisionRecallCurve);
JS_WRAP_CLASS_END(VNClassificationObservation);

#endif /* NVNClassificationObservation_h */
