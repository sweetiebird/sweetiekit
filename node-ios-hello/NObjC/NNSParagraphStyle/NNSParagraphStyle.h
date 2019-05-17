//
//  NNSParagraphStyle.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSParagraphStyle_h
#define NNSParagraphStyle_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NNSParagraphStyle : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSParagraphStyle();
  virtual ~NNSParagraphStyle();

  static NAN_METHOD(New);
  JS_PROP(lineSpacing);
};

#endif /* NNSParagraphStyle_h */
