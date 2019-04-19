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

  void SetNSObject(NSObject* obj) {
    _NSObject = obj;
  }
private:
  NSObject* _NSObject;
};

#endif /* NNSObject_h */
