//
//  NVNPixelBufferObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNPixelBufferObservation_h
#define NVNPixelBufferObservation_h    

#include "NVNObservation.h"

#define js_value_VNPixelBufferObservation(x) js_value_wrapper(x, VNPixelBufferObservation)
#define to_value_VNPixelBufferObservation(x) to_value_wrapper(x, VNPixelBufferObservation)
#define is_value_VNPixelBufferObservation(x) is_value_wrapper(x, VNPixelBufferObservation)

JS_WRAP_CLASS(VNPixelBufferObservation, VNObservation);
  JS_PROP_READONLY(pixelBuffer);
  JS_PROP_READONLY(featureName);
JS_WRAP_CLASS_END(VNPixelBufferObservation);

#endif /* NVNPixelBufferObservation_h */
