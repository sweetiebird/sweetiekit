//
//  NUICollectionViewLayout.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewLayout_h
#define NUICollectionViewLayout_h    

#include "NNSObject.h"

#define js_value_UICollectionViewLayout(x) js_value_wrapper(x, UICollectionViewLayout)
#define to_value_UICollectionViewLayout(x) to_value_wrapper(x, UICollectionViewLayout)
#define is_value_UICollectionViewLayout(x) is_value_wrapper(x, UICollectionViewLayout)

JS_WRAP_CLASS(UICollectionViewLayout, NSObject);
  JS_STATIC_METHOD(layoutAttributesClass);
  JS_STATIC_METHOD(invalidationContextClass);
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithCoder);
  JS_METHOD(invalidateLayout);
  JS_METHOD(invalidateLayoutWithContext);
  JS_METHOD(registerClassForDecorationViewOfKind);
  JS_METHOD(registerNibForDecorationViewOfKind);
  JS_METHOD(prepareLayout);
  JS_METHOD(layoutAttributesForElementsInRect);
  JS_METHOD(layoutAttributesForItemAtIndexPath);
  JS_METHOD(layoutAttributesForSupplementaryViewOfKindAtIndexPath);
  JS_METHOD(layoutAttributesForDecorationViewOfKindAtIndexPath);
  JS_METHOD(shouldInvalidateLayoutForBoundsChange);
  JS_METHOD(invalidationContextForBoundsChange);
  JS_METHOD(shouldInvalidateLayoutForPreferredLayoutAttributesWithOriginalAttributes);
  JS_METHOD(invalidationContextForPreferredLayoutAttributesWithOriginalAttributes);
  JS_METHOD(targetContentOffsetForProposedContentOffsetWithScrollingVelocity);
  JS_METHOD(targetContentOffsetForProposedContentOffset);
  JS_METHOD(collectionViewContentSize);
  JS_METHOD(prepareForCollectionViewUpdates);
  JS_METHOD(finalizeCollectionViewUpdates);
  JS_METHOD(prepareForAnimatedBoundsChange);
  JS_METHOD(finalizeAnimatedBoundsChange);
  JS_METHOD(prepareForTransitionToLayout);
  JS_METHOD(prepareForTransitionFromLayout);
  JS_METHOD(finalizeLayoutTransition);
  JS_METHOD(initialLayoutAttributesForAppearingItemAtIndexPath);
  JS_METHOD(finalLayoutAttributesForDisappearingItemAtIndexPath);
  JS_METHOD(initialLayoutAttributesForAppearingSupplementaryElementOfKindAtIndexPath);
  JS_METHOD(finalLayoutAttributesForDisappearingSupplementaryElementOfKindAtIndexPath);
  JS_METHOD(initialLayoutAttributesForAppearingDecorationElementOfKindAtIndexPath);
  JS_METHOD(finalLayoutAttributesForDisappearingDecorationElementOfKindAtIndexPath);
  JS_METHOD(indexPathsToDeleteForSupplementaryViewOfKind);
  JS_METHOD(indexPathsToDeleteForDecorationViewOfKind);
  JS_METHOD(indexPathsToInsertForSupplementaryViewOfKind);
  JS_METHOD(indexPathsToInsertForDecorationViewOfKind);
  JS_METHOD(targetIndexPathForInteractivelyMovingItemWithPosition);
  JS_METHOD(layoutAttributesForInteractivelyMovingItemAtIndexPathWithTargetPosition);
  JS_METHOD(invalidationContextForInteractivelyMovingItemsWithTargetPositionPreviousIndexPathsPreviousPosition);
  JS_METHOD(invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPathsPreviousIndexPathsMovementCancelled);
  JS_PROP_READONLY(collectionView);
  JS_STATIC_PROP_READONLY(layoutAttributesClass);
  JS_STATIC_PROP_READONLY(invalidationContextClass);
  JS_PROP_READONLY(collectionViewContentSize);
  JS_PROP_READONLY(developmentLayoutDirection);
  JS_PROP_READONLY(flipsHorizontallyInOppositeLayoutDirection);
JS_WRAP_CLASS_END(UICollectionViewLayout);

#endif /* NUICollectionViewLayout_h */
