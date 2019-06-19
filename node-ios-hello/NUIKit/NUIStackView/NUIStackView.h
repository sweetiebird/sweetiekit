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

#define js_value_UIStackViewDistribution(x) JS_ENUM(UIStackViewDistribution, NSInteger, x)
#define to_value_UIStackViewDistribution(x) TO_ENUM(UIStackViewDistribution, NSInteger, x)
#define is_value_UIStackViewDistribution(x) IS_ENUM(UIStackViewDistribution, NSInteger, x)

#define js_value_UIStackViewAlignment(x) JS_ENUM(UIStackViewAlignment, NSInteger, x)
#define to_value_UIStackViewAlignment(x) TO_ENUM(UIStackViewAlignment, NSInteger, x)
#define is_value_UIStackViewAlignment(x) IS_ENUM(UIStackViewAlignment, NSInteger, x)

JS_WRAP_CLASS(UIStackView, UIView);
  JS_METHOD(initWithFrame);
  JS_METHOD(initWithCoder);
  JS_METHOD(initWithArrangedSubviews);
  JS_METHOD(addArrangedSubview);
  JS_METHOD(removeArrangedSubview);
  JS_METHOD(insertArrangedSubviewAtIndex);
  JS_METHOD(setCustomSpacingAfterView);
  JS_METHOD(customSpacingAfterView);
  JS_PROP_READONLY(arrangedSubviews);
  JS_PROP(axis);
  JS_PROP(distribution);
  JS_PROP(alignment);
  JS_PROP(spacing);
  JS_PROP(isBaselineRelativeArrangement);
  JS_PROP(isLayoutMarginsRelativeArrangement);
JS_WRAP_CLASS_END(UIStackView);

#endif /* NUIStackView_h */
