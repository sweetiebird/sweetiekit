//
//  NUICollectionReusableView.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/16/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionReusableView_h
#define NUICollectionReusableView_h    

#include "NUIView.h"

#define js_value_UICollectionReusableView(x) js_value_wrapper(x, UICollectionReusableView)
#define to_value_UICollectionReusableView(x) to_value_wrapper(x, UICollectionReusableView)
#define is_value_UICollectionReusableView(x) is_value_wrapper(x, UICollectionReusableView)

JS_WRAP_CLASS(UICollectionReusableView, UIView);
  JS_PROP(reuseIdentifier);
JS_WRAP_CLASS_END(UICollectionReusableView);

#endif /* NUICollectionReusableView_h */
