//
//  NUIScrollViewDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScrollViewDelegate_h
#define NUIScrollViewDelegate_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIScrollViewDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIScrollViewDelegate();
  virtual ~NUIScrollViewDelegate();

  static NAN_METHOD(New);

  JS_PROP(didScroll);
  JS_PROP(didScrollToTop);
  JS_PROP(shouldScrollToTop);

  sweetiekit::JSFunction _didScroll;
  sweetiekit::JSFunction _didScrollToTop;
  sweetiekit::JSFunction _shouldScrollToTop;
};

#endif /* NUIScrollViewDelegate_h */