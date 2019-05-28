//
//  NSCNPlane.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPlane_h
#define NSCNPlane_h    

#include "NSCNGeometry.h"

#define js_value_SCNPlane(x) js_value_wrapper(x, SCNPlane)
#define to_value_SCNPlane(x) to_value_wrapper(x, SCNPlane)

JS_WRAP_CLASS(SCNPlane, SCNGeometry);
  JS_METHOD(planeWithWidthHeight);
  JS_PROP(width);
  JS_PROP(height);
  JS_PROP(widthSegmentCount);
  JS_PROP(heightSegmentCount);
  JS_PROP(cornerRadius);
  JS_PROP(cornerSegmentCount);
JS_WRAP_CLASS_END(SCNPlane);

#endif /* NSCNPlane_h */
