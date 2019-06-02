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
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, type);
  JS_ASSIGN_PROP_READONLY(proto, subtype);
  JS_ASSIGN_PROP_READONLY(proto, timestamp);
  JS_ASSIGN_PROP_READONLY(proto, allTouches);
  // static members (ctor)
  JS_INIT_CTOR(UIEvent, NSObject);
JS_INIT_CLASS_END(UIEvent, NSObject);

NAN_METHOD(NUIEvent::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UIEvent(...)', turn into construct call.
      JS_SET_RETURN_NEW(UIEvent, info);
      return;
    }

    UIEvent* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIEvent *)(info[0].As<External>()->Value());
    } else if(info.Length() <= 0) {
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

NAN_GETTER(NUIEvent::typeGetter) {
  JS_UNWRAP(UIEvent, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIEventType([self type]));
    return;
  }
}

NAN_GETTER(NUIEvent::subtypeGetter) {
  JS_UNWRAP(UIEvent, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIEventSubtype([self subtype]));
    return;
  }
}

NAN_GETTER(NUIEvent::timestampGetter) {
  JS_UNWRAP(UIEvent, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSTimeInterval([self timestamp]));
    return;
  }
}

NAN_GETTER(NUIEvent::allTouchesGetter) {
  JS_UNWRAP(UIEvent, self);
  @autoreleasepool
  {
    Nan::ThrowError("Not implemented");
//    JS_SET_RETURN(js_value_NSSet <UITouch* >([self allTouches]));
    return;
  }
}

