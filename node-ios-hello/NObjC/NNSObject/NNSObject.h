//
//  NNSObject.h
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSObject_h
#define NNSObject_h

#include "defines.h"

#ifdef __OBJC__
@interface NSObject (CategoryNSObject)

- (void) associateValue:(id)value withKey:(NSString *)aKey;
- (id) associatedValueForKey:(NSString *)aKey;
- (void) dissociateValueForKey:(NSString *)aKey;

@end

extern "C" void objc_callCallback(NSObject* obj);
#endif

class NObjectWrap : public ObjectWrap
{
};

JS_WRAP_CLASS(id, ObjectWrap);
  JS_METHOD(_NSClassFromString);
  JS_METHOD(_objc_msgSend);
  
  JS_PROP(self);
  JS_PROP(selfPointer);
  JS_PROP(selfAddress);
  JS_PROP(class);
  JS_PROP(superclass);
  JS_PROP(metaclass);
  JS_PROP(className);
  JS_PROP(description);
  JS_PROP(debugDescription);
  JS_PROP(methods);
  JS_PROP(properties);
  JS_METHOD(invokeBooleanGetter);
  JS_METHOD(invokeBooleanSetter);
  JS_METHOD(invoke);

  id _self;
  id set_self(__weak id self);
  
  inline void wrap(v8::Local<v8::Object> handle) {
    Wrap(handle);
  }
  
  template<typename T>
  T self() {
    return (T)_self;
  }
  
  id self() {
    return _self;
  }
  
  template<typename T>
  T* As() {
    return self<T*>();
  }
  
  bool IsClass() {
    return object_isClass(self());
  }
  
  Class AsClass() {
    if (IsClass()) {
      return self<Class>();
    } else {
      return nullptr;
    }
  }
JS_WRAP_CLASS_END(id);

#define js_value_Class(x) js_value_wrapper(x, Class)
#define to_value_Class(x) to_value_wrapper(x, Class)
#define is_value_Class(x) is_value_wrapper(x, Class)

JS_WRAP_CLASS(Class, id);
JS_WRAP_CLASS_END(Class);

#define js_value_NSObject(x) js_value_wrapper(x, NSObject)
#define to_value_NSObject(x) to_value_wrapper(x, NSObject)
#define is_value_NSObject(x) is_value_wrapper(x, NSObject)

JS_WRAP_CLASS(NSObject, id);

  NSObject* SetNSObject(__weak NSObject* obj) {
    set_self(obj);
    return self<NSObject*>();
  }
  
  static void RegisterTypes(Local<Object> exports);
  static Nan::Persistent<FunctionTemplate>& GetNSObjectType(NSObject* obj, Nan::Persistent<FunctionTemplate>& unset);
JS_WRAP_CLASS_END(NSObject);

#endif /* NNSObject_h */
