//
//  NVNRectangleObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNRectangleObservation_h
#define NVNRectangleObservation_h    

#include "NVNDetectedObjectObservation.h"

#define js_value_VNRectangleObservation(x) js_value_wrapper(x, VNRectangleObservation)
#define to_value_VNRectangleObservation(x) to_value_wrapper(x, VNRectangleObservation)
#define is_value_VNRectangleObservation(x) is_value_wrapper(x, VNRectangleObservation)

JS_WRAP_CLASS(VNRectangleObservation, VNDetectedObjectObservation);
  JS_STATIC_METHOD(rectangleObservationWithRequestRevisionTopLeftBottomLeftBottomRightTopRight);
  JS_PROP_READONLY(topLeft);
  JS_PROP_READONLY(topRight);
  JS_PROP_READONLY(bottomLeft);
  JS_PROP_READONLY(bottomRight);
JS_WRAP_CLASS_END(VNRectangleObservation);

#endif /* NVNRectangleObservation_h */
