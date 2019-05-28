//
//  NSCNCylinder.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNCylinder_h
#define NSCNCylinder_h    

#include "NSCNGeometry.h"

#define js_value_SCNCylinder(x) js_value_wrapper(x, SCNCylinder)
#define to_value_SCNCylinder(x) to_value_wrapper(x, SCNCylinder)

JS_WRAP_CLASS(SCNCylinder, SCNGeometry);
JS_WRAP_CLASS_END(SCNCylinder);

#endif /* NSCNCylinder_h */
