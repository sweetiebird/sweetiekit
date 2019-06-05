//
//  NCLPlacemark.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLPlacemark_h
#define NCLPlacemark_h    

#include "NNSObject.h"

#define js_value_CLPlacemark(x) js_value_wrapper(x, CLPlacemark)
#define to_value_CLPlacemark(x) to_value_wrapper(x, CLPlacemark)
#define is_value_CLPlacemark(x) is_value_wrapper(x, CLPlacemark)

JS_WRAP_CLASS(CLPlacemark, NSObject);
  JS_PROP(location);
JS_WRAP_CLASS_END(CLPlacemark);

#endif /* NCLPlacemark_h */
