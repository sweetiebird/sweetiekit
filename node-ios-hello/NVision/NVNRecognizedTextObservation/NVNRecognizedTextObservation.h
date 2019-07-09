//
//  NVNRecognizedTextObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNRecognizedTextObservation_h
#define NVNRecognizedTextObservation_h    

#include "NVNRectangleObservation.h"

#define js_value_VNRecognizedTextObservation(x) js_value_wrapper(x, VNRecognizedTextObservation)
#define to_value_VNRecognizedTextObservation(x) to_value_wrapper(x, VNRecognizedTextObservation)
#define is_value_VNRecognizedTextObservation(x) is_value_wrapper(x, VNRecognizedTextObservation)

JS_WRAP_CLASS(VNRecognizedTextObservation, VNRectangleObservation);
  JS_METHOD(topCandidates);
JS_WRAP_CLASS_END(VNRecognizedTextObservation);

#endif /* NVNRecognizedTextObservation_h */
