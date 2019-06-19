//
//  NCLVisit.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLVisit_h
#define NCLVisit_h    

#include "NNSObject.h"

#define js_value_CLVisit(x) js_value_wrapper(x, CLVisit)
#define to_value_CLVisit(x) to_value_wrapper(x, CLVisit)
#define is_value_CLVisit(x) is_value_wrapper(x, CLVisit)

JS_WRAP_CLASS(CLVisit, NSObject);
  JS_PROP_READONLY(arrivalDate);
  JS_PROP_READONLY(departureDate);
  JS_PROP_READONLY(coordinate);
  JS_PROP_READONLY(horizontalAccuracy);
JS_WRAP_CLASS_END(CLVisit);

#endif /* NCLVisit_h */
