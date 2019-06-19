//
//  NUICollectionViewController.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewController_h
#define NUICollectionViewController_h

#include "NUIViewController.h"

#define js_value_UICollectionViewController(x) js_value_wrapper(x, UICollectionViewController)
#define to_value_UICollectionViewController(x) to_value_wrapper(x, UICollectionViewController)
#define is_value_UICollectionViewController(x) is_value_wrapper(x, UICollectionViewController)

JS_WRAP_CLASS(UICollectionViewController, UIViewController);
  JS_METHOD(initWithCollectionViewLayout);
  JS_METHOD(initWithNibNameBundle);
  JS_METHOD(initWithCoder);
  JS_PROP(collectionView);
  JS_PROP(clearsSelectionOnViewWillAppear);
  JS_PROP(useLayoutToLayoutNavigationTransitions);
  JS_PROP_READONLY(collectionViewLayout);
  JS_PROP(installsStandardGestureForInteractiveMovement);
JS_WRAP_CLASS_END(UICollectionViewController);

#endif /* NUICollectionViewController_h */
