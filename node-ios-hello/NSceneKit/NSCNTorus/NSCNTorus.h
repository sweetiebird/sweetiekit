//
//  NSCNTorus.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNTorus_h
#define NSCNTorus_h    

#include "NSCNGeometry.h"

#define js_value_SCNTorus(x) js_value_wrapper(x, SCNTorus)
#define to_value_SCNTorus(x) to_value_wrapper(x, SCNTorus)

JS_WRAP_CLASS(SCNTorus, SCNGeometry);
JS_WRAP_CLASS_END(SCNTorus);

#endif /* NSCNTorus_h */
