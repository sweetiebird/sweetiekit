//
//  NUICollectionView.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionView_h
#define NUICollectionView_h

#include "NUIScrollView.h"

#define js_value_UICollectionView(x) js_value_wrapper(x, UICollectionView)
#define to_value_UICollectionView(x) to_value_wrapper(x, UICollectionView)
#define is_value_UICollectionView(x) is_value_wrapper(x, UICollectionView)

#define js_value_UICollectionViewScrollPosition(x) JS_OPTS(UICollectionViewScrollPosition, NSUInteger, x)
#define to_value_UICollectionViewScrollPosition(x) TO_OPTS(UICollectionViewScrollPosition, NSUInteger, x)
#define is_value_UICollectionViewScrollPosition(x) IS_OPTS(UICollectionViewScrollPosition, NSUInteger, x)

#define js_value_UICollectionViewReorderingCadence(x) JS_ENUM(UICollectionViewReorderingCadence, NSInteger, x)
#define to_value_UICollectionViewReorderingCadence(x) TO_ENUM(UICollectionViewReorderingCadence, NSInteger, x)
#define is_value_UICollectionViewReorderingCadence(x) IS_ENUM(UICollectionViewReorderingCadence, NSInteger, x)

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
