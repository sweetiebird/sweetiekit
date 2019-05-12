//
//  NUICollectionViewCell.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewCell_h
#define NUICollectionViewCell_h

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUICollectionViewCell : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUICollectionViewCell();
  virtual ~NUICollectionViewCell();

  static NAN_METHOD(New);
  JS_PROP(ContentView);
  JS_PROP(BackgroundView);
  JS_PROP(SelectedBackgroundView);
  JS_PROP(IsSelected);
  JS_PROP(IsHighlighted);
};

#endif /* NUICollectionViewCell_h */
