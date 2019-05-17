//
//  NUIFont.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFont_h
#define NUIFont_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIFont : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIFont();
  virtual ~NUIFont();

  static NAN_METHOD(New);
  static NAN_METHOD(systemFont);
  static NAN_METHOD(boldSystemFont);
  static NAN_METHOD(italicSystemFont);
};

#endif /* NUIFont_h */
