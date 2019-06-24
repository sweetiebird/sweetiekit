//
//  NMKUserLocation.h
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKUserLocation_h
#define NMKUserLocation_h    

#include "NNSObject.h"

#define js_value_MKUserLocation(x) js_value_wrapper(x, MKUserLocation)
#define to_value_MKUserLocation(x) to_value_wrapper(x, MKUserLocation)
#define is_value_MKUserLocation(x) is_value_wrapper(x, MKUserLocation)

JS_WRAP_CLASS(MKUserLocation, NSObject);
  JS_PROP_READONLY(isUpdating);
  JS_PROP_READONLY(location);
  JS_PROP_READONLY(heading);
  JS_PROP(title);
  JS_PROP(subtitle);
JS_WRAP_CLASS_END(MKUserLocation);

#endif /* NMKUserLocation_h */
