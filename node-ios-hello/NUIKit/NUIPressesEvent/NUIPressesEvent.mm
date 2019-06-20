//
//  NUIPressesEvent.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPressesEvent.h"

#define instancetype UIPressesEvent
#define js_value_instancetype js_value_UIPressesEvent

NUIPressesEvent::NUIPressesEvent() {}
NUIPressesEvent::~NUIPressesEvent() {}

JS_INIT_CLASS(UIPressesEvent, UIEvent);
#if UIKIT_DEFINE_AS_PROPERTIES
  JS_ASSIGN_PROTO_PROP_READONLY(allPresses);
#else
  JS_ASSIGN_PROTO_METHOD(allPresses);
#endif
  JS_ASSIGN_PROTO_METHOD(pressesForGestureRecognizer);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIPressesEvent, UIEvent);
  // constant values (exports)
JS_INIT_CLASS_END(UIPressesEvent, UIEvent);

NAN_METHOD(NUIPressesEvent::New) {
  JS_RECONSTRUCT(UIPressesEvent);
  @autoreleasepool {
    UIPressesEvent* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIPressesEvent *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIPressesEvent alloc] init];
    }
    if (self) {
      NUIPressesEvent *wrapper = new NUIPressesEvent();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPressesEvent::New: invalid arguments");
    }
  }
}

#if UIKIT_DEFINE_AS_PROPERTIES
NAN_GETTER(NUIPressesEvent::allPressesGetter) {
  JS_UNWRAP(UIPressesEvent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <UIPress*>*/([self allPresses]));
  }
}
#else
NAN_METHOD(NUIPressesEvent::allPresses) {
  JS_UNWRAP(UIPressesEvent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <UIPress*>*/([self allPresses]));
  }
}
#endif

#include "NUIGestureRecognizer.h"

NAN_METHOD(NUIPressesEvent::pressesForGestureRecognizer) {
  JS_UNWRAP(UIPressesEvent, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIGestureRecognizer, gesture);
    JS_SET_RETURN(js_value_NSSet/* <UIPress*>*/([self pressesForGestureRecognizer: gesture]));
  }
}
