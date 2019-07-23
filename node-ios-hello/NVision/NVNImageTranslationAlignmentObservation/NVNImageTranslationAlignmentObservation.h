//
//  NVNImageTranslationAlignmentObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNImageTranslationAlignmentObservation_h
#define NVNImageTranslationAlignmentObservation_h    

#include "NVNImageAlignmentObservation.h"

#define js_value_VNImageTranslationAlignmentObservation(x) js_value_wrapper(x, VNImageTranslationAlignmentObservation)
#define to_value_VNImageTranslationAlignmentObservation(x) to_value_wrapper(x, VNImageTranslationAlignmentObservation)
#define is_value_VNImageTranslationAlignmentObservation(x) is_value_wrapper(x, VNImageTranslationAlignmentObservation)

JS_WRAP_CLASS(VNImageTranslationAlignmentObservation, VNImageAlignmentObservation);
  JS_PROP(alignmentTransform);
JS_WRAP_CLASS_END(VNImageTranslationAlignmentObservation);

#endif /* NVNImageTranslationAlignmentObservation_h */
