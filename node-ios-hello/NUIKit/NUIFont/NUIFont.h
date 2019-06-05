//
//  NUIFont.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFont_h
#define NUIFont_h    

#include "NNSObject.h"

#define js_value_UIFont(x) js_value_wrapper(x, UIFont)
#define to_value_UIFont(x) to_value_wrapper(x, UIFont)
#define is_value_UIFont(x) is_value_wrapper(x, UIFont)

// UIKit constants

#define js_value_UIFontTextStyle js_value_NSString
#define to_value_UIFontTextStyle to_value_NSString
#define is_value_UIFontTextStyle is_value_NSString

JS_WRAP_CLASS(UIFont, NSObject);
  JS_METHOD(fontWithSize);
  JS_PROP_READONLY(familyName);
  JS_PROP_READONLY(fontName);
  JS_PROP_READONLY(pointSize);
  JS_PROP_READONLY(ascender);
  JS_PROP_READONLY(descender);
  JS_PROP_READONLY(capHeight);
  JS_PROP_READONLY(xHeight);
  JS_PROP_READONLY(lineHeight);
  JS_PROP_READONLY(leading);
  JS_PROP_READONLY(fontDescriptor);
  // static properties
  JS_PROP_READONLY(familyNames);
  // static methods
  JS_METHOD(systemFont);
  JS_METHOD(boldSystemFont);
  JS_METHOD(italicSystemFont);
  JS_METHOD(preferredFontForTextStyle);
  JS_METHOD(preferredFontForTextStyleCompatibleWithTraitCollection);
  JS_METHOD(fontWithNameSize);
  JS_METHOD(fontNamesForFamilyName);
  JS_METHOD(systemFontOfSize);
  JS_METHOD(boldSystemFontOfSize);
  JS_METHOD(italicSystemFontOfSize);
  JS_METHOD(systemFontOfSizeWeight);
  JS_METHOD(monospacedDigitSystemFontOfSizeWeight);
  JS_METHOD(fontWithDescriptorSize);

JS_WRAP_CLASS_END(UIFont);

#endif /* NUIFont_h */
