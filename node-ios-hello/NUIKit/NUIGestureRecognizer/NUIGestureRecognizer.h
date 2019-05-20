//
//  NUIGestureRecognizer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIGestureRecognizer_h
#define NUIGestureRecognizer_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIGestureRecognizer : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIGestureRecognizer();
  virtual ~NUIGestureRecognizer();

  static NAN_METHOD(New);
  static NAN_METHOD(addTarget);
};

#endif /* NUIGestureRecognizer_h */
