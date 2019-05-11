//
//  NNSBundle.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSBundle_h
#define NNSBundle_h

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

using namespace v8;
using namespace node;

class NNSBundle : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSBundle();
  virtual ~NNSBundle();

  static NAN_METHOD(New);
  static NAN_METHOD(PathForResource);
  static NAN_METHOD(Main);
};

#endif /* NNSBundle_h */
