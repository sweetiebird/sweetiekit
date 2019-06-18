//
//  NUILabel.h
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUILabel_h
#define NUILabel_h

#include "NUIView.h"

#define js_value_UILabel(x) js_value_wrapper(x, UILabel)
#define to_value_UILabel(x) to_value_wrapper(x, UILabel)
#define is_value_UILabel(x) is_value_wrapper(x, UILabel)

#define js_value_NSTextAlignment(x) JS_ENUM(NSTextAlignment, NSInteger, x)
#define to_value_NSTextAlignment(x) TO_ENUM(NSTextAlignment, NSInteger, x)
#define is_value_NSTextAlignment(x) IS_ENUM(NSTextAlignment, NSInteger, x)

#define js_value_NSWritingDirection(x) JS_ENUM(NSWritingDirection, NSInteger, x)
#define to_value_NSWritingDirection(x) TO_ENUM(NSWritingDirection, NSInteger, x)
#define is_value_NSWritingDirection(x) IS_ENUM(NSWritingDirection, NSInteger, x)

JS_WRAP_CLASS(UILabel, UIView);
  JS_METHOD(Alloc);
  JS_PROP(Text);
  JS_METHOD(initWithXYWidthHeight);
  JS_PROP(NumberOfLines);
  JS_PROP(Font);
  JS_PROP(TextColor);
  JS_PROP(HighlightedTextColor);
  JS_PROP(IsHighlighted);
  JS_PROP(textAlignment);
  JS_PROP(attributedText);
JS_WRAP_CLASS_END(UILabel);

#endif /* NUILabel_h */
