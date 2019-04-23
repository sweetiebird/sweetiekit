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
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITableView : public NUIViewController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITableView();
  virtual ~NUITableView();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(DequeueReusableCell);
};


#endif /* NUITableView_h */
