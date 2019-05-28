//
//  NSCNShape.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNShape_h
#define NSCNShape_h    

#include "NSCNGeometry.h"

#define js_value_SCNShape(x) js_value_wrapper(x, SCNShape)
#define to_value_SCNShape(x) to_value_wrapper(x, SCNShape)

#define js_value_SCNChamferMode(x) JS_ENUM(SCNChamferMode, NSInteger, x)
#define to_value_SCNChamferMode(x) TO_ENUM(SCNChamferMode, NSInteger, x)

JS_WRAP_CLASS(SCNShape, SCNGeometry);
  JS_PROP(path);
  JS_PROP(extrusionDepth);
  JS_PROP(chamferMode);
  JS_PROP(chamferRadius);
  JS_PROP(chamferProfile);
JS_WRAP_CLASS_END(SCNShape);

#endif /* NSCNShape_h */
