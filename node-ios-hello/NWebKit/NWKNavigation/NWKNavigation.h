//
//  NWKNavigation.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NWKNavigation_h
#define NWKNavigation_h    

#include "NNSObject.h"

#define js_value_WKNavigation(x) js_value_wrapper(x, WKNavigation)
#define to_value_WKNavigation(x) to_value_wrapper(x, WKNavigation)
#define is_value_WKNavigation(x) is_value_wrapper(x, WKNavigation)

JS_WRAP_CLASS(WKNavigation, NSObject);
JS_WRAP_CLASS_END(WKNavigation);

#endif /* NWKNavigation_h */