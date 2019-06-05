//
//  NNSLayoutConstraint.h
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLayoutConstraint_h
#define NNSLayoutConstraint_h

#include "NNSObject.h"

#define js_value_NSLayoutConstraint(x) js_value_wrapper(x, NSLayoutConstraint)
#define to_value_NSLayoutConstraint(x) to_value_wrapper(x, NSLayoutConstraint)
#define is_value_NSLayoutConstraint(x) is_value_wrapper(x, NSLayoutConstraint)

// constants
#define js_value_UILayoutPriority(x) js_enum_wrapper(x, UILayoutPriority)
#define to_value_UILayoutPriority(x) to_enum_wrapper(x, UILayoutPriority)
#define is_value_UILayoutPriority(x) is_enum_wrapper(x, UILayoutPriority)

JS_WRAP_CLASS(NSLayoutConstraint, NSObject);
  JS_METHOD(ActivateConstraints);
  JS_METHOD(DeactivateConstraints);
  JS_PROP(IsActive);
  JS_PROP(Priority);
JS_WRAP_CLASS_END(NSLayoutConstraint);

#endif /* NNSLayoutConstraint_h */
