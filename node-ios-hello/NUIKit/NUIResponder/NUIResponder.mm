//
//  NUIResponder.mm
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIResponder.h"

#define instancetype UIResponder
#define js_value_instancetype js_value_UIResponder

NUIResponder::NUIResponder() {}
NUIResponder::~NUIResponder() {}

JS_INIT_CLASS(UIResponder, NSObject);
  JS_ASSIGN_STATIC_METHOD(clearTextInputContextIdentifier);
// UIResponderStandardEditActions
  JS_ASSIGN_PROTO_METHOD(cut);
  JS_ASSIGN_PROTO_METHOD(copy);
  JS_ASSIGN_PROTO_METHOD(paste);
  JS_ASSIGN_PROTO_METHOD(select);
  JS_ASSIGN_PROTO_METHOD(selectAll);
  JS_ASSIGN_PROTO_METHOD_AS(delete_, "delete");
  JS_ASSIGN_PROTO_METHOD(makeTextWritingDirectionLeftToRight);
  JS_ASSIGN_PROTO_METHOD(makeTextWritingDirectionRightToLeft);
  JS_ASSIGN_PROTO_METHOD(toggleBoldface);
  JS_ASSIGN_PROTO_METHOD(toggleItalics);
  JS_ASSIGN_PROTO_METHOD(toggleUnderline);
  JS_ASSIGN_PROTO_METHOD(increaseSize);
  JS_ASSIGN_PROTO_METHOD(decreaseSize);
// UIResponder
  JS_ASSIGN_PROTO_METHOD(nextResponder);
  JS_ASSIGN_PROTO_METHOD(canBecomeFirstResponder);
  JS_ASSIGN_PROTO_METHOD(becomeFirstResponder);
  JS_ASSIGN_PROTO_METHOD(canResignFirstResponder);
  JS_ASSIGN_PROTO_METHOD(resignFirstResponder);
  JS_ASSIGN_PROTO_METHOD(isFirstResponder);
  JS_ASSIGN_PROTO_METHOD(touchesBeganWithEvent);
  JS_ASSIGN_PROTO_METHOD(touchesMovedWithEvent);
  JS_ASSIGN_PROTO_METHOD(touchesEndedWithEvent);
  JS_ASSIGN_PROTO_METHOD(touchesCancelledWithEvent);
  JS_ASSIGN_PROTO_METHOD(touchesEstimatedPropertiesUpdated);
  JS_ASSIGN_PROTO_METHOD(pressesBeganWithEvent);
  JS_ASSIGN_PROTO_METHOD(pressesChangedWithEvent);
  JS_ASSIGN_PROTO_METHOD(pressesEndedWithEvent);
  JS_ASSIGN_PROTO_METHOD(pressesCancelledWithEvent);
  JS_ASSIGN_PROTO_METHOD(motionBeganWithEvent);
  JS_ASSIGN_PROTO_METHOD(motionEndedWithEvent);
  JS_ASSIGN_PROTO_METHOD(motionCancelledWithEvent);
  JS_ASSIGN_PROTO_METHOD(remoteControlReceivedWithEvent);
  JS_ASSIGN_PROTO_METHOD(canPerformActionWithSender);
  JS_ASSIGN_PROTO_METHOD(targetForActionWithSender);
  JS_ASSIGN_PROTO_METHOD(reloadInputViews);
  JS_ASSIGN_PROTO_METHOD(updateUserActivityState);
  JS_ASSIGN_PROTO_METHOD(restoreUserActivityState);
  JS_ASSIGN_PROTO_PROP_READONLY(nextResponder);
  JS_ASSIGN_PROTO_PROP_READONLY(canBecomeFirstResponder);
  JS_ASSIGN_PROTO_PROP_READONLY(canResignFirstResponder);
  JS_ASSIGN_PROTO_PROP_READONLY(isFirstResponder);
  JS_ASSIGN_PROTO_PROP_READONLY(undoManager);
  JS_ASSIGN_PROTO_PROP_READONLY(keyCommands);
  JS_ASSIGN_PROTO_PROP_READONLY(inputView);
  JS_ASSIGN_PROTO_PROP_READONLY(inputAccessoryView);
  JS_ASSIGN_PROTO_PROP_READONLY(inputAssistantItem);
  JS_ASSIGN_PROTO_PROP_READONLY(inputViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(inputAccessoryViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(textInputMode);
  JS_ASSIGN_PROTO_PROP_READONLY(textInputContextIdentifier);
  JS_ASSIGN_PROTO_PROP(userActivity);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIResponder, NSObject);
JS_INIT_CLASS_END(UIResponder, NSObject);

NAN_METHOD(NUIResponder::New) {
  JS_RECONSTRUCT(UIResponder);
  @autoreleasepool {
    UIResponder* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIResponder *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIResponder alloc] init];
    }
    if (self) {
      NUIResponder *wrapper = new NUIResponder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIResponder::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIResponder::clearTextInputContextIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    [UIResponder clearTextInputContextIdentifier: identifier];
  }
}

