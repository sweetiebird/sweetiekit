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

// UIKit constants

#define js_value_UITextBorderStyle(x) JS_ENUM(UITextBorderStyle, NSInteger, x)
#define to_value_UITextBorderStyle(x) TO_ENUM(UITextBorderStyle, NSInteger, x)
#define is_value_UITextBorderStyle(x) IS_ENUM(UITextBorderStyle, NSInteger, x)

#define js_value_UITextFieldViewMode(x) JS_ENUM(UITextFieldViewMode, NSInteger, x)
#define to_value_UITextFieldViewMode(x) TO_ENUM(UITextFieldViewMode, NSInteger, x)
#define is_value_UITextFieldViewMode(x) IS_ENUM(UITextFieldViewMode, NSInteger, x)

#define js_value_UITextFieldDidEndEditingReason(x) JS_ENUM(UITextFieldDidEndEditingReason, NSInteger, x)
#define to_value_UITextFieldDidEndEditingReason(x) TO_ENUM(UITextFieldDidEndEditingReason, NSInteger, x)
#define is_value_UITextFieldDidEndEditingReason(x) IS_ENUM(UITextFieldDidEndEditingReason, NSInteger, x)

// UITextInputTraits.h constants

#define js_value_UITextAutocapitalizationType(x) JS_ENUM(UITextAutocapitalizationType, NSInteger, x)
#define to_value_UITextAutocapitalizationType(x) TO_ENUM(UITextAutocapitalizationType, NSInteger, x)
#define is_value_UITextAutocapitalizationType(x) IS_ENUM(UITextAutocapitalizationType, NSInteger, x)

#define js_value_UITextAutocorrectionType(x) JS_ENUM(UITextAutocorrectionType, NSInteger, x)
#define to_value_UITextAutocorrectionType(x) TO_ENUM(UITextAutocorrectionType, NSInteger, x)
#define is_value_UITextAutocorrectionType(x) IS_ENUM(UITextAutocorrectionType, NSInteger, x)

#define js_value_UITextSpellCheckingType(x) JS_ENUM(UITextSpellCheckingType, NSInteger, x)
#define to_value_UITextSpellCheckingType(x) TO_ENUM(UITextSpellCheckingType, NSInteger, x)
#define is_value_UITextSpellCheckingType(x) IS_ENUM(UITextSpellCheckingType, NSInteger, x)

#define js_value_UITextSmartQuotesType(x) JS_ENUM(UITextSmartQuotesType, NSInteger, x)
#define to_value_UITextSmartQuotesType(x) TO_ENUM(UITextSmartQuotesType, NSInteger, x)
#define is_value_UITextSmartQuotesType(x) IS_ENUM(UITextSmartQuotesType, NSInteger, x)

#define js_value_UITextSmartDashesType(x) JS_ENUM(UITextSmartDashesType, NSInteger, x)
#define to_value_UITextSmartDashesType(x) TO_ENUM(UITextSmartDashesType, NSInteger, x)
#define is_value_UITextSmartDashesType(x) IS_ENUM(UITextSmartDashesType, NSInteger, x)

#define js_value_UITextSmartInsertDeleteType(x) JS_ENUM(UITextSmartInsertDeleteType, NSInteger, x)
#define to_value_UITextSmartInsertDeleteType(x) TO_ENUM(UITextSmartInsertDeleteType, NSInteger, x)
#define is_value_UITextSmartInsertDeleteType(x) IS_ENUM(UITextSmartInsertDeleteType, NSInteger, x)

#define js_value_UIKeyboardType(x) JS_ENUM(UIKeyboardType, NSInteger, x)
#define to_value_UIKeyboardType(x) TO_ENUM(UIKeyboardType, NSInteger, x)
#define is_value_UIKeyboardType(x) IS_ENUM(UIKeyboardType, NSInteger, x)

#define js_value_UIKeyboardAppearance(x) JS_ENUM(UIKeyboardAppearance, NSInteger, x)
#define to_value_UIKeyboardAppearance(x) TO_ENUM(UIKeyboardAppearance, NSInteger, x)
#define is_value_UIKeyboardAppearance(x) IS_ENUM(UIKeyboardAppearance, NSInteger, x)

#define js_value_UIReturnKeyType(x) JS_ENUM(UIReturnKeyType, NSInteger, x)
#define to_value_UIReturnKeyType(x) TO_ENUM(UIReturnKeyType, NSInteger, x)
#define is_value_UIReturnKeyType(x) IS_ENUM(UIReturnKeyType, NSInteger, x)

#define js_value_UITextContentType(x) JS_ENUM(UITextContentType, NSString, x)
#define to_value_UITextContentType(x) TO_ENUM(UITextContentType, NSString, x)
#define is_value_UITextContentType(x) IS_ENUM(UITextContentType, NSString, x)


JS_WRAP_CLASS(UITextField, UIControl);
  JS_STATIC_METHOD(initWithFrameCallback);
  JS_PROP(callback);
  
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
  
  // UITextInputTraits
  JS_PROP(autocapitalizationType);
  JS_PROP(autocorrectionType);
  JS_PROP(spellCheckingType);
  JS_PROP(smartQuotesType);
  JS_PROP(smartDashesType);
  JS_PROP(smartInsertDeleteType);
  JS_PROP(keyboardType);
  JS_PROP(keyboardAppearance);
  JS_PROP(returnKeyType);
  JS_PROP(enablesReturnKeyAutomatically);
  JS_PROP(isSecureTextEntry);
  JS_PROP(textContentType);
  JS_PROP(passwordRules);

  Nan::Persistent<Function>* _callback;
JS_WRAP_CLASS_END(UITextField);

#endif /* NUITextField_h */
