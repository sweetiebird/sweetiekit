//
//  NSCNCone.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNCone_h
#define NSCNCone_h    

#include "NSCNGeometry.h"

#define js_value_SCNCone(x) js_value_wrapper(x, SCNCone)
#define to_value_SCNCone(x) to_value_wrapper(x, SCNCone)

JS_WRAP_CLASS(SCNCone, SCNGeometry);
  JS_PROP(topRadius);
  JS_PROP(bottomRadius);
  JS_PROP(height);
  JS_PROP(radialSegmentCount);
  JS_PROP(heightSegmentCount);
JS_WRAP_CLASS_END(SCNCone);

#endif /* NSCNCone_h */
