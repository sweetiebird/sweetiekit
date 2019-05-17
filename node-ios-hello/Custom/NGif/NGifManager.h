//
//  NGifManager.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGifManager_h
#define NGifManager_h

using namespace v8;
using namespace node;

class NGifManager : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NGifManager();
  virtual ~NGifManager();

  static NAN_METHOD(New);
};

#endif /* NGifManager_h */
