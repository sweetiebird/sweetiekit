//
//  NSKView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKView_h
#define NSKView_h

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKView();
  virtual ~NSKView();

  static NAN_METHOD(New);
};

#endif /* NSKView_h */
