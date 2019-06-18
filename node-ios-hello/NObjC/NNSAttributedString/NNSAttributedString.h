//
//  NNSAttributedString.h
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

#define js_value_NSAttributedStringKey(x) js_enum_string_wrapper(x, NSAttributedStringKey)
#define to_value_NSAttributedStringKey(x) to_enum_string_wrapper(x, NSAttributedStringKey)
#define is_value_NSAttributedStringKey(x) is_enum_string_wrapper(x, NSAttributedStringKey)

// NSAttributedString constants

#define js_value_NSUnderlineStyle(x) JS_OPTS(NSUnderlineStyle, NSInteger, x)
#define to_value_NSUnderlineStyle(x) TO_OPTS(NSUnderlineStyle, NSInteger, x)
#define is_value_NSUnderlineStyle(x) IS_OPTS(NSUnderlineStyle, NSInteger, x)

#define js_value_NSWritingDirectionFormatType(x) JS_ENUM(NSWritingDirectionFormatType, NSInteger, x)
#define to_value_NSWritingDirectionFormatType(x) TO_ENUM(NSWritingDirectionFormatType, NSInteger, x)
#define is_value_NSWritingDirectionFormatType(x) IS_ENUM(NSWritingDirectionFormatType, NSInteger, x)

#define js_value_NSTextEffectStyle(x) JS_ENUM(NSTextEffectStyle, NSString, x)
#define to_value_NSTextEffectStyle(x) TO_ENUM(NSTextEffectStyle, NSString, x)
#define is_value_NSTextEffectStyle(x) IS_ENUM(NSTextEffectStyle, NSString, x)

#define js_value_NSAttributedStringDocumentType(x) JS_ENUM(NSAttributedStringDocumentType, NSString, x)
#define to_value_NSAttributedStringDocumentType(x) TO_ENUM(NSAttributedStringDocumentType, NSString, x)
#define is_value_NSAttributedStringDocumentType(x) IS_ENUM(NSAttributedStringDocumentType, NSString, x)

#define js_value_NSTextLayoutSectionKey(x) JS_ENUM(NSTextLayoutSectionKey, NSString, x)
#define to_value_NSTextLayoutSectionKey(x) TO_ENUM(NSTextLayoutSectionKey, NSString, x)
#define is_value_NSTextLayoutSectionKey(x) IS_ENUM(NSTextLayoutSectionKey, NSString, x)

#define js_value_NSAttributedStringDocumentAttributeKey(x) JS_ENUM(NSAttributedStringDocumentAttributeKey, NSString, x)
#define to_value_NSAttributedStringDocumentAttributeKey(x) TO_ENUM(NSAttributedStringDocumentAttributeKey, NSString, x)
#define is_value_NSAttributedStringDocumentAttributeKey(x) IS_ENUM(NSAttributedStringDocumentAttributeKey, NSString, x)

#define js_value_NSAttributedStringDocumentReadingOptionKey(x) JS_ENUM(NSAttributedStringDocumentReadingOptionKey, NSString, x)
#define to_value_NSAttributedStringDocumentReadingOptionKey(x) TO_ENUM(NSAttributedStringDocumentReadingOptionKey, NSString, x)
#define is_value_NSAttributedStringDocumentReadingOptionKey(x) IS_ENUM(NSAttributedStringDocumentReadingOptionKey, NSString, x)

#define js_value_NSTextWritingDirection(x) JS_ENUM(NSTextWritingDirection, NSInteger, x)
#define to_value_NSTextWritingDirection(x) TO_ENUM(NSTextWritingDirection, NSInteger, x)
#define is_value_NSTextWritingDirection(x) IS_ENUM(NSTextWritingDirection, NSInteger, x)

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
