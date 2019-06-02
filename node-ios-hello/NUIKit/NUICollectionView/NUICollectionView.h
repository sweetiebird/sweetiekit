//
//  NUICollectionView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionView_h
#define NUICollectionView_h

#include "NUIScrollView.h"

#define js_value_UIScrollView(x) js_value_wrapper(x, UIScrollView)
#define to_value_UIScrollView(x) to_value_wrapper(x, UIScrollView)
#define is_value_UIScrollView(x) is_value_wrapper(x, UIScrollView)

JS_WRAP_CLASS(UICollectionView, UIScrollView);
  JS_METHOD(RegisterNibForCellWithReuseIdentifier);
  JS_METHOD(ScrollToItemAtIndexPath);
  JS_METHOD(ReloadData);
  JS_METHOD(DequeueReusableCellWithReuseIdentifier);
  JS_PROP(Delegate);
  JS_PROP(DataSource);
  JS_PROP(BackgroundView);
  JS_PROP(VisibleCells);
  JS_PROP(IndexPathsForSelectedItems);
  
  Nan::Persistent<Value> _dataSource;
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(UICollectionView);

#endif /* NUICollectionView_h */
