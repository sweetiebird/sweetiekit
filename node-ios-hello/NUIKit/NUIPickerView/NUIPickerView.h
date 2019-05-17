//
//  NUIPickerView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPickerView_h
#define NUIPickerView_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIPickerView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIPickerView();
  virtual ~NUIPickerView();

  static NAN_METHOD(New);
  JS_PROP(delegate);
  JS_PROP(dataSource);
  
  Nan::Persistent<Value> _dataSource;
  Nan::Persistent<Value> _delegate;
};

#endif /* NUIPickerView_h */
