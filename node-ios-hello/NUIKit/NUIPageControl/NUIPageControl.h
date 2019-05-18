//
//  NUIPageControl.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPageControl_h
#define NUIPageControl_h    

#import <UIKit/UIKit.h>
#include "NUIControl.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIPageControl : public NUIControl {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIPageControl();
  virtual ~NUIPageControl();

  static NAN_METHOD(New);
  static NAN_METHOD(sizeForNumberOfPages);

  JS_PROP(currentPage);
  JS_PROP(numberOfPages);
  JS_PROP(pageIndicatorTintColor);
  JS_PROP(currentPageIndicatorTintColor);
};

#endif /* NUIPageControl_h */
