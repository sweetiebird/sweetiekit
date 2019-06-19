//
//  NUICollectionViewManager.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewManager_h
#define NUICollectionViewManager_h

#include "NNSObject.h"

#define js_value_UICollectionViewManager(x) js_value_wrapper(x, UICollectionViewManager)
#define to_value_UICollectionViewManager(x) to_value_wrapper(x, UICollectionViewManager)
#define is_value_UICollectionViewManager(x) is_value_wrapper(x, UICollectionViewManager)

JS_WRAP_CLASS(UICollectionViewManager, NSObject);
  JS_PROP(didSelectItemAt);
  JS_PROP(didDeselectItemAt);
  JS_PROP(shouldSelectItemAt);
  JS_PROP(shouldDeselectItemAt);
  
  JS_PROP(didHighlightItemAt);
  JS_PROP(didUnhighlightItemAt);
  JS_PROP(shouldHighlightItemAt);
  JS_PROP(shouldUnhighlightItemAt);
  
  sweetiekit::JSFunction _numberItemsInSection;
  sweetiekit::JSFunction _cellForItemAt;
JS_WRAP_CLASS_END(UICollectionViewManager);

#if __OBJC__
typedef SUICollectionViewManager UICollectionViewManager;
#endif

#endif /* NUICollectionViewManager_h */
