//
//  NUIStackView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStackView_h
#define NUIStackView_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIStackView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIStackView();
  virtual ~NUIStackView();

  static NAN_METHOD(New);
  static NAN_METHOD(addArrangedSubview);
  static NAN_METHOD(insertArrangedSubview);
  static NAN_METHOD(removeArrangedSubview);
  JS_PROP(arrangedSubviews);
  JS_PROP(axis);
  JS_PROP(distribution);
  JS_PROP(alignment);
};

#endif /* NUIStackView_h */
