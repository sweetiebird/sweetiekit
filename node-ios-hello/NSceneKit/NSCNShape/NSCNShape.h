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

JS_WRAP_CLASS(SCNShape, SCNGeometry);
JS_WRAP_CLASS_END(SCNShape);

#endif /* NSCNShape_h */
