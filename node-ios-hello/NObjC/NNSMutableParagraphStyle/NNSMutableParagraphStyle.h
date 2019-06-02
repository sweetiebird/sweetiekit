//
//  NNSMutableParagraphStyle.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMutableParagraphStyle_h
#define NNSMutableParagraphStyle_h    

#include "NNSParagraphStyle.h"

#define js_value_NSMutableParagraphStyle(x) js_value_wrapper(x, NSMutableParagraphStyle)
#define to_value_NSMutableParagraphStyle(x) to_value_wrapper(x, NSMutableParagraphStyle)
#define is_value_NSMutableParagraphStyle(x) is_value_wrapper(x, NSMutableParagraphStyle)

JS_WRAP_CLASS(NSMutableParagraphStyle, NSParagraphStyle);
  JS_PROP(lineSpacing);
JS_WRAP_CLASS_END(NSMutableParagraphStyle);

#endif /* NNSMutableParagraphStyle_h */
