//
//  NUIPress.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPress.h"

#define instancetype UIPress
#define js_value_instancetype js_value_UIPress

NUIPress::NUIPress() {}
NUIPress::~NUIPress() {}

JS_INIT_CLASS(UIPress, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(timestamp);
  JS_ASSIGN_PROTO_PROP_READONLY(phase);
  JS_ASSIGN_PROTO_PROP_READONLY(type);
  JS_ASSIGN_PROTO_PROP_READONLY(window);
  JS_ASSIGN_PROTO_PROP_READONLY(responder);
  JS_ASSIGN_PROTO_PROP_READONLY(gestureRecognizers);
  JS_ASSIGN_PROTO_PROP_READONLY(force);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIPress, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UIPressPhase) {
    JS_ASSIGN_ENUM(UIPressPhaseBegan, NSInteger);
    JS_ASSIGN_ENUM(UIPressPhaseChanged, NSInteger);
    JS_ASSIGN_ENUM(UIPressPhaseStationary, NSInteger);
    JS_ASSIGN_ENUM(UIPressPhaseEnded, NSInteger);
    JS_ASSIGN_ENUM(UIPressPhaseCancelled, NSInteger);
  //};

  //typedef NS_ENUM(NSInteger, UIPressType) {
    JS_ASSIGN_ENUM(UIPressTypeUpArrow, NSInteger);
    JS_ASSIGN_ENUM(UIPressTypeDownArrow, NSInteger);
    JS_ASSIGN_ENUM(UIPressTypeLeftArrow, NSInteger);
    JS_ASSIGN_ENUM(UIPressTypeRightArrow, NSInteger);

    JS_ASSIGN_ENUM(UIPressTypeSelect, NSInteger);
    JS_ASSIGN_ENUM(UIPressTypeMenu, NSInteger);
    JS_ASSIGN_ENUM(UIPressTypePlayPause, NSInteger);
  //};

JS_INIT_CLASS_END(UIPress, NSObject);

NAN_METHOD(NUIPress::New) {
  JS_RECONSTRUCT(UIPress);
  @autoreleasepool {
    UIPress* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIPress *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIPress alloc] init];
    }
    if (self) {
      NUIPress *wrapper = new NUIPress();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPress::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIPress::timestampGetter) {
  JS_UNWRAP(UIPress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timestamp]));
  }
}

NAN_GETTER(NUIPress::phaseGetter) {
  JS_UNWRAP(UIPress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPressPhase([self phase]));
  }
}

NAN_GETTER(NUIPress::typeGetter) {
  JS_UNWRAP(UIPress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPressType([self type]));
  }
}

#include "NUIWindow.h"

NAN_GETTER(NUIPress::windowGetter) {
  JS_UNWRAP(UIPress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIWindow([self window]));
  }
}

#include "NUIResponder.h"

NAN_GETTER(NUIPress::responderGetter) {
  JS_UNWRAP(UIPress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIResponder([self responder]));
  }
}

#include "NUIGestureRecognizer.h"

NAN_GETTER(NUIPress::gestureRecognizersGetter) {
  JS_UNWRAP(UIPress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIGestureRecognizer*>([self gestureRecognizers]));
  }
}

NAN_GETTER(NUIPress::forceGetter) {
  JS_UNWRAP(UIPress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self force]));
  }
}

