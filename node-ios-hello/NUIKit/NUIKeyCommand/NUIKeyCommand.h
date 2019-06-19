//
//  NUIKeyCommand.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIKeyCommand_h
#define NUIKeyCommand_h    

#include "NNSObject.h"

#define js_value_UIKeyCommand(x) js_value_wrapper(x, UIKeyCommand)
#define to_value_UIKeyCommand(x) to_value_wrapper(x, UIKeyCommand)
#define is_value_UIKeyCommand(x) is_value_wrapper(x, UIKeyCommand)
  
#define js_value_UIKeyModifierFlags(x) JS_ENUM(UIKeyModifierFlags, NSInteger, x)
#define to_value_UIKeyModifierFlags(x) TO_ENUM(UIKeyModifierFlags, NSInteger, x)
#define is_value_UIKeyModifierFlags(x) IS_ENUM(UIKeyModifierFlags, NSInteger, x)

JS_WRAP_CLASS(UIKeyCommand, NSObject);
  JS_STATIC_METHOD(keyCommandWithInputModifierFlagsAction);
  JS_STATIC_METHOD(keyCommandWithInputModifierFlagsActionDiscoverabilityTitle);
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithCoder);
  JS_PROP_READONLY(input);
  JS_PROP_READONLY(modifierFlags);
  JS_PROP(discoverabilityTitle);
JS_WRAP_CLASS_END(UIKeyCommand);

#endif /* NUIKeyCommand_h */
