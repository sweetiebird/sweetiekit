//
//  NUINib.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINib_h
#define NUINib_h

#include "NNSObject.h"

#define js_value_UINib(x) js_value_wrapper(x, UINib)
#define to_value_UINib(x) to_value_wrapper(x, UINib)
#define is_value_UINib(x) is_value_wrapper(x, UINib)

JS_WRAP_CLASS(UINib, NSObject);
  JS_STATIC_METHOD(nibWithNibNameBundle);
  JS_STATIC_METHOD(nibWithDataBundle);
  JS_METHOD(instantiateWithOwnerOptions);
JS_WRAP_CLASS_END(UINib);

#endif /* NUINib_h */
