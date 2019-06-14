//
//  NUITextInputMode.h
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextInputMode_h
#define NUITextInputMode_h    

#include "NNSObject.h"

#define js_value_UITextInputMode(x) js_value_wrapper(x, UITextInputMode)
#define to_value_UITextInputMode(x) to_value_wrapper(x, UITextInputMode)
#define is_value_UITextInputMode(x) is_value_wrapper(x, UITextInputMode)

JS_WRAP_CLASS(UITextInputMode, NSObject);
  JS_PROP_READONLY(primaryLanguage);
  JS_STATIC_PROP_READONLY(currentInputMode);
  JS_STATIC_PROP_READONLY(activeInputModes);
JS_WRAP_CLASS_END(UITextInputMode);

#endif /* NUITextInputMode_h */
