//
//  NSNotification.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSNotification.h"

NNSNotification::NNSNotification () {}
NNSNotification::~NNSNotification () {}

JS_INIT_CLASS(NSNotification, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, name);
  JS_ASSIGN_PROP_READONLY(proto, object);
  JS_ASSIGN_PROP_READONLY(proto, userInfo);
  // static members (ctor)
  JS_INIT_CTOR(NSNotification, NSObject);
  JS_ASSIGN_METHOD(ctor, notificationWithName);
JS_INIT_CLASS_END(NSNotification, NSObject);

NAN_METHOD(NNSNotification::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSNotification *ns = new NNSNotification();

  if (info[0]->IsExternal()) {
    ns->SetNSObject((__bridge NSNotification *)(info[0].As<External>()->Value()));
  } else if (info.Length() >= 2) {
    @autoreleasepool {
      NSString *name = NJSStringToNSString(info[0]);

      id nsValue = sweetiekit::FromJS(info[1]);

      Local<Object> infoObj = JS_OBJ(info[2]);
      NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
      sweetiekit::forEachEntryInObject(infoObj, ^(Local<Value> key, Local<Value> value) {
        Nan::HandleScope scope;
        NSString* nsKey = NJSStringToNSString(key);
        id nsValue = sweetiekit::FromJS(value);
        dict[nsKey] = nsValue;
      });
      ns->SetNSObject([NSNotification notificationWithName:name object:nsValue userInfo:dict]);
    }
  } else {
    @autoreleasepool {
      ns->SetNSObject([[NSNotification alloc] init]);
    }
  }
  ns->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NNSNotification::notificationWithName) {
  @autoreleasepool {
    NSNotification* self = nil;
    if (info.Length() == 2) {
      NSString *name = to_value_NSString(info[0]);
      id nsValue = to_value_id(info[1]);
      self = [NSNotification notificationWithName:name object:nsValue];
    } else if (info.Length() > 2) {
      NSString *name = to_value_NSString(info[0]);
      id nsValue = to_value_id(info[1]);

      Local<Object> infoObj = JS_OBJ(info[2]);
      NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
      sweetiekit::forEachEntryInObject(infoObj, ^(Local<Value> key, Local<Value> value) {
        Nan::HandleScope scope;
        NSString* nsKey = to_value_NSString(key);
        id nsValue = to_value_id(value);
        dict[nsKey] = nsValue;
      });

      self = [NSNotification notificationWithName:name object:nsValue userInfo:dict];
    }
    if (self) {
      JS_SET_RETURN_EXTERNAL(NSNotification, self);
    }
  }
}

NAN_GETTER(NNSNotification::nameGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSNotification, ns);
  
  JS_SET_RETURN(JS_STR([[ns name] UTF8String]));
}

NAN_GETTER(NNSNotification::objectGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSNotification, ns);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ns object], NNSObject::type));
}

NAN_GETTER(NNSNotification::userInfoGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSNotification, ns);
  
  auto result = Nan::New<Array>();

  @autoreleasepool {
    NSDictionary *userInfo = [ns userInfo];
    if (userInfo != nullptr) {
      NSArray *keys = [userInfo allKeys];
      for (NSUInteger i = 0, count = [keys count]; i < count; i++) {
        NSString *k = [keys objectAtIndex:i];
        id val = [userInfo valueForKey:k];
        if ([val isKindOfClass:[NSString class]]) {
          NSString *v = (NSString *)val;
          Nan::Set(result, static_cast<uint32_t>(i), JS_STR([v UTF8String]));
        } else if ([val isKindOfClass:[NSNumber class]]) {
          NSNumber *v = (NSNumber *)val;
          Nan::Set(result, static_cast<uint32_t>(i), JS_NUM([v doubleValue]));
        } else {
          Nan::Set(result, static_cast<uint32_t>(i), sweetiekit::GetWrapperFor(val, NNSObject::type));
        }
      }
    }
  }
}
