//
//  NSCNBox.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNBox_h
#define NSCNBox_h    

#include "NSCNGeometry.h"

#define js_value_SCNBox(x) js_value_wrapper(x, SCNBox)
#define to_value_SCNBox(x) to_value_wrapper(x, SCNBox)

JS_WRAP_CLASS(SCNBox, SCNGeometry);
JS_WRAP_CLASS_END(SCNBox);

#endif /* NSCNBox_h */