NAN_METHOD(NUIResponder::cut) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self cut: sender];
  }
}

NAN_METHOD(NUIResponder::copy) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self copy: sender];
  }
}

NAN_METHOD(NUIResponder::paste) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self paste: sender];
  }
}

NAN_METHOD(NUIResponder::select) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self select: sender];
  }
}

NAN_METHOD(NUIResponder::selectAll) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self selectAll: sender];
  }
}

NAN_METHOD(NUIResponder::delete_) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self delete: sender];
  }
}

NAN_METHOD(NUIResponder::makeTextWritingDirectionLeftToRight) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self makeTextWritingDirectionLeftToRight: sender];
  }
}

NAN_METHOD(NUIResponder::makeTextWritingDirectionRightToLeft) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self makeTextWritingDirectionRightToLeft: sender];
  }
}

NAN_METHOD(NUIResponder::toggleBoldface) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self toggleBoldface: sender];
  }
}

NAN_METHOD(NUIResponder::toggleItalics) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self toggleItalics: sender];
  }
}

NAN_METHOD(NUIResponder::toggleUnderline) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self toggleUnderline: sender];
  }
}

NAN_METHOD(NUIResponder::increaseSize) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self increaseSize: sender];
  }
}

NAN_METHOD(NUIResponder::decreaseSize) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    [self decreaseSize: sender];
  }
}

NAN_METHOD(NUIResponder::nextResponder) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIResponder([self nextResponder]));
  }
}

NAN_METHOD(NUIResponder::canBecomeFirstResponder) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canBecomeFirstResponder]));
  }
}

NAN_METHOD(NUIResponder::becomeFirstResponder) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self becomeFirstResponder]));
  }
}

NAN_METHOD(NUIResponder::canResignFirstResponder) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canResignFirstResponder]));
  }
}

NAN_METHOD(NUIResponder::resignFirstResponder) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self resignFirstResponder]));
  }
}

NAN_METHOD(NUIResponder::isFirstResponder) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFirstResponder]));
  }
}

#include "NUITouch.h"
#include "NUIEvent.h"

NAN_METHOD(NUIResponder::touchesBeganWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UITouch*>*/, touches);
    declare_nullable_pointer(UIEvent, event);
    [self touchesBegan: touches withEvent: event];
  }
}

NAN_METHOD(NUIResponder::touchesMovedWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UITouch*>*/, touches);
    declare_nullable_pointer(UIEvent, event);
    [self touchesMoved: touches withEvent: event];
  }
}

NAN_METHOD(NUIResponder::touchesEndedWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UITouch*>*/, touches);
    declare_nullable_pointer(UIEvent, event);
    [self touchesEnded: touches withEvent: event];
  }
}

NAN_METHOD(NUIResponder::touchesCancelledWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UITouch*>*/, touches);
    declare_nullable_pointer(UIEvent, event);
    [self touchesCancelled: touches withEvent: event];
  }
}

NAN_METHOD(NUIResponder::touchesEstimatedPropertiesUpdated) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UITouch*>*/, touches);
    [self touchesEstimatedPropertiesUpdated: touches];
  }
}

#include "NUIPress.h"
#include "NUIPressesEvent.h"

NAN_METHOD(NUIResponder::pressesBeganWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UIPress*>*/, presses);
    declare_nullable_pointer(UIPressesEvent, event);
    [self pressesBegan: presses withEvent: event];
  }
}

