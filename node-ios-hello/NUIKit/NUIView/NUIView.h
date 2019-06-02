//
//  NUIView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIView_h
#define NUIView_h

#include "NUIResponder.h"

#define js_value_UIView(x) js_value_wrapper(x, UIView)
#define to_value_UIView(x) to_value_wrapper(x, UIView)
#define is_value_UIView(x) is_value_wrapper(x, UIView)

JS_WRAP_CLASS(UIView, UIResponder);
  CGRect GetFrame();
  CGRect GetBounds();
  JS_METHOD(AddSubview);
  JS_PROP(Frame);
  JS_PROP(Bounds);
  JS_PROP(Origin);
  JS_PROP(Center);
  JS_PROP(Size);
  JS_PROP(X);
  JS_PROP(Y);
  JS_PROP(Width);
  JS_PROP(Height);
  JS_PROP(AutoresizesSubviews);
  JS_PROP(Subviews);
  JS_METHOD(SizeThatFits);
  JS_METHOD(SizeToFit);
  JS_PROP(BackgroundColor);
  JS_METHOD(ViewWithStringTag);
  JS_METHOD(RemoveFromSuperview);
  JS_METHOD(bringSubviewToFront);
  JS_METHOD(addGestureRecognizer);
  JS_PROP(Layer);
  JS_PROP(TranslatesAutoresizingMaskIntoConstraints);
  JS_PROP(LeadingAnchor);
  JS_PROP(TrailingAnchor);
  JS_PROP(TopAnchor);
  JS_PROP(BottomAnchor);
  JS_PROP(CenterXAnchor);
  JS_PROP(centerYAnchor);
  JS_PROP(WidthAnchor);
  JS_PROP(heightAnchor);
  JS_PROP(UserInteractionEnabled);
  JS_PROP(alpha);
  JS_PROP(viewDidAppear);
  JS_PROP(viewWillAppear);
  JS_PROP(viewDidDisappear);
  JS_PROP(viewWillDisappear);
  JS_PROP(drawRect);
  JS_PROP(contentMode);
  JS_PROP(transform);
private:
  static CGSize tmp_Size;
JS_WRAP_CLASS_END(UIView);

#endif /* NUIView_h */
