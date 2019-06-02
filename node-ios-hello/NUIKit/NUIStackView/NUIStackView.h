//
//  NUIStackView.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStackView_h
#define NUIStackView_h    

#include "NUIView.h"

#define js_value_UIStackView(x) js_value_wrapper(x, UIStackView)
#define to_value_UIStackView(x) to_value_wrapper(x, UIStackView)
#define is_value_UIStackView(x) is_value_wrapper(x, UIStackView)

JS_WRAP_CLASS(UIStackView, UIView);
  JS_METHOD(addArrangedSubview);
  JS_METHOD(insertArrangedSubview);
  JS_METHOD(removeArrangedSubview);
  JS_PROP(arrangedSubviews);
  JS_PROP(axis);
  JS_PROP(distribution);
  JS_PROP(alignment);
JS_WRAP_CLASS_END(UIStackView);

#endif /* NUIStackView_h */
