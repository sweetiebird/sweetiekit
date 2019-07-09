//
//  UIEvent.mm
//
//  Created by Emily Kolar on 2019-5-29.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIEvent.h"

NUIEvent::NUIEvent() {}
NUIEvent::~NUIEvent() {}

JS_INIT_CLASS(UIEvent, NSObject);
#if UIKIT_DEFINE_AS_PROPERTIES
  JS_ASSIGN_PROTO_PROP_READONLY(allTouches);
#else
  JS_ASSIGN_PROTO_METHOD(allTouches);
#endif
  JS_ASSIGN_PROTO_METHOD(touchesForWindow);
  JS_ASSIGN_PROTO_METHOD(touchesForView);
  JS_ASSIGN_PROTO_METHOD(touchesForGestureRecognizer);
  JS_ASSIGN_PROTO_METHOD(coalescedTouchesForTouch);
  JS_ASSIGN_PROTO_METHOD(predictedTouchesForTouch);
  JS_ASSIGN_PROTO_PROP_READONLY(type);
  JS_ASSIGN_PROTO_PROP_READONLY(subtype);
  JS_ASSIGN_PROTO_PROP_READONLY(timestamp);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIEvent, NSObject);
  // constants (exports)

//typedef NS_ENUM(NSInteger, UIEventType) {
  JS_ASSIGN_ENUM(UIEventTypeTouches, NSInteger);
  JS_ASSIGN_ENUM(UIEventTypeMotion, NSInteger);
  JS_ASSIGN_ENUM(UIEventTypeRemoteControl, NSInteger);
  JS_ASSIGN_ENUM(UIEventTypePresses, NSInteger); // NS_ENUM_AVAILABLE_IOS(9_0),
//};

//typedef NS_ENUM(NSInteger, UIEventSubtype) {
  // available in iPhone OS 3.0
  JS_ASSIGN_ENUM(UIEventSubtypeNone, NSInteger); //                              = 0,
  
  // for UIEventTypeMotion, available in iPhone OS 3.0
  JS_ASSIGN_ENUM(UIEventSubtypeMotionShake, NSInteger); //                       = 1,
  
  // for UIEventTypeRemoteControl, available in iOS 4.0
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlPlay, NSInteger); //                 = 100,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlPause, NSInteger); //                = 101,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlStop, NSInteger); //                 = 102,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlTogglePlayPause, NSInteger); //      = 103,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlNextTrack, NSInteger); //            = 104,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlPreviousTrack, NSInteger); //        = 105,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlBeginSeekingBackward, NSInteger); // = 106,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlEndSeekingBackward, NSInteger); //   = 107,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlBeginSeekingForward, NSInteger); //  = 108,
  JS_ASSIGN_ENUM(UIEventSubtypeRemoteControlEndSeekingForward, NSInteger); //    = 109,
//};

JS_INIT_CLASS_END(UIEvent, NSObject);

NAN_METHOD(NUIEvent::New) {
  JS_RECONSTRUCT(UIEvent);
  @autoreleasepool {
    UIEvent* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIEvent *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIEvent alloc] init];
    }
    if (self) {
      NUIEvent *wrapper = new NUIEvent();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIEvent::New: invalid arguments");
    }
  }
}

#include "NUITouch.h"

#if UIKIT_DEFINE_AS_PROPERTIES
NAN_GETTER(NUIEvent::allTouchesGetter) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <UITouch*>*/([self allTouches]));
  }
}
#else
NAN_METHOD(NUIEvent::allTouches) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <UITouch*>*/([self allTouches]));
  }
}
#endif

#include "NUIWindow.h"

NAN_METHOD(NUIEvent::touchesForWindow) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIWindow, window);
    JS_SET_RETURN(js_value_NSSet/* <UITouch*>*/([self touchesForWindow: window]));
  }
}

NAN_METHOD(NUIEvent::touchesForView) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_NSSet/* <UITouch*>*/([self touchesForView: view]));
  }
}

#include "NUIGestureRecognizer.h"

NAN_METHOD(NUIEvent::touchesForGestureRecognizer) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIGestureRecognizer, gesture);
    JS_SET_RETURN(js_value_NSSet/* <UITouch*>*/([self touchesForGestureRecognizer: gesture]));
  }
}

NAN_METHOD(NUIEvent::coalescedTouchesForTouch) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITouch, touch);
    JS_SET_RETURN(js_value_NSArray<UITouch*>([self coalescedTouchesForTouch: touch]));
  }
}

NAN_METHOD(NUIEvent::predictedTouchesForTouch) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITouch, touch);
    JS_SET_RETURN(js_value_NSArray<UITouch*>([self predictedTouchesForTouch: touch]));
  }
}

NAN_GETTER(NUIEvent::typeGetter) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEventType([self type]));
  }
}

NAN_GETTER(NUIEvent::subtypeGetter) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEventSubtype([self subtype]));
  }
}

NAN_GETTER(NUIEvent::timestampGetter) {
  JS_UNWRAP(UIEvent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timestamp]));
  }
}
