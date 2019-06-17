//
//  NUIButton.h
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIButton_h
#define NUIButton_h    

#include "NUIControl.h"

#define js_value_UIButton(x) js_value_wrapper(x, UIButton)
#define to_value_UIButton(x) to_value_wrapper(x, UIButton)
#define is_value_UIButton(x) is_value_wrapper(x, UIButton)

#define js_value_UIButtonType(x) JS_ENUM(UIButtonType, NSInteger, x)
#define to_value_UIButtonType(x) TO_ENUM(UIButtonType, NSInteger, x)
#define is_value_UIButtonType(x) IS_ENUM(UIButtonType, NSInteger, x)

JS_WRAP_CLASS(UIButton, UIControl);
  JS_STATIC_METHOD(buttonWithType);
  JS_METHOD(setTitleForState);
  JS_METHOD(setTitleColorForState);
  JS_METHOD(setTitleShadowColorForState);
  JS_METHOD(setImageForState);
  JS_METHOD(setBackgroundImageForState);
  JS_METHOD(setAttributedTitleForState);
  JS_METHOD(titleForState);
  JS_METHOD(titleColorForState);
  JS_METHOD(titleShadowColorForState);
  JS_METHOD(imageForState);
  JS_METHOD(backgroundImageForState);
  JS_METHOD(attributedTitleForState);
  JS_METHOD(backgroundRectForBounds);
  JS_METHOD(contentRectForBounds);
  JS_METHOD(titleRectForContentRect);
  JS_METHOD(imageRectForContentRect);
  JS_PROP(contentEdgeInsets);
  JS_PROP(titleEdgeInsets);
  JS_PROP(reversesTitleShadowWhenHighlighted);
  JS_PROP(imageEdgeInsets);
  JS_PROP(adjustsImageWhenHighlighted);
  JS_PROP(adjustsImageWhenDisabled);
  JS_PROP(showsTouchWhenHighlighted);
  JS_PROP(tintColor);
  JS_PROP_READONLY(buttonType);
  JS_PROP_READONLY(currentTitle);
  JS_PROP_READONLY(currentTitleColor);
  JS_PROP_READONLY(currentTitleShadowColor);
  JS_PROP_READONLY(currentImage);
  JS_PROP_READONLY(currentBackgroundImage);
  JS_PROP_READONLY(currentAttributedTitle);
  JS_PROP_READONLY(titleLabel);
  JS_PROP_READONLY(imageView);
  JS_PROP(font);
  JS_PROP(lineBreakMode);
  JS_PROP(titleShadowOffset);

JS_WRAP_CLASS_END(UIButton);

#endif /* NUIButton_h */
