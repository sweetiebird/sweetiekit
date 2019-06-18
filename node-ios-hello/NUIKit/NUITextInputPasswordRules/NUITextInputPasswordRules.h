//
//  NUITextInputPasswordRules.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextInputPasswordRules_h
#define NUITextInputPasswordRules_h    

#include "NNSObject.h"

#define js_value_UITextInputPasswordRules(x) js_value_wrapper(x, UITextInputPasswordRules)
#define to_value_UITextInputPasswordRules(x) to_value_wrapper(x, UITextInputPasswordRules)
#define is_value_UITextInputPasswordRules(x) is_value_wrapper(x, UITextInputPasswordRules)

JS_WRAP_CLASS(UITextInputPasswordRules, NSObject);
  JS_STATIC_METHOD(passwordRulesWithDescriptor);
  JS_PROP_READONLY(passwordRulesDescriptor);
JS_WRAP_CLASS_END(UITextInputPasswordRules);

#endif /* NUITextInputPasswordRules_h */
