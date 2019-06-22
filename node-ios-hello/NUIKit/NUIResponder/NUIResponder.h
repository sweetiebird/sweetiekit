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
  JS_STATIC_METHOD(clearTextInputContextIdentifier);
// UIResponderStandardEditActions
  JS_METHOD(cut);
  JS_METHOD(copy);
  JS_METHOD(paste);
  JS_METHOD(select);
  JS_METHOD(selectAll);
  JS_METHOD(delete_);
  JS_METHOD(makeTextWritingDirectionLeftToRight);
  JS_METHOD(makeTextWritingDirectionRightToLeft);
  JS_METHOD(toggleBoldface);
  JS_METHOD(toggleItalics);
  JS_METHOD(toggleUnderline);
  JS_METHOD(increaseSize);
  JS_METHOD(decreaseSize);
// UIResponder
  JS_METHOD(nextResponder);
  JS_METHOD(canBecomeFirstResponder);
  JS_METHOD(becomeFirstResponder);
  JS_METHOD(canResignFirstResponder);
  JS_METHOD(resignFirstResponder);
  JS_METHOD(isFirstResponder);
//  JS_METHOD(touchesBeganWithEvent);
//  JS_METHOD(touchesMovedWithEvent);
//  JS_METHOD(touchesEndedWithEvent);
  JS_METHOD(touchesCancelledWithEvent);
  JS_METHOD(touchesEstimatedPropertiesUpdated);
  JS_METHOD(pressesBeganWithEvent);
  JS_METHOD(pressesChangedWithEvent);
  JS_METHOD(pressesEndedWithEvent);
  JS_METHOD(pressesCancelledWithEvent);
  JS_METHOD(motionBeganWithEvent);
  JS_METHOD(motionEndedWithEvent);
  JS_METHOD(motionCancelledWithEvent);
  JS_METHOD(remoteControlReceivedWithEvent);
  JS_METHOD(canPerformActionWithSender);
  JS_METHOD(targetForActionWithSender);
  JS_METHOD(reloadInputViews);
  JS_METHOD(updateUserActivityState);
  JS_METHOD(restoreUserActivityState);
  JS_PROP_READONLY(nextResponder);
  JS_PROP_READONLY(canBecomeFirstResponder);
  JS_PROP_READONLY(canResignFirstResponder);
  JS_PROP_READONLY(isFirstResponder);
  JS_PROP_READONLY(undoManager);
  JS_PROP_READONLY(keyCommands);
  JS_PROP_READONLY(inputView);
  JS_PROP_READONLY(inputAccessoryView);
  JS_PROP_READONLY(inputAssistantItem);
  JS_PROP_READONLY(inputViewController);
  JS_PROP_READONLY(inputAccessoryViewController);
  JS_PROP_READONLY(textInputMode);
  JS_PROP_READONLY(textInputContextIdentifier);
  JS_PROP(userActivity);
  JS_PROP(touchesBeganWithEvent);
  JS_PROP(touchesMovedWithEvent);
  JS_PROP(touchesEndedWithEvent);
JS_WRAP_CLASS_END(UIResponder);

#endif /* NUIResponder_h */
