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

- (void) associateValue:(id _Nullable )value withKey:(NSString * _Nonnull)aKey;
- (id _Nullable ) associatedValueForKey:(NSString * _Nonnull)aKey;
- (void) dissociateValueForKey:(NSString * _Nonnull)aKey;

@end

extern "C" void objc_callCallback(NSObject* _Nonnull obj);
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

  id _Nullable _self;
  id _Nullable set_self(__weak id _Nullable self);
  
  inline void wrap(v8::Local<v8::Object> handle) {
    Wrap(handle);
  }
  
  template<typename T>
  T self() {
    return (T)_self;
  }
  
  id _Nullable self() {
    return _self;
  }
  
  template<typename T>
  T* _Nullable As() {
    return self<T*>();  
  }
  
  bool IsClass() {
    return object_isClass(self());
  }
  
  Class _Nullable AsClass() {
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
  JS_METHOD(associatedValueForKey);
  JS_METHOD(associateValueWithKey);
  
  // NSKeyValueCoding.h
  
  JS_METHOD(valueForKey);
  JS_METHOD(setValueForKey);
  JS_METHOD(validateValueForKeyError);
  JS_METHOD(mutableArrayValueForKey);
  JS_METHOD(mutableOrderedSetValueForKey);
  JS_METHOD(mutableSetValueForKey);
  JS_METHOD(valueForKeyPath);
  JS_METHOD(setValueForKeyPath);
  JS_METHOD(validateValueForKeyPathError);
  JS_METHOD(mutableArrayValueForKeyPath);
  JS_METHOD(mutableOrderedSetValueForKeyPath);
  JS_METHOD(mutableSetValueForKeyPath);
  JS_METHOD(valueForUndefinedKey);
  JS_METHOD(setValueForUndefinedKey);
  JS_METHOD(setNilValueForKey);
  JS_METHOD(dictionaryWithValuesForKeys);
  JS_METHOD(setValuesForKeysWithDictionary);
#if TODO
// NSArray<ObjectType>
  JS_METHOD(valueForKey);
  JS_METHOD(setValueForKey);
// NSDictionary<KeyType
  JS_METHOD(valueForKey);
// NSMutableDictionary<KeyType
  JS_METHOD(setValueForKey);
// NSOrderedSet<ObjectType>
  JS_METHOD(valueForKey);
  JS_METHOD(setValueForKey);
// NSSet<ObjectType>
  JS_METHOD(valueForKey);
  JS_METHOD(setValueForKey);
#endif
// NSObject
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
  JS_STATIC_METHOD(useStoredAccessor);
  JS_METHOD(storedValueForKey);
  JS_METHOD(takeStoredValueForKey);
  JS_METHOD(takeValueForKey);
  JS_METHOD(takeValueForKeyPath);
  JS_METHOD(handleQueryWithUnboundKey);
  JS_METHOD(handleTakeValueForUnboundKey);
  JS_METHOD(unableToSetNilForKey);
  JS_METHOD(valuesForKeys);
  JS_METHOD(takeValuesFromDictionary);
#endif
#if TODO
  JS_STATIC_PROP_READONLY(accessInstanceVariablesDirectly);
#endif


  NSObject* _Nullable SetNSObject(__weak NSObject* _Nullable obj) {
    set_self(obj);
    return self<NSObject*>();
  }
  
  static void RegisterTypes(Local<Object> exports);
  static Nan::Persistent<FunctionTemplate>& GetNSObjectType(NSObject* _Nullable obj, Nan::Persistent<FunctionTemplate>& unset);
JS_WRAP_CLASS_END(NSObject);



// suppport for protocols

template <typename T> struct ObjCProtocolTraits;

#define JS_WRAP_PROTOCOL(name, base)     JS_WRAP_CLASS(name, base)
#define JS_WRAP_PROTOCOL_END(name, base) JS_WRAP_CLASS_END(name); \
\
extern Protocol* name##Protocol; \
\
template<> struct ObjCProtocolTraits< id<name> > { static Protocol* _Nonnull protocol() { return name##Protocol; } };


#define JS_INIT_PROTOCOL(name, base)     JS_INIT_CLASS_ALLOC(name, base, noop()); \
  name##Protocol = NSProtocolFromString(@#name)

#define JS_INIT_PROTOCOL_END(name, base) JS_INIT_CLASS_END(name, base); \
Protocol* name##Protocol


#define JS_UNWRAP_PROTOCOL(type, name) \
  JS_UNWRAP_(id, name##_); \
  id<type> name(name##_); \
  JS_UNUSED(name)

#define JS_UNWRAPPED_PROTOCOL(info, type, name) \
  JS_UNWRAPPED_(info, id, name##_); \
  id<type> name(name##_); \
  JS_UNUSED(name)

template<typename T>
Local<Value>
js_value_protocol(T x, Protocol* _Nullable protocol = ObjCProtocolTraits<T>::protocol())
{
  if (protocol && x && ![(NSObject *)x conformsToProtocol: protocol]) {
    return Nan::Undefined();
  }
  return js_value_id(x);
}

template<typename T, typename K>
T
to_value_protocol(K value, bool* _Nullable failed = nullptr, Protocol* _Nullable protocol = ObjCProtocolTraits<T>::protocol())
{
  if (failed) {
    *failed = false;
  }
  if (protocol) {
    JS_UNWRAPPED(value, NSObject, self);
    if ([self conformsToProtocol: protocol]) {
      T result(static_cast< T >(self));
      return result;
    }
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
is_value_protocol(Local<Value> x, Protocol* _Nullable protocol = ObjCProtocolTraits<T>::protocol()) {
  if (!is_value_id(x)) {
    return false;
  }
  JS_UNWRAPPED_(x, id, self);
  if (protocol && ![self conformsToProtocol: protocol]) {
    return false;
  }
  return true;
}

#define js_protocol_wrapper(x, type) js_value_protocol< id<type> >(x)
#define to_protocol_wrapper(x, type) to_value_protocol< id<type> >(x)
#define is_protocol_wrapper(x, type) is_value_protocol< id<type> >(x)


#endif /* NNSObject_h */
