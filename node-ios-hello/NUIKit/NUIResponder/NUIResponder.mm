//
//  NUIResponder.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NUIResponder.h"

Nan::Persistent<FunctionTemplate> NUIResponder::type;

NUIResponder::NUIResponder () {}
NUIResponder::~NUIResponder () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIResponder::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIResponder"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "touchesBeganWithEvent", touchesBeganWithEvent);
  Nan::SetMethod(proto, "touchesMovedWithEvent", touchesMovedWithEvent);
  Nan::SetMethod(proto, "touchesEndedWithEvent", touchesEndedWithEvent);
  JS_ASSIGN_PROP_READONLY(proto, nextResponder);
  JS_ASSIGN_PROP_READONLY(proto, canBecomeFirstResponder);
  JS_ASSIGN_PROP_READONLY(proto, canResignFirstResponder);
  JS_ASSIGN_PROP_READONLY(proto, isFirstResponder);
  JS_ASSIGN_PROP_READONLY(proto, undoManager);
  // UIKeyCommand
  //  JS_ASSIGN_PROP_READONLY(proto, input);
  //  JS_ASSIGN_PROP_READONLY(proto, modifierFlags);
  //  JS_ASSIGN_PROP(proto, discoverabilityTitle);
  // UIResponder
  JS_ASSIGN_PROP_READONLY(proto, keyCommands);
  JS_ASSIGN_PROP_READONLY(proto, inputView);
  JS_ASSIGN_PROP_READONLY(proto, inputAccessoryView);
  JS_ASSIGN_PROP_READONLY(proto, inputAssistantItem);
  JS_ASSIGN_PROP_READONLY(proto, inputViewController);
  JS_ASSIGN_PROP_READONLY(proto, inputAccessoryViewController);
  JS_ASSIGN_PROP_READONLY(proto, textInputMode);
  JS_ASSIGN_PROP_READONLY(proto, textInputContextIdentifier);
  JS_ASSIGN_PROP(proto, userActivity);
  JS_ASSIGN_PROP(proto, touchesBegan);
  JS_ASSIGN_PROP(proto, touchesMoved);
  JS_ASSIGN_PROP(proto, touchesEnded);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIResponder::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIResponder *view = new NUIResponder();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIResponder *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NUIResponder::New must receive a UIResponder");
  }
  view->Wrap(viewObj);

  info.GetReturnValue().Set(viewObj);
}

NAN_METHOD(NUIResponder::touchesBeganWithEvent) {
  
}

NAN_METHOD(NUIResponder::touchesMovedWithEvent) {
  
}

NAN_METHOD(NUIResponder::touchesEndedWithEvent) {
  
}

NAN_GETTER(NUIResponder::nextResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UIResponder([self nextResponder]));
    return;
  }
}

NAN_GETTER(NUIResponder::canBecomeFirstResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self canBecomeFirstResponder]));
    return;
  }
}

NAN_GETTER(NUIResponder::canResignFirstResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self canResignFirstResponder]));
    return;
  }
}

NAN_GETTER(NUIResponder::isFirstResponderGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isFirstResponder]));
    return;
  }
}

NAN_GETTER(NUIResponder::undoManagerGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_NSUndoManager([self undoManager]));
    return;
  }
}

//NAN_GETTER(NUIKeyCommand::inputGetter) {
//  JS_UNWRAP(UIKeyCommand, self);
//  @autoreleasepool
//  {
//    JS_SET_RETURN(js_value_NSString([self input]));
//    return;
//  }
//}

//NAN_GETTER(NUIKeyCommand::modifierFlagsGetter) {
//  JS_UNWRAP(UIKeyCommand, self);
//  @autoreleasepool
//  {
//    JS_SET_RETURN(js_value_UIKeyModifierFlags([self modifierFlags]));
//    return;
//  }
//}

//NAN_GETTER(NUIKeyCommand::discoverabilityTitleGetter) {
//  JS_UNWRAP(UIKeyCommand, self);
//  @autoreleasepool
//  {
//    JS_SET_RETURN(js_value_NSString([self discoverabilityTitle]));
//    return;
//  }
//}

//NAN_SETTER(NUIKeyCommand::discoverabilityTitleSetter) {
//  JS_UNWRAP(UIKeyCommand, self);
//  @autoreleasepool
//  {
//    [self setDiscoverabilityTitle: to_value_NSString(value)];
//  }
//}

NAN_GETTER(NUIResponder::keyCommandsGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<UIKeyCommand* >([self keyCommands]));
    return;
  }
}

NAN_GETTER(NUIResponder::inputViewGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UIView([self inputView]));
    return;
  }
}

NAN_GETTER(NUIResponder::inputAccessoryViewGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UIView([self inputAccessoryView]));
    return;
  }
}

NAN_GETTER(NUIResponder::inputAssistantItemGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UITextInputAssistantItem([self inputAssistantItem]));
    return;
  }
}

NAN_GETTER(NUIResponder::inputViewControllerGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UIInputViewController([self inputViewController]));
    return;
  }
}

NAN_GETTER(NUIResponder::inputAccessoryViewControllerGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UIInputViewController([self inputAccessoryViewController]));
    return;
  }
}

NAN_GETTER(NUIResponder::textInputModeGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UITextInputMode([self textInputMode]));
    return;
  }
}

NAN_GETTER(NUIResponder::textInputContextIdentifierGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self textInputContextIdentifier]));
    return;
  }
}

NAN_GETTER(NUIResponder::userActivityGetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_NSUserActivity([self userActivity]));
    return;
  }
}

NAN_SETTER(NUIResponder::userActivitySetter) {
  JS_UNWRAP(UIResponder, self);
  @autoreleasepool
  {
//    [self setUserActivity: to_value_NSUserActivity(value)];
  }
}

NAN_GETTER(NUIResponder::touchesBeganGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIResponder, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_touchesBegan"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIResponder::touchesBeganSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIResponder, ui);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_touchesBegan"];
  }
}

NAN_GETTER(NUIResponder::touchesMovedGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIResponder, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_touchesMoved"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIResponder::touchesMovedSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIResponder, ui);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_touchesMoved"];
  }
}

NAN_GETTER(NUIResponder::touchesEndedGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIResponder, ui);

  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_touchesEnded"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIResponder::touchesEndedSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIResponder, ui);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_touchesEnded"];
  }
}
