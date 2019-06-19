//
//  NCLFloor.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLFloor_h
#define NCLFloor_h    

#include "NNSObject.h"

#define js_value_CLFloor(x) js_value_wrapper(x, CLFloor)
#define to_value_CLFloor(x) to_value_wrapper(x, CLFloor)
#define is_value_CLFloor(x) is_value_wrapper(x, CLFloor)

JS_WRAP_CLASS(CLFloor, NSObject);
  JS_PROP_READONLY(level);
JS_WRAP_CLASS_END(CLFloor);

#endif /* NCLFloor_h */
