//
//  NUICollectionViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewController_h
#define NUICollectionViewController_h

#import <UIKit/UIKit.h>
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUICollectionViewController : public NUIViewController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUICollectionViewController();
  virtual ~NUICollectionViewController();

  static NAN_METHOD(New);
};

#endif /* NUICollectionViewController_h */
