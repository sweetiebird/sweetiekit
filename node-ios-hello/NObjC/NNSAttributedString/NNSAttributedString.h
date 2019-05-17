//
//  NNSAttributedString.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSAttributedString_h
#define NNSAttributedString_h    

#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NNSAttributedString : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSAttributedString();
  virtual ~NNSAttributedString();

  static NAN_METHOD(New);
};

#endif /* NNSAttributedString_h */
