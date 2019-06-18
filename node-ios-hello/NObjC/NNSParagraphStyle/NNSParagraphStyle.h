//
//  NNSParagraphStyle.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSParagraphStyle_h
#define NNSParagraphStyle_h    

#include "NNSObject.h"

#define js_value_NSParagraphStyle(x) js_value_wrapper(x, NSParagraphStyle)
#define to_value_NSParagraphStyle(x) to_value_wrapper(x, NSParagraphStyle)
#define is_value_NSParagraphStyle(x) is_value_wrapper(x, NSParagraphStyle)

#define js_value_NSTextTabOptionKey(x) JS_ENUM(NSTextTabOptionKey, NSString, x)
#define to_value_NSTextTabOptionKey(x) TO_ENUM(NSTextTabOptionKey, NSString, x)
#define is_value_NSTextTabOptionKey(x) IS_ENUM(NSTextTabOptionKey, NSString, x)

#define js_value_NSLineBreakMode(x) JS_ENUM(NSLineBreakMode, NSInteger, x)
#define to_value_NSLineBreakMode(x) TO_ENUM(NSLineBreakMode, NSInteger, x)
#define is_value_NSLineBreakMode(x) IS_ENUM(NSLineBreakMode, NSInteger, x)

JS_WRAP_CLASS(NSParagraphStyle, NSObject);
  JS_PROP(lineSpacing);
JS_WRAP_CLASS_END(NSParagraphStyle);

#endif /* NNSParagraphStyle_h */
