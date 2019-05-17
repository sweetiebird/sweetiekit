//
//  NNSMutableAttributedString.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMutableAttributedString_h
#define NNSMutableAttributedString_h    

#import <UIKit/UIKit.h>
#include "NNSAttributedString.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NNSMutableAttributedString : public NNSAttributedString {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSMutableAttributedString();
  virtual ~NNSMutableAttributedString();

  static NAN_METHOD(New);
  static NAN_METHOD(addAttribute);
};

#endif /* NNSMutableAttributedString_h */
