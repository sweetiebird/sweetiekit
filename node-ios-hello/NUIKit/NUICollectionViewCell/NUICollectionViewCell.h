//
//  NUICollectionViewCell.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewCell_h
#define NUICollectionViewCell_h

#include "NUICollectionReusableView.h"

#define js_value_UICollectionViewCell(x) js_value_wrapper(x, UICollectionViewCell)
#define to_value_UICollectionViewCell(x) to_value_wrapper(x, UICollectionViewCell)
#define is_value_UICollectionViewCell(x) is_value_wrapper(x, UICollectionViewCell)

JS_WRAP_CLASS(UICollectionViewCell, UICollectionReusableView);
  JS_PROP(ContentView);
  JS_PROP(BackgroundView);
  JS_PROP(SelectedBackgroundView);
  JS_PROP(IsSelected);
  JS_PROP(IsHighlighted);
JS_WRAP_CLASS_END(UICollectionViewCell);

#endif /* NUICollectionViewCell_h */
