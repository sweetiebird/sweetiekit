//
//  NUIFocusSystem.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFocusSystem_h
#define NUIFocusSystem_h    

#include "NNSObject.h"

#define js_value_UIFocusSystem(x) js_value_wrapper(x, UIFocusSystem)
#define to_value_UIFocusSystem(x) to_value_wrapper(x, UIFocusSystem)
#define is_value_UIFocusSystem(x) is_value_wrapper(x, UIFocusSystem)

#define js_value_UIFocusSoundIdentifier(x) JS_ENUM(UIFocusSoundIdentifier, NSString, x)
#define to_value_UIFocusSoundIdentifier(x) TO_ENUM(UIFocusSoundIdentifier, NSString, x)
#define is_value_UIFocusSoundIdentifier(x) IS_ENUM(UIFocusSoundIdentifier, NSString, x)

JS_WRAP_CLASS(UIFocusSystem, NSObject);
  JS_STATIC_METHOD(focusSystemForEnvironment);
  JS_STATIC_METHOD(environmentContainsEnvironment);
  JS_STATIC_METHOD(registerURLForSoundIdentifier);
  JS_METHOD(requestFocusUpdateToEnvironment);
  JS_METHOD(updateFocusIfNeeded);
  JS_PROP_READONLY(focusedItem);
JS_WRAP_CLASS_END(UIFocusSystem);

#endif /* NUIFocusSystem_h */
