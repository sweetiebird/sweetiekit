//
//  NSCNPyramid.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPyramid_h
#define NSCNPyramid_h    

#include "NSCNGeometry.h"

#define js_value_SCNPyramid(x) js_value_wrapper(x, SCNPyramid)
#define to_value_SCNPyramid(x) to_value_wrapper(x, SCNPyramid)

JS_WRAP_CLASS(SCNPyramid, SCNGeometry);
JS_WRAP_CLASS_END(SCNPyramid);

#endif /* NSCNPyramid_h */
