//
//  NUIScrollView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScrollView_h
#define NUIScrollView_h

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIScrollView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIScrollView();
  virtual ~NUIScrollView();

  static NAN_METHOD(New);
  static NAN_METHOD(setContentOffset);
  
  JS_PROP(delegate);
  JS_PROP(contentOffset);
  JS_PROP(contentSize);
  
  Nan::Persistent<Value> _delegate;
};

#endif /* NUIScrollView_h */
