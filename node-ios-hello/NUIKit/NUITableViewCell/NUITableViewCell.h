
//
//  NUITableViewCell.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewCell_h
#define NUITableViewCell_h

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITableViewCell : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITableViewCell();
  virtual ~NUITableViewCell();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  JS_PROP(TextLabel);
  JS_PROP(DetailTextLabel);
  JS_PROP(IsEditing);
  JS_PROP(IsSelected);
};

#endif /* NUITableViewCell_h */
