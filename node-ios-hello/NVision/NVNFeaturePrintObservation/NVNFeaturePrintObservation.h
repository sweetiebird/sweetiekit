//
//  NVNFeaturePrintObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNFeaturePrintObservation_h
#define NVNFeaturePrintObservation_h    

#include "NVNObservation.h"

#define js_value_VNFeaturePrintObservation(x) js_value_wrapper(x, VNFeaturePrintObservation)
#define to_value_VNFeaturePrintObservation(x) to_value_wrapper(x, VNFeaturePrintObservation)
#define is_value_VNFeaturePrintObservation(x) is_value_wrapper(x, VNFeaturePrintObservation)

JS_WRAP_CLASS(VNFeaturePrintObservation, VNObservation);
  JS_METHOD(computeDistanceToFeaturePrintObservationError);
  JS_PROP_READONLY(elementType);
  JS_PROP_READONLY(elementCount);
  JS_PROP_READONLY(data);
JS_WRAP_CLASS_END(VNFeaturePrintObservation);

#endif /* NVNFeaturePrintObservation_h */
