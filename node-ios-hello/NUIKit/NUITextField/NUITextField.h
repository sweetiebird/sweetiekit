//
//  NUITextField.h
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextField_h
#define NUITextField_h

#include "NUIControl.h"

#define js_value_UITextField(x) js_value_wrapper(x, UITextField)
#define to_value_UITextField(x) to_value_wrapper(x, UITextField)
#define is_value_UITextField(x) is_value_wrapper(x, UITextField)

#define js_value_NSTextAlignment(x) JS_ENUM(NSTextAlignment, NSInteger, x)
#define to_value_NSTextAlignment(x) TO_ENUM(NSTextAlignment, NSInteger, x)
#define is_value_NSTextAlignment(x) IS_ENUM(NSTextAlignment, NSInteger, x)

#define js_value_UITextBorderStyle(x) JS_ENUM(UITextBorderStyle, NSInteger, x)
#define to_value_UITextBorderStyle(x) TO_ENUM(UITextBorderStyle, NSInteger, x)
#define is_value_UITextBorderStyle(x) IS_ENUM(UITextBorderStyle, NSInteger, x)

#define js_value_UITextFieldViewMode(x) JS_ENUM(UITextFieldViewMode, NSInteger, x)
#define to_value_UITextFieldViewMode(x) TO_ENUM(UITextFieldViewMode, NSInteger, x)
#define is_value_UITextFieldViewMode(x) IS_ENUM(UITextFieldViewMode, NSInteger, x)

#define js_value_UITextFieldDidEndEditingReason(x) JS_ENUM(UITextFieldDidEndEditingReason, NSInteger, x)
#define to_value_UITextFieldDidEndEditingReason(x) TO_ENUM(UITextFieldDidEndEditingReason, NSInteger, x)
#define is_value_UITextFieldDidEndEditingReason(x) IS_ENUM(UITextFieldDidEndEditingReason, NSInteger, x)


JS_WRAP_CLASS(UITextField, UIControl);
  JS_STATIC_METHOD(initWithFrameCallback);
  JS_PROP(callback);
  JS_PROP(autocorrectionType);
  
  JS_METHOD(borderRectForBounds);
  JS_METHOD(textRectForBounds);
  JS_METHOD(placeholderRectForBounds);
  JS_METHOD(editingRectForBounds);
  JS_METHOD(clearButtonRectForBounds);
  JS_METHOD(leftViewRectForBounds);
  JS_METHOD(rightViewRectForBounds);
  JS_METHOD(drawTextInRect);
  JS_METHOD(drawPlaceholderInRect);
  
  JS_PROP(text);
  JS_PROP(attributedText);
  JS_PROP(textColor);
  JS_PROP(font);
  JS_PROP(textAlignment);
  JS_PROP(borderStyle);
  JS_PROP(defaultTextAttributes);
  JS_PROP(placeholder);
  JS_PROP(attributedPlaceholder);
  JS_PROP(clearsOnBeginEditing);
  JS_PROP(adjustsFontSizeToFitWidth);
  JS_PROP(minimumFontSize);
  JS_PROP(delegate);
  JS_PROP(background);
  JS_PROP(disabledBackground);
  JS_PROP_READONLY(isEditing);
  JS_PROP(allowsEditingTextAttributes);
  JS_PROP(typingAttributes);
  JS_PROP(clearButtonMode);
  JS_PROP(leftView);
  JS_PROP(leftViewMode);
  JS_PROP(rightView);
  JS_PROP(rightViewMode);
  JS_PROP(inputView);
  JS_PROP(inputAccessoryView);
  JS_PROP(clearsOnInsertion);

  Nan::Persistent<Function>* _callback;
JS_WRAP_CLASS_END(UITextField);

#endif /* NUITextField_h */
