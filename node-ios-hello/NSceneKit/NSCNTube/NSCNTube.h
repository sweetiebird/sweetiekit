//
//  NSCNTube.h
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNTube_h
#define NSCNTube_h    

#include "NSCNGeometry.h"

#define js_value_SCNTube(x) js_value_wrapper(x, SCNTube)
#define to_value_SCNTube(x) to_value_wrapper(x, SCNTube)
#define is_value_SCNTube(x) is_value_wrapper(x, SCNTube)

JS_WRAP_CLASS(SCNTube, SCNGeometry);
  JS_METHOD(tubeWithInnerRadiusOuterRadiusHeight);
  JS_PROP(innerRadius);
  JS_PROP(outerRadius);
  JS_PROP(height);
  JS_PROP(radialSegmentCount);
  JS_PROP(heightSegmentCount);
JS_WRAP_CLASS_END(SCNTube);

#endif /* NSCNTube_h */
