//
//  NNSAttributedString.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSAttributedString_h
#define NNSAttributedString_h    

#include "NNSObject.h"

#define js_value_NSAttributedString(x) js_value_wrapper(x, NSAttributedString)
#define to_value_NSAttributedString(x) to_value_wrapper(x, NSAttributedString)
#define is_value_NSAttributedString(x) is_value_wrapper(x, NSAttributedString)

// Foundation enums
#define js_value_NSAttributedStringEnumerationOptions(x) js_opts_wrapper(x, NSAttributedStringEnumerationOptions)
#define to_value_NSAttributedStringEnumerationOptions(x) to_opts_wrapper(x, NSAttributedStringEnumerationOptions)
#define is_value_NSAttributedStringEnumerationOptions(x) is_opts_wrapper(x, NSAttributedStringEnumerationOptions)

JS_WRAP_CLASS(NSAttributedString, NSObject);
  JS_METHOD(attributesAtIndexEffectiveRange);
  JS_METHOD(attributeAtIndexEffectiveRange);
  JS_METHOD(attributedSubstringFromRange);
  JS_METHOD(attributesAtIndexLongestEffectiveRangeInRange);
  JS_METHOD(attributeAtIndexLongestEffectiveRangeInRange);
  JS_METHOD(isEqualToAttributedString);
  JS_METHOD(initWithString);
  JS_METHOD(initWithStringAttributes);
  JS_METHOD(initWithAttributedString);
  JS_METHOD(enumerateAttributesInRangeOptionsUsingBlock);
  JS_METHOD(enumerateAttributeInRangeOptionsUsingBlock);
  JS_PROP_READONLY(string);
  JS_PROP_READONLY(length);
JS_WRAP_CLASS_END(NSAttributedString);

#endif /* NNSAttributedString_h */
