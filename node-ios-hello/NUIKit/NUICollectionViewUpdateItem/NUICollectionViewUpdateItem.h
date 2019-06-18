//
//  NUICollectionViewUpdateItem.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewUpdateItem_h
#define NUICollectionViewUpdateItem_h    

#include "NNSObject.h"

#define js_value_UICollectionViewUpdateItem(x) js_value_wrapper(x, UICollectionViewUpdateItem)
#define to_value_UICollectionViewUpdateItem(x) to_value_wrapper(x, UICollectionViewUpdateItem)
#define is_value_UICollectionViewUpdateItem(x) is_value_wrapper(x, UICollectionViewUpdateItem)

#define js_value_UICollectionUpdateAction(x) JS_ENUM(UICollectionUpdateAction, NSInteger, x)
#define to_value_UICollectionUpdateAction(x) TO_ENUM(UICollectionUpdateAction, NSInteger, x)
#define is_value_UICollectionUpdateAction(x) IS_ENUM(UICollectionUpdateAction, NSInteger, x)

JS_WRAP_CLASS(UICollectionViewUpdateItem, NSObject);
  JS_PROP_READONLY(indexPathBeforeUpdate);
  JS_PROP_READONLY(indexPathAfterUpdate);
  JS_PROP_READONLY(updateAction);
JS_WRAP_CLASS_END(UICollectionViewUpdateItem);

#endif /* NUICollectionViewUpdateItem_h */
