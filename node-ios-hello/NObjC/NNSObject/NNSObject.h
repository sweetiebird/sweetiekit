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

#define js_value_NSSearchPathDirectory(x) JS_ENUM(NSSearchPathDirectory, NSUInteger, x)
#define to_value_NSSearchPathDirectory(x) TO_ENUM(NSSearchPathDirectory, NSUInteger, x)
#define is_value_NSSearchPathDirectory(x) IS_ENUM(NSSearchPathDirectory, NSUInteger, x)

#define js_value_NSSearchPathDomainMask(x) JS_ENUM(NSSearchPathDomainMask, NSUInteger, x)
#define to_value_NSSearchPathDomainMask(x) TO_ENUM(NSSearchPathDomainMask, NSUInteger, x)
#define is_value_NSSearchPathDomainMask(x) IS_ENUM(NSSearchPathDomainMask, NSUInteger, x)

JS_WRAP_CLASS(id, ObjectWrap);
  JS_METHOD(_NSClassFromString);
  JS_METHOD(_objc_msgSend);
  JS_METHOD(_NSSearchPathForDirectoriesInDomains);
  
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



// suppport for protocols

template <typename T> struct ObjCProtocolTraits;

#define JS_WRAP_PROTOCOL(name, base)     JS_WRAP_CLASS(name, base)
#define JS_WRAP_PROTOCOL_END(name, base) JS_WRAP_CLASS_END(name); \
\
extern Protocol* name##Protocol; \
\
template<> struct ObjCProtocolTraits< id<name> > { static Protocol* protocol() { return name##Protocol; } };


#define JS_INIT_PROTOCOL(name, base)     JS_INIT_CLASS(name, base) \
  name##Protocol = NSProtocolFromString(@#name);

#define JS_INIT_PROTOCOL_END(name, base) JS_INIT_CLASS_END(name, base) \
Protocol* name##Protocol;


template<typename T>
Local<Value>
js_value_protocol(T x, Protocol* protocol = ObjCProtocolTraits<T>::protocol())
{
  if (protocol && x && ![x conformsToProtocol: protocol]) {
    return Nan::Undefined();
  }
  return js_value_id(x);
}

template<typename T, typename K>
T
to_value_protocol(K self, bool* failed = nullptr, Protocol* protocol = ObjCProtocolTraits<T>::protocol())
{
  if (failed) {
    *failed = false;
  }
  if (!protocol || [self conformsToProtocol: protocol]) {
    T result(static_cast< T >(self));
    return result;
  }
  if (failed) {
    *failed = true;
  } else {
    js_panic_noreturn("Failed to cast as protocol");
  }
  return nil;
}

template<typename T>
bool
is_value_protocol(Local<Value> x, Protocol* protocol = ObjCProtocolTraits<T>::protocol()) {
  if (!is_value_id(x)) {
    return false;
  }
  JS_UNWRAPPED_(x, id, self);
  if (protocol && ![self conformsToProtocol: protocol]) {
    return false;
  }
  return true;
}

#define js_protocol_wrapper(x, type, base) js_value_protocol<type>(x)
#define to_protocol_wrapper(x, type, base) to_value_protocol<type>(x)
#define is_protocol_wrapper(x, type, base) is_value_protocol<type>(x)



#endif /* NNSObject_h */
