//
//  NUITextRange.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextRange_h
#define NUITextRange_h    

#include "NNSObject.h"

#define js_value_UITextRange(x) js_value_wrapper(x, UITextRange)
#define to_value_UITextRange(x) to_value_wrapper(x, UITextRange)
#define is_value_UITextRange(x) is_value_wrapper(x, UITextRange)

JS_WRAP_CLASS(UITextRange, NSObject);
  JS_PROP_READONLY(isEmpty);
  JS_PROP_READONLY(start);
  JS_PROP_READONLY(end);
JS_WRAP_CLASS_END(UITextRange);

#endif /* NUITextRange_h */
