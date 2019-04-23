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

@interface NSObject (CategoryNSObject)

- (void) associateValue:(id)value withKey:(NSString *)aKey;
- (id) associatedValueForKey:(NSString *)aKey;

@end

@interface NSInvocation (CategoryNSInvocation)

+ (NSInvocation *) invocationWithTarget:(id)aTarget block:(void (^)(id target))block;
+ (NSInvocation *) invocationWithSelector:(SEL)aSelector forTarget:(id)aTarget;
+ (NSInvocation *) invocationWithSelector:(SEL)aSelector andObject:(__autoreleasing id)anObject forTarget:(id)aTarget;

@end

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

  template<typename T>
  T* As() {
    return (T*)_NSObject;
  }

  void SetNSObject(NSObject* obj);
  static Nan::Persistent<FunctionTemplate>& GetNSObjectType(NSObject* obj, Nan::Persistent<FunctionTemplate>& unset);
  
  virtual Nan::Persistent<FunctionTemplate>& GetDerivedType() { return type; }
  
private:
  NSObject* _NSObject;
};

#endif /* NNSObject_h */
