//
//  NUICollectionViewTransitionLayout.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewTransitionLayout_h
#define NUICollectionViewTransitionLayout_h    

#include "NUICollectionViewLayout.h"

#define js_value_UICollectionViewTransitionLayout(x) js_value_wrapper(x, UICollectionViewTransitionLayout)
#define to_value_UICollectionViewTransitionLayout(x) to_value_wrapper(x, UICollectionViewTransitionLayout)
#define is_value_UICollectionViewTransitionLayout(x) is_value_wrapper(x, UICollectionViewTransitionLayout)

JS_WRAP_CLASS(UICollectionViewTransitionLayout, UICollectionViewLayout);
  JS_STATIC_METHOD(initWithCurrentLayoutNextLayout);
  JS_STATIC_METHOD(initWithCoder);
  JS_METHOD(updateValueForAnimatedKey);
  JS_METHOD(valueForAnimatedKey);
  JS_PROP(transitionProgress);
  JS_PROP_READONLY(currentLayout);
  JS_PROP_READONLY(nextLayout);
JS_WRAP_CLASS_END(UICollectionViewTransitionLayout);

#endif /* NUICollectionViewTransitionLayout_h */
