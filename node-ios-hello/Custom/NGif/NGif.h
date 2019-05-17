//
//  NGif.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGif_h
#define NGif_h

#import <UIKit/UIKit.h>
#include "NUIImage.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NGif : public NUIImage {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NGif();
  virtual ~NGif();

  static NAN_METHOD(New);
};

#endif /* NGif_h */
