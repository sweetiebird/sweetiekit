//
//  NARTrackedRaycast.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARTrackedRaycast_h
#define NARTrackedRaycast_h    

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#include "NNSObject.h"

#define js_value_ARTrackedRaycast(x) js_value_wrapper(x, ARTrackedRaycast)
#define to_value_ARTrackedRaycast(x) to_value_wrapper(x, ARTrackedRaycast)
#define is_value_ARTrackedRaycast(x) is_value_wrapper(x, ARTrackedRaycast)

JS_WRAP_CLASS(ARTrackedRaycast, NSObject);
  JS_METHOD(updateQuery);
  JS_METHOD(stopTracking);
JS_WRAP_CLASS_END(ARTrackedRaycast);

#endif

#endif /* NARTrackedRaycast_h */
