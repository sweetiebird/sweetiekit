//
//  NNSCharacterSet.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSCharacterSet_h
#define NNSCharacterSet_h    

#include "NNSObject.h"

#define js_value_NSCharacterSet(x) js_value_wrapper(x, NSCharacterSet)
#define to_value_NSCharacterSet(x) to_value_wrapper(x, NSCharacterSet)
#define is_value_NSCharacterSet(x) is_value_wrapper(x, NSCharacterSet)

#define js_value_unichar(x) js_value_uint16_t(x)
#define to_value_unichar(x) to_value_uint16_t(x)
#define is_value_unichar(x) is_value_uint16_t(x)

#define js_value_UTF32Char(x) js_value_uint32_t(x)
#define to_value_UTF32Char(x) to_value_uint32_t(x)
#define is_value_UTF32Char(x) is_value_uint32_t(x)

JS_WRAP_CLASS(NSCharacterSet, NSObject);
  JS_STATIC_METHOD(characterSetWithRange);
  JS_STATIC_METHOD(characterSetWithCharactersInString);
  JS_STATIC_METHOD(characterSetWithBitmapRepresentation);
  JS_STATIC_METHOD(characterSetWithContentsOfFile);
  JS_STATIC_METHOD(initWithCoder);
  JS_METHOD(characterIsMember);
  JS_METHOD(longCharacterIsMember);
  JS_METHOD(isSupersetOfSet);
  JS_METHOD(hasMemberInPlane);
  JS_STATIC_PROP_READONLY(controlCharacterSet);
  JS_STATIC_PROP_READONLY(whitespaceCharacterSet);
  JS_STATIC_PROP_READONLY(whitespaceAndNewlineCharacterSet);
  JS_STATIC_PROP_READONLY(decimalDigitCharacterSet);
  JS_STATIC_PROP_READONLY(letterCharacterSet);
  JS_STATIC_PROP_READONLY(lowercaseLetterCharacterSet);
  JS_STATIC_PROP_READONLY(uppercaseLetterCharacterSet);
  JS_STATIC_PROP_READONLY(nonBaseCharacterSet);
  JS_STATIC_PROP_READONLY(alphanumericCharacterSet);
  JS_STATIC_PROP_READONLY(decomposableCharacterSet);
  JS_STATIC_PROP_READONLY(illegalCharacterSet);
  JS_STATIC_PROP_READONLY(punctuationCharacterSet);
  JS_STATIC_PROP_READONLY(capitalizedLetterCharacterSet);
  JS_STATIC_PROP_READONLY(symbolCharacterSet);
  JS_STATIC_PROP_READONLY(newlineCharacterSet);
  JS_PROP_READONLY(bitmapRepresentation);
  JS_PROP_READONLY(invertedSet);
JS_WRAP_CLASS_END(NSCharacterSet);

#endif /* NNSCharacterSet_h */
