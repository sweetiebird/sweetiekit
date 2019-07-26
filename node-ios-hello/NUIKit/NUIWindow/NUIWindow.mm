//
//  NUIWindow.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIWindow.h"

#define instancetype UIWindow
#define js_value_instancetype js_value_UIWindow

NUIWindow::NUIWindow() {}
NUIWindow::~NUIWindow() {}

#include "NNSNotification.h"

JS_INIT_CLASS(UIWindow, UIView);
  // instance members (proto)
  if (@available(iOS 13.0, *)) {
    JS_ASSIGN_PROTO_METHOD(initWithWindowScene);
  }
  JS_ASSIGN_PROTO_METHOD(becomeKeyWindow);
  JS_ASSIGN_PROTO_METHOD(resignKeyWindow);
  JS_ASSIGN_PROTO_METHOD(makeKeyWindow);
  JS_ASSIGN_PROTO_METHOD(makeKeyAndVisible);
  JS_ASSIGN_PROTO_METHOD(sendEvent);
  JS_ASSIGN_PROTO_METHOD(convertPointToWindow);
  JS_ASSIGN_PROTO_METHOD(convertPointFromWindow);
  JS_ASSIGN_PROTO_METHOD(convertRectToWindow);
  JS_ASSIGN_PROTO_METHOD(convertRectFromWindow);
  if (@available(iOS 13.0, *)) {
    JS_ASSIGN_PROTO_PROP(windowScene);
  }
  JS_ASSIGN_PROTO_PROP(screen);
  JS_ASSIGN_PROTO_PROP(windowLevel);
  JS_ASSIGN_PROTO_PROP_READONLY(isKeyWindow);
  JS_ASSIGN_PROTO_PROP(rootViewController);
  // static members (ctor)
  JS_INIT_CTOR(UIWindow, UIView);
  // constants (exports)
  
  JS_ASSIGN_ENUM(UIWindowLevelNormal, UIWindowLevel); // ;
  JS_ASSIGN_ENUM(UIWindowLevelAlert, UIWindowLevel); // ;
  JS_ASSIGN_ENUM(UIWindowLevelStatusBar, UIWindowLevel); //  __TVOS_PROHIBITED;

  JS_ASSIGN_ENUM(UIWindowDidBecomeVisibleNotification, NSNotificationName); // ; 
  JS_ASSIGN_ENUM(UIWindowDidBecomeHiddenNotification, NSNotificationName); // ;  
  JS_ASSIGN_ENUM(UIWindowDidBecomeKeyNotification, NSNotificationName); // ;     
  JS_ASSIGN_ENUM(UIWindowDidResignKeyNotification, NSNotificationName); // ;     

  JS_ASSIGN_ENUM(UIKeyboardWillShowNotification, NSNotificationName); //  __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UIKeyboardDidShowNotification, NSNotificationName); //  __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UIKeyboardWillHideNotification, NSNotificationName); //  __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UIKeyboardDidHideNotification, NSNotificationName); //  __TVOS_PROHIBITED;

  JS_ASSIGN_ENUM(UIKeyboardFrameBeginUserInfoKey, NSString); //         NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED; 
  JS_ASSIGN_ENUM(UIKeyboardFrameEndUserInfoKey, NSString); //           NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED; 
  JS_ASSIGN_ENUM(UIKeyboardAnimationDurationUserInfoKey, NSString); //  NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED; 
  JS_ASSIGN_ENUM(UIKeyboardAnimationCurveUserInfoKey, NSString); //     NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED; 
  JS_ASSIGN_ENUM(UIKeyboardIsLocalUserInfoKey, NSString); //            NS_AVAILABLE_IOS(9_0) __TVOS_PROHIBITED; 

  JS_ASSIGN_ENUM(UIKeyboardWillChangeFrameNotification, NSNotificationName); //   NS_AVAILABLE_IOS(5_0) __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UIKeyboardDidChangeFrameNotification, NSNotificationName); //    NS_AVAILABLE_IOS(5_0) __TVOS_PROHIBITED;

  JS_ASSIGN_ENUM(UIKeyboardCenterBeginUserInfoKey, NSString); //    NS_DEPRECATED_IOS(2_0, 3_2) __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UIKeyboardCenterEndUserInfoKey, NSString); //      NS_DEPRECATED_IOS(2_0, 3_2) __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UIKeyboardBoundsUserInfoKey, NSString); //         NS_DEPRECATED_IOS(2_0, 3_2) __TVOS_PROHIBITED;


JS_INIT_CLASS_END(UIWindow, UIView);

NAN_METHOD(NUIWindow::New) {
  JS_RECONSTRUCT(UIWindow);
  @autoreleasepool {
    UIWindow* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIWindow *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIWindow alloc] init];
    }
    if (self) {
      NUIWindow *wrapper = new NUIWindow();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIWindow::New: invalid arguments");
    }
  }
}

#include "NUIWindowScene.h"

NAN_METHOD(NUIWindow::initWithWindowScene) {
  JS_UNWRAP_OR_ALLOC(UIWindow, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIWindowScene, windowScene);
    JS_SET_RETURN(js_value_instancetype([self initWithWindowScene: windowScene]));
  }
}

#include "NUIViewController.h"

NAN_METHOD(NUIWindow::becomeKeyWindow) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    [self becomeKeyWindow];
  }
}

NAN_METHOD(NUIWindow::resignKeyWindow) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    [self resignKeyWindow];
  }
}

NAN_METHOD(NUIWindow::makeKeyWindow) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    [self makeKeyWindow];
  }
}

NAN_METHOD(NUIWindow::makeKeyAndVisible) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    [self makeKeyAndVisible];
  }
}

#include "NUIEvent.h"

NAN_METHOD(NUIWindow::sendEvent) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIEvent, event);
    [self sendEvent: event];
  }
}

NAN_METHOD(NUIWindow::convertPointToWindow) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_nullable_pointer(UIWindow, window);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point toWindow: window]));
  }
}

NAN_METHOD(NUIWindow::convertPointFromWindow) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_nullable_pointer(UIWindow, window);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point fromWindow: window]));
  }
}

NAN_METHOD(NUIWindow::convertRectToWindow) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_nullable_pointer(UIWindow, window);
    JS_SET_RETURN(js_value_CGRect([self convertRect: rect toWindow: window]));
  }
}

NAN_METHOD(NUIWindow::convertRectFromWindow) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_nullable_pointer(UIWindow, window);
    JS_SET_RETURN(js_value_CGRect([self convertRect: rect fromWindow: window]));
  }
}

NAN_GETTER(NUIWindow::windowSceneGetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIWindowScene([self windowScene]));
  }
}

NAN_SETTER(NUIWindow::windowSceneSetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIWindowScene, input);
    [self setWindowScene: input];
  }
}

#include "NUIScreen.h"

NAN_GETTER(NUIWindow::screenGetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreen([self screen]));
  }
}

NAN_SETTER(NUIWindow::screenSetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIScreen, input);
    [self setScreen: input];
  }
}

NAN_GETTER(NUIWindow::windowLevelGetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIWindowLevel([self windowLevel]));
  }
}

NAN_SETTER(NUIWindow::windowLevelSetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIWindowLevel, input);
    [self setWindowLevel: input];
  }
}

NAN_GETTER(NUIWindow::isKeyWindowGetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isKeyWindow]));
  }
}

NAN_GETTER(NUIWindow::rootViewControllerGetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self rootViewController]));
  }
}

NAN_SETTER(NUIWindow::rootViewControllerSetter) {
  JS_UNWRAP(UIWindow, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIViewController, input);
    [self setRootViewController: input];
  }
}

