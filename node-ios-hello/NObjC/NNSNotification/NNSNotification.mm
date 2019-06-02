//
//  NSNotification.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSNotification.h"

NNSNotification::NNSNotification () {}
NNSNotification::~NNSNotification () {}

Nan::Persistent<FunctionTemplate> NNSNotification::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSNotification::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSNotification"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP_READONLY(proto, name);
  JS_ASSIGN_PROP_READONLY(proto, object);
  JS_ASSIGN_PROP_READONLY(proto, userInfo);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "notificationWithName", notificationWithName);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NNSNotification)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NNSNotification *ns = ObjectWrap::Unwrap<NNSNotification>(obj);

  if (info.Length() == 2) {
    @autoreleasepool {
      NSString *name = NJSStringToNSString(info[0]);
      id nsValue = sweetiekit::FromJS(info[1]);
      ns->SetNSObject([NSNotification notificationWithName:name object:nsValue]);
    }
  } else if (info.Length() > 2) {
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
  }

  JS_SET_RETURN(obj);
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