NAN_METHOD(NUIResponder::pressesChangedWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UIPress*>*/, presses);
    declare_nullable_pointer(UIPressesEvent, event);
    [self pressesChanged: presses withEvent: event];
  }
}

NAN_METHOD(NUIResponder::pressesEndedWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UIPress*>*/, presses);
    declare_nullable_pointer(UIPressesEvent, event);
    [self pressesEnded: presses withEvent: event];
  }
}

NAN_METHOD(NUIResponder::pressesCancelledWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UIPress*>*/, presses);
    declare_nullable_pointer(UIPressesEvent, event);
    [self pressesCancelled: presses withEvent: event];
  }
}

NAN_METHOD(NUIResponder::motionBeganWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIEventSubtype, motion);
    declare_nullable_pointer(UIEvent, event);
    [self motionBegan: motion withEvent: event];
  }
}

NAN_METHOD(NUIResponder::motionEndedWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIEventSubtype, motion);
    declare_nullable_pointer(UIEvent, event);
    [self motionEnded: motion withEvent: event];
  }
}

NAN_METHOD(NUIResponder::motionCancelledWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIEventSubtype, motion);
    declare_nullable_pointer(UIEvent, event);
    [self motionCancelled: motion withEvent: event];
  }
}

NAN_METHOD(NUIResponder::remoteControlReceivedWithEvent) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIEvent, event);
    [self remoteControlReceivedWithEvent: event];
  }
}

NAN_METHOD(NUIResponder::canPerformActionWithSender) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, action);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_BOOL([self canPerformAction: action withSender: sender]));
  }
}

NAN_METHOD(NUIResponder::targetForActionWithSender) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, action);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_id([self targetForAction: action withSender: sender]));
  }
}

NAN_METHOD(NUIResponder::reloadInputViews) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    [self reloadInputViews];
  }
}

#include "NNSUserActivity.h"

NAN_METHOD(NUIResponder::updateUserActivityState) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSUserActivity, activity);
    [self updateUserActivityState: activity];
  }
}

NAN_METHOD(NUIResponder::restoreUserActivityState) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSUserActivity, activity);
    [self restoreUserActivityState: activity];
  }
}

NAN_GETTER(NUIResponder::nextResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIResponder([self nextResponder]));
  }
}

NAN_GETTER(NUIResponder::canBecomeFirstResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canBecomeFirstResponder]));
  }
}

NAN_GETTER(NUIResponder::canResignFirstResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canResignFirstResponder]));
  }
}

NAN_GETTER(NUIResponder::isFirstResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFirstResponder]));
  }
}

#include "NNSUndoManager.h"

NAN_GETTER(NUIResponder::undoManagerGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUndoManager([self undoManager]));
  }
}

NAN_GETTER(NUIResponder::keyCommandsGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIKeyCommand*>([self keyCommands]));
  }
}

#include "NUIView.h"

NAN_GETTER(NUIResponder::inputViewGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self inputView]));
  }
}

NAN_GETTER(NUIResponder::inputAccessoryViewGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self inputAccessoryView]));
  }
}

#include "NUITextInputAssistantItem.h"

NAN_GETTER(NUIResponder::inputAssistantItemGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextInputAssistantItem([self inputAssistantItem]));
  }
}

#include "NUIInputViewController.h"

NAN_GETTER(NUIResponder::inputViewControllerGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInputViewController([self inputViewController]));
  }
}

NAN_GETTER(NUIResponder::inputAccessoryViewControllerGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInputViewController([self inputAccessoryViewController]));
  }
}

#include "NUITextInputMode.h"

NAN_GETTER(NUIResponder::textInputModeGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextInputMode([self textInputMode]));
  }
}

NAN_GETTER(NUIResponder::textInputContextIdentifierGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self textInputContextIdentifier]));
  }
}

NAN_GETTER(NUIResponder::userActivityGetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUserActivity([self userActivity]));
  }
}

NAN_SETTER(NUIResponder::userActivitySetter) {
  JS_UNWRAP(UIResponder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSUserActivity, input);
    [self setUserActivity: input];
  }
}
