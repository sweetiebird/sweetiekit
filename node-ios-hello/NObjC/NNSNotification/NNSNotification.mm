//
//  NSNotification.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSNotification.h"

#define instancetype NSNotification
#define js_value_instancetype js_value_NSNotification

NNSNotification::NNSNotification () {}
NNSNotification::~NNSNotification () {}

JS_INIT_CLASS(NSNotification, NSObject);
  JS_ASSIGN_STATIC_METHOD(notificationWithNameObject);
  JS_ASSIGN_STATIC_METHOD(notificationWithNameObjectUserInfo);
  JS_ASSIGN_PROTO_METHOD(initWithNameObjectUserInfo);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(init);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(object);
  JS_ASSIGN_PROTO_PROP_READONLY(userInfo);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSNotification, NSObject);
JS_INIT_CLASS_END(NSNotification, NSObject);

NAN_METHOD(NNSNotification::New) {
  JS_RECONSTRUCT(NSNotification);
  @autoreleasepool {
    NSNotification* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSNotification *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSNotification alloc] init];
    }
    if (self) {
      NNSNotification *wrapper = new NNSNotification();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSNotification::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSNotification::notificationWithNameObject) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSNotificationName, aName);
    declare_nullable_value(id, anObject);
    JS_SET_RETURN(js_value_instancetype([NSNotification notificationWithName: aName object: anObject]));
  }
}

NAN_METHOD(NNSNotification::notificationWithNameObjectUserInfo) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSNotificationName, aName);
    declare_nullable_value(id, anObject);
    declare_nullable_pointer(NSDictionary, aUserInfo);
    JS_SET_RETURN(js_value_instancetype([NSNotification notificationWithName: aName object: anObject userInfo: aUserInfo]));
  }
}

NAN_METHOD(NNSNotification::initWithNameObjectUserInfo) {
  JS_UNWRAP_OR_ALLOC(NSNotification, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSNotificationName, name);
    declare_nullable_value(id, object);
    declare_nullable_pointer(NSDictionary, userInfo);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name object: object userInfo: userInfo]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NNSNotification::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(NSNotification, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NNSNotification::init) {
  JS_UNWRAP_OR_ALLOC(NSNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self init]));
  }
}

NAN_GETTER(NNSNotification::nameGetter) {
  JS_UNWRAP(NSNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNotificationName([self name]));
  }
}

NAN_GETTER(NNSNotification::objectGetter) {
  JS_UNWRAP(NSNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self object]));
  }
}

NAN_GETTER(NNSNotification::userInfoGetter) {
  JS_UNWRAP(NSNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self userInfo]));
  }
}

