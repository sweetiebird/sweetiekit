//
//  NMKMapCamera.h
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKMapCamera_h
#define NMKMapCamera_h    

#include "NNSObject.h"

#define js_value_MKMapCamera(x) js_value_wrapper(x, MKMapCamera)
#define to_value_MKMapCamera(x) to_value_wrapper(x, MKMapCamera)
#define is_value_MKMapCamera(x) is_value_wrapper(x, MKMapCamera)

JS_WRAP_CLASS(MKMapCamera, NSObject);
  JS_STATIC_METHOD(camera);
  JS_STATIC_METHOD(cameraLookingAtCenterCoordinateFromEyeCoordinateEyeAltitude);
  JS_STATIC_METHOD(cameraLookingAtCenterCoordinateFromDistancePitchHeading);
  JS_PROP(centerCoordinate);
  JS_PROP(heading);
  JS_PROP(pitch);
  JS_PROP(altitude);
JS_WRAP_CLASS_END(MKMapCamera);

#endif /* NMKMapCamera_h */
