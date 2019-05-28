//
//  NSCNFloor.h
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNFloor_h
#define NSCNFloor_h    

#include "NSCNGeometry.h"

#define js_value_SCNFloor(x) js_value_wrapper(x, SCNFloor)
#define to_value_SCNFloor(x) to_value_wrapper(x, SCNFloor)

JS_WRAP_CLASS(SCNFloor, SCNGeometry);
  JS_PROP(reflectivity);
  JS_PROP(reflectionFalloffStart);
  JS_PROP(reflectionFalloffEnd);
  JS_PROP(reflectionCategoryBitMask);
  JS_PROP(width);
  JS_PROP(length);
  JS_PROP(reflectionResolutionScaleFactor);
JS_WRAP_CLASS_END(SCNFloor);

#endif /* NSCNFloor_h */
