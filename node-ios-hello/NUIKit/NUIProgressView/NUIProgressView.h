//
//  NUIProgressView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIProgressView_h
#define NUIProgressView_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIProgressView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIProgressView();
  virtual ~NUIProgressView();

  static NAN_METHOD(New);
  static NAN_METHOD(setProgress);
  JS_PROP(progress);
  JS_PROP(progressTintColor);
  JS_PROP(trackTintColor);
};

#endif /* NUIProgressView_h */
