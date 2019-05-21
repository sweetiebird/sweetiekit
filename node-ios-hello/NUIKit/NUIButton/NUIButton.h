//
//  NUIButton.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIButton_h
#define NUIButton_h

#import <UIKit/UIKit.h>
#include "NUIControl.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIButton : public NUIControl {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIButton();
  virtual ~NUIButton();

  static NAN_METHOD(New);
  static NAN_METHOD(Alloc);
  static NAN_METHOD(setTitleColorForState);
  static NAN_METHOD(setTitleForState);

  JS_PROP(Title);
  JS_PROP(Callback);
  JS_PROP(titleLabel);
  JS_PROP(titleEdgeInsets);
  JS_PROP(contentEdgeInsets);
  JS_PROP(imageEdgeInsets);
  Nan::Persistent<Function>* _callback;
};

//#include "NUIControl.h"
//
//JS_WRAP_CLASS(UIButton, UIControl);
//  static NAN_METHOD(Alloc);
//  static NAN_METHOD(setTitleColorForState);
//  static NAN_METHOD(setTitleForState);
//  JS_PROP(Title);
//  JS_PROP(Callback);
//  JS_PROP(titleLabel);
//  Nan::Persistent<Function>* _callback;
//JS_WRAP_CLASS_END(UIButton);

#endif /* NUIButton_h */
