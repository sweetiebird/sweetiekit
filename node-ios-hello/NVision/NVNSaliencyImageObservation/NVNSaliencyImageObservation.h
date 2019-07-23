//
//  NVNSaliencyImageObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNSaliencyImageObservation_h
#define NVNSaliencyImageObservation_h    

#include "NVNPixelBufferObservation.h"

#define js_value_VNSaliencyImageObservation(x) js_value_wrapper(x, VNSaliencyImageObservation)
#define to_value_VNSaliencyImageObservation(x) to_value_wrapper(x, VNSaliencyImageObservation)
#define is_value_VNSaliencyImageObservation(x) is_value_wrapper(x, VNSaliencyImageObservation)

JS_WRAP_CLASS(VNSaliencyImageObservation, VNPixelBufferObservation);
  JS_PROP_READONLY(salientObjects);
JS_WRAP_CLASS_END(VNSaliencyImageObservation);

#endif /* NVNSaliencyImageObservation_h */
