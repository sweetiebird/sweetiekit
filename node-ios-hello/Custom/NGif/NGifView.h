//
//  NGifView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGifView_h
#define NGifView_h

#import <UIKit/UIKit.h>
#include "NUIImageView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NGifView : public NUIImageView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NGifView();
  virtual ~NGifView();

  static NAN_METHOD(New);
  static NAN_METHOD(setGifImage);
};

#endif /* NGifView_h */
