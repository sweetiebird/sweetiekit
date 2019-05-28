//
//  NSCNSphere.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNSphere_h
#define NSCNSphere_h    

#include "NSCNGeometry.h"

#define js_value_SCNSphere(x) js_value_wrapper(x, SCNSphere)
#define to_value_SCNSphere(x) to_value_wrapper(x, SCNSphere)

JS_WRAP_CLASS(SCNSphere, SCNGeometry);
  JS_PROP(radius);
  JS_PROP(geodesic);
  JS_PROP(segmentCount);
JS_WRAP_CLASS_END(SCNSphere);

#endif /* NSCNSphere_h */
