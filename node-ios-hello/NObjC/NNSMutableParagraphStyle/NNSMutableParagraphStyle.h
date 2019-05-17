//
//  NNSMutableParagraphStyle.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMutableParagraphStyle_h
#define NNSMutableParagraphStyle_h    

#import <UIKit/UIKit.h>
#include "NNSParagraphStyle.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NNSMutableParagraphStyle : public NNSParagraphStyle {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSMutableParagraphStyle();
  virtual ~NNSMutableParagraphStyle();

  static NAN_METHOD(New);
  JS_PROP(lineSpacing);
};

#endif /* NNSMutableParagraphStyle_h */
