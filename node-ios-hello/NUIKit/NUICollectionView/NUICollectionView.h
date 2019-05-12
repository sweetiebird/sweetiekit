//
//  NUICollectionView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionView_h
#define NUICollectionView_h

#import <UIKit/UIKit.h>
#include "NUIScrollView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUICollectionView : public NUIScrollView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUICollectionView();
  virtual ~NUICollectionView();

  static NAN_METHOD(New);
  static NAN_METHOD(RegisterNibForCellWithReuseIdentifier);
  static NAN_METHOD(ScrollToItemAtIndexPath);
  JS_PROP(BackgroundView);
  JS_PROP(VisibleCells);
  JS_PROP(IndexPathsForSelectedItems);
};

#endif /* NUICollectionView_h */
