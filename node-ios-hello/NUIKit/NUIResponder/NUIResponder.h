//
//  NUIResponder.h
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIResponder_h
#define NUIResponder_h

#include "NNSObject.h"

#define js_value_UIResponder(x) js_value_wrapper(x, UIResponder)
#define to_value_UIResponder(x) to_value_wrapper(x, UIResponder)
#define is_value_UIResponder(x) is_value_wrapper(x, UIResponder)

JS_WRAP_CLASS(UIResponder, NSObject);
  JS_METHOD(touchesBeganWithEvent);
  JS_METHOD(touchesMovedWithEvent);
  JS_METHOD(touchesEndedWithEvent);
  JS_PROP(nextResponder);
  JS_PROP(canBecomeFirstResponder);
  JS_PROP(canResignFirstResponder);
  JS_PROP(isFirstResponder);
  JS_PROP(undoManager);
  // UIKeyCommand
//  JS_PROP(input);
//  JS_PROP(modifierFlags);
//  JS_PROP(discoverabilityTitle);
  // UIResponder
  JS_PROP(keyCommands);
  JS_PROP(inputView);
  JS_PROP(inputAccessoryView);
  JS_PROP(inputAssistantItem);
  JS_PROP(inputViewController);
  JS_PROP(inputAccessoryViewController);
  JS_PROP(textInputMode);
  JS_PROP(textInputContextIdentifier);
  JS_PROP(userActivity);
  JS_PROP(touchesBegan);
  JS_PROP(touchesMoved);
  JS_PROP(touchesEnded);
JS_WRAP_CLASS_END(UIResponder);

#endif /* NUIResponder_h */
