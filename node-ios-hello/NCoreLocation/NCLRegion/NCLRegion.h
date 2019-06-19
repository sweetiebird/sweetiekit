//
//  NCLRegion.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLRegion_h
#define NCLRegion_h    

#include "NNSObject.h"

#define js_value_CLRegion(x) js_value_wrapper(x, CLRegion)
#define to_value_CLRegion(x) to_value_wrapper(x, CLRegion)
#define is_value_CLRegion(x) is_value_wrapper(x, CLRegion)

#define js_value_CLRegionState(x) JS_ENUM(CLRegionState, NSInteger, x)
#define to_value_CLRegionState(x) TO_ENUM(CLRegionState, NSInteger, x)
#define is_value_CLRegionState(x) IS_ENUM(CLRegionState, NSInteger, x)

#define js_value_CLProximity(x) JS_ENUM(CLProximity, NSInteger, x)
#define to_value_CLProximity(x) TO_ENUM(CLProximity, NSInteger, x)
#define is_value_CLProximity(x) IS_ENUM(CLProximity, NSInteger, x)

JS_WRAP_CLASS(CLRegion, NSObject);
  JS_STATIC_METHOD(initCircularRegionWithCenterRadiusIdentifier);
  JS_METHOD(containsCoordinate);
  JS_PROP_READONLY(center);
  JS_PROP_READONLY(radius);
  JS_PROP_READONLY(identifier);
  JS_PROP(notifyOnEntry);
  JS_PROP(notifyOnExit);
JS_WRAP_CLASS_END(CLRegion);

#endif /* NCLRegion_h */
