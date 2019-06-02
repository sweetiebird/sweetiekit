//
//  UIEvent.mm
//
//  Created by Emily Kolar on 2019-5-29.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NUIEvent.h"

Nan::Persistent<FunctionTemplate> NUIEvent::type;

NUIEvent::NUIEvent () {}
NUIEvent::~NUIEvent () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIEvent::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIEvent"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP_READONLY(proto, type);
  JS_ASSIGN_PROP_READONLY(proto, subtype);
  JS_ASSIGN_PROP_READONLY(proto, timestamp);
  JS_ASSIGN_PROP_READONLY(proto, allTouches);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Local<Object> type(JS_OBJ(ctorFn)); type = type;
  //JS_ASSIGN_METHOD(type, someStaticMethod);
  //JS_ASSIGN_PROP(type, someStaticProperty);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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
//    JS_SET_RETURN(js_value_UIEventType([self type]));
    return;
  }
}

NAN_GETTER(NUIEvent::subtypeGetter) {
  JS_UNWRAP(UIEvent, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_UIEventSubtype([self subtype]));
    return;
  }
}

NAN_GETTER(NUIEvent::timestampGetter) {
  JS_UNWRAP(UIEvent, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_NSTimeInterval([self timestamp]));
    return;
  }
}

NAN_GETTER(NUIEvent::allTouchesGetter) {
  JS_UNWRAP(UIEvent, self);
  @autoreleasepool
  {
//    JS_SET_RETURN(js_value_NSSet <UITouch* >([self allTouches]));
    return;
  }
}

