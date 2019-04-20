//
//  NUIView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIView_h
#define NUIView_h

#import <UIKit/UIKit.h>

#include "defines.h"
#include "NUIResponder.h"

using namespace v8;
using namespace node;

JS_WRAP_CLASS(UIView, UIResponder);
  CGRect GetFrame();
  static NAN_METHOD(AddSubview);
  static NAN_GETTER(FrameGetter);
  static NAN_SETTER(FrameSetter);
  static NAN_GETTER(OriginGetter);
  static NAN_SETTER(OriginSetter);
  static NAN_GETTER(CenterGetter);
  static NAN_SETTER(CenterSetter);
  static NAN_GETTER(SizeGetter);
  static NAN_SETTER(SizeSetter);
  static NAN_GETTER(XGetter);
  static NAN_SETTER(XSetter);
  static NAN_GETTER(YGetter);
  static NAN_SETTER(YSetter);
  static NAN_GETTER(WidthGetter);
  static NAN_SETTER(WidthSetter);
  static NAN_GETTER(HeightGetter);
  static NAN_SETTER(HeightSetter);
  static NAN_GETTER(AutoresizesSubviewsGetter);
  static NAN_SETTER(AutoresizesSubviewsSetter);
  static NAN_GETTER(SubviewsGetter);
  static NAN_METHOD(SizeThatFits);
  static NAN_METHOD(SizeToFit);
  static NAN_GETTER(BackgroundColorGetter);
  static NAN_SETTER(BackgroundColorSetter);
  static NAN_METHOD(ViewWithStringTag);
private:
  static CGSize tmp_Size;
JS_WRAP_CLASS_END(UIView);

#endif /* NUIView_h */
