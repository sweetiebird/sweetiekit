//
//  NVNFaceObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNFaceObservation_h
#define NVNFaceObservation_h    

#include "NVNDetectedObjectObservation.h"

#define js_value_VNFaceObservation(x) js_value_wrapper(x, VNFaceObservation)
#define to_value_VNFaceObservation(x) to_value_wrapper(x, VNFaceObservation)
#define is_value_VNFaceObservation(x) is_value_wrapper(x, VNFaceObservation)

JS_WRAP_CLASS(VNFaceObservation, VNDetectedObjectObservation);
  JS_STATIC_METHOD(faceObservationWithRequestRevisionBoundingBoxRollYaw);
  JS_PROP_READONLY(landmarks);
  JS_PROP_READONLY(faceCaptureQuality);
  JS_PROP_READONLY(roll);
  JS_PROP_READONLY(yaw);
JS_WRAP_CLASS_END(VNFaceObservation);

#endif /* NVNFaceObservation_h */
