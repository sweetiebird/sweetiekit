//
//  NSCNGeometry.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNGeometry_h
#define NSCNGeometry_h    

#include "NNSObject.h"

#define js_value_SCNGeometry(x) js_value_wrapper(x, SCNGeometry)
#define to_value_SCNGeometry(x) to_value_wrapper(x, SCNGeometry)
#define is_value_SCNGeometry(x) is_value_wrapper(x, SCNGeometry)

JS_WRAP_CLASS(SCNGeometry, NSObject);
  JS_PROP(name);
  JS_PROP(materials);
  JS_PROP(firstMaterial);
  JS_PROP(geometrySources);
  JS_PROP(geometryElements);
  JS_PROP(geometryElementCount);
  JS_PROP(levelsOfDetail);
  JS_PROP(tessellator);
  JS_PROP(subdivisionLevel);
  JS_PROP(wantsAdaptiveSubdivision);
  JS_PROP(edgeCreasesElement);
  JS_PROP(edgeCreasesSource);
JS_WRAP_CLASS_END(SCNGeometry);

#endif /* NSCNGeometry_h */
