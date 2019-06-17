//
//  NNSMutableCharacterSet.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMutableCharacterSet_h
#define NNSMutableCharacterSet_h    

#include "NNSCharacterSet.h"

#define js_value_NSMutableCharacterSet(x) js_value_wrapper(x, NSMutableCharacterSet)
#define to_value_NSMutableCharacterSet(x) to_value_wrapper(x, NSMutableCharacterSet)
#define is_value_NSMutableCharacterSet(x) is_value_wrapper(x, NSMutableCharacterSet)

JS_WRAP_CLASS(NSMutableCharacterSet, NSCharacterSet);
  JS_STATIC_METHOD(controlCharacterSet);
  JS_STATIC_METHOD(whitespaceCharacterSet);
  JS_STATIC_METHOD(whitespaceAndNewlineCharacterSet);
  JS_STATIC_METHOD(decimalDigitCharacterSet);
  JS_STATIC_METHOD(letterCharacterSet);
  JS_STATIC_METHOD(lowercaseLetterCharacterSet);
  JS_STATIC_METHOD(uppercaseLetterCharacterSet);
  JS_STATIC_METHOD(nonBaseCharacterSet);
  JS_STATIC_METHOD(alphanumericCharacterSet);
  JS_STATIC_METHOD(decomposableCharacterSet);
  JS_STATIC_METHOD(illegalCharacterSet);
  JS_STATIC_METHOD(punctuationCharacterSet);
  JS_STATIC_METHOD(capitalizedLetterCharacterSet);
  JS_STATIC_METHOD(symbolCharacterSet);
  JS_STATIC_METHOD(newlineCharacterSet);
  JS_STATIC_METHOD(characterSetWithRange);
  JS_STATIC_METHOD(characterSetWithCharactersInString);
  JS_STATIC_METHOD(characterSetWithBitmapRepresentation);
  JS_STATIC_METHOD(characterSetWithContentsOfFile);
  JS_METHOD(addCharactersInRange);
  JS_METHOD(removeCharactersInRange);
  JS_METHOD(addCharactersInString);
  JS_METHOD(removeCharactersInString);
  JS_METHOD(formUnionWithCharacterSet);
  JS_METHOD(formIntersectionWithCharacterSet);
  JS_METHOD(invert);
JS_WRAP_CLASS_END(NSMutableCharacterSet);

#endif /* NNSMutableCharacterSet_h */
