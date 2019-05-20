//
//  NUITapGestureRecognizer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITapGestureRecognizer_h
#define NUITapGestureRecognizer_h    

#import <UIKit/UIKit.h>
#include "NUIGestureRecognizer.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITapGestureRecognizer : public NUIGestureRecognizer {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITapGestureRecognizer();
  virtual ~NUITapGestureRecognizer();

  static NAN_METHOD(New);
};

#endif /* NUITapGestureRecognizer_h */