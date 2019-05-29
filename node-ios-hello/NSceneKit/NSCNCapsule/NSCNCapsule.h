//
//  NSCNCapsule.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNCapsule_h
#define NSCNCapsule_h    

#include "NSCNGeometry.h"

#define js_value_SCNCapsule(x) js_value_wrapper(x, SCNCapsule)
#define to_value_SCNCapsule(x) to_value_wrapper(x, SCNCapsule)

JS_WRAP_CLASS(SCNCapsule, SCNGeometry);
  JS_METHOD(capsuleWithCapRadiusHeight);
  JS_PROP(capRadius);
  JS_PROP(height);
  JS_PROP(radialSegmentCount);
  JS_PROP(heightSegmentCount);
  JS_PROP(capSegmentCount);
JS_WRAP_CLASS_END(SCNCapsule);

#endif /* NSCNCapsule_h */
