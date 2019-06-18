//
//  NUICollectionViewLayoutInvalidationContext.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewLayoutInvalidationContext_h
#define NUICollectionViewLayoutInvalidationContext_h    

#include "NNSObject.h"

#define js_value_UICollectionViewLayoutInvalidationContext(x) js_value_wrapper(x, UICollectionViewLayoutInvalidationContext)
#define to_value_UICollectionViewLayoutInvalidationContext(x) to_value_wrapper(x, UICollectionViewLayoutInvalidationContext)
#define is_value_UICollectionViewLayoutInvalidationContext(x) is_value_wrapper(x, UICollectionViewLayoutInvalidationContext)

JS_WRAP_CLASS(UICollectionViewLayoutInvalidationContext, NSObject);
  JS_METHOD(invalidateItemsAtIndexPaths);
  JS_METHOD(invalidateSupplementaryElementsOfKindAtIndexPaths);
  JS_METHOD(invalidateDecorationElementsOfKindAtIndexPaths);
  JS_PROP_READONLY(invalidateEverything);
  JS_PROP_READONLY(invalidateDataSourceCounts);
  JS_PROP_READONLY(invalidatedItemIndexPaths);
  JS_PROP_READONLY(invalidatedSupplementaryIndexPaths);
  JS_PROP_READONLY(invalidatedDecorationIndexPaths);
  JS_PROP(contentOffsetAdjustment);
  JS_PROP(contentSizeAdjustment);
  JS_PROP_READONLY(previousIndexPathsForInteractivelyMovingItems);
  JS_PROP_READONLY(targetIndexPathsForInteractivelyMovingItems);
  JS_PROP_READONLY(interactiveMovementTarget);
JS_WRAP_CLASS_END(UICollectionViewLayoutInvalidationContext);

#endif /* NUICollectionViewLayoutInvalidationContext_h */
