//
//  NUISlider.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISlider_h
#define NUISlider_h

#import <UIKit/UIKit.h>
#include "NUIControl.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUISlider : public NUIControl {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUISlider();
  virtual ~NUISlider();

  static NAN_METHOD(New);
  static NAN_METHOD(SetValue);
  JS_PROP(Value);
  static NAN_METHOD(setThumbImage);
  JS_PROP(currentThumbImage);
  JS_PROP(thumbTintColor);
};

#endif /* NUISlider_h */
