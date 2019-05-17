//
//  NUITableViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/20/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewController_h
#define NUITableViewController_h

#import <UIKit/UIKit.h>
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITableViewController : public NUIViewController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITableViewController();
  virtual ~NUITableViewController();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
};

#endif /* NUITableViewController_h */
