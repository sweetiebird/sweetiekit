//
//  NNSObject.h
//  node-ios-hello
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

@end

extern "C" void objc_callCallback(NSObject* obj);
#endif

using namespace v8;
using namespace node;

class NNSObject : public ObjectWrap {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSObject();
  virtual ~NNSObject();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  JS_PROP(class);
  JS_PROP(superclass);
  JS_PROP(metaclass);
  JS_PROP(className);
  JS_PROP(description);
  JS_PROP(debugDescription);
  JS_PROP(methods);
  JS_PROP(properties);
  static NAN_METHOD(invokeBooleanGetter);
  static NAN_METHOD(invokeBooleanSetter);
  static NAN_METHOD(invokeMethod);

  template<typename T>
  T* As() {
    return (T*)_NSObject;
  }
  
  bool IsClass() {
    return object_isClass(_NSObject);
  }
  
  Class AsClass() {
    if (IsClass()) {
      return (Class)_NSObject;
    } else {
      return nullptr;
    }
  }

  void SetNSObject(NSObject* obj);
  static Nan::Persistent<FunctionTemplate>& GetNSObjectType(NSObject* obj, Nan::Persistent<FunctionTemplate>& unset);
  
  virtual Nan::Persistent<FunctionTemplate>& GetDerivedType() { return type; }
  
private:
  NSObject* _NSObject;
  sweetiekit::JSFunction _callback;
};

#endif /* NNSObject_h */
