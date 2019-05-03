//
//  NUITableView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableView_h
#define NUITableView_h

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITableView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITableView();
  virtual ~NUITableView();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(DequeueReusableCell);
  static NAN_METHOD(DequeueReusableCellWithIdentifierForIndexPath);
  JS_PROP(DataSource);
  JS_PROP(RowHeight);
  JS_PROP(EstimatedRowHeight);
  JS_PROP(RefreshControl);
  static NAN_METHOD(ReloadData);


  Nan::Persistent<Value> _dataSource;
};


#endif /* NUITableView_h */
