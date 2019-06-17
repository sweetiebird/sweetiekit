//
//  NUIWindow.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIWindow.h"

NUIWindow::NUIWindow() {}
NUIWindow::~NUIWindow() {}

JS_INIT_CLASS(UIWindow, UIView);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(becomeKeyWindow);
  JS_ASSIGN_PROTO_METHOD(resignKeyWindow);
  JS_ASSIGN_PROTO_METHOD(makeKeyWindow);
  JS_ASSIGN_PROTO_METHOD(makeKeyAndVisible);
  JS_ASSIGN_PROTO_METHOD(sendEvent);
  JS_ASSIGN_PROTO_METHOD(convertPointToWindow);
  JS_ASSIGN_PROTO_METHOD(convertPointFromWindow);
  JS_ASSIGN_PROTO_METHOD(convertRectToWindow);
  JS_ASSIGN_PROTO_METHOD(convertRectFromWindow);
  JS_ASSIGN_PROTO_PROP(screen);
  JS_ASSIGN_PROTO_PROP(windowLevel);
  JS_ASSIGN_PROTO_PROP_READONLY(isKeyWindow);
  JS_ASSIGN_PROTO_PROP(rootViewController);
  // static members (ctor)
  JS_INIT_CTOR(UIWindow, UIView);
JS_INIT_CLASS_END(UIWindow, UIView);

NAN_METHOD(NUIWindow::New) {
  JS_RECONSTRUCT(UIWindow);

  Local<Object> viewObj = info.This();

  NUIWindow *view = new NUIWindow();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIWindow *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NUIWindow::New must receive a UIWindow");
  }
  view->Wrap(viewObj);

  info.GetReturnValue().Set(viewObj);
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

