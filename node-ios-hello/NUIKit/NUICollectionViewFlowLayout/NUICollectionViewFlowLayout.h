//
//  NUICollectionViewFlowLayout.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewFlowLayout_h
#define NUICollectionViewFlowLayout_h    

#include "NUICollectionViewLayout.h"

#define js_value_UICollectionViewFlowLayout(x) js_value_wrapper(x, UICollectionViewFlowLayout)
#define to_value_UICollectionViewFlowLayout(x) to_value_wrapper(x, UICollectionViewFlowLayout)
#define is_value_UICollectionViewFlowLayout(x) is_value_wrapper(x, UICollectionViewFlowLayout)

#define js_value_UICollectionViewScrollDirection(x) JS_ENUM(UICollectionViewScrollDirection, NSInteger, x)
#define to_value_UICollectionViewScrollDirection(x) TO_ENUM(UICollectionViewScrollDirection, NSInteger, x)
#define is_value_UICollectionViewScrollDirection(x) IS_ENUM(UICollectionViewScrollDirection, NSInteger, x)

#define js_value_UICollectionViewFlowLayoutSectionInsetReference(x) JS_ENUM(UICollectionViewFlowLayoutSectionInsetReference, NSInteger, x)
#define to_value_UICollectionViewFlowLayoutSectionInsetReference(x) TO_ENUM(UICollectionViewFlowLayoutSectionInsetReference, NSInteger, x)
#define is_value_UICollectionViewFlowLayoutSectionInsetReference(x) IS_ENUM(UICollectionViewFlowLayoutSectionInsetReference, NSInteger, x)

JS_WRAP_CLASS(UICollectionViewFlowLayout, UICollectionViewLayout);
#if TODO
// UICollectionViewDelegateFlowLayout
  JS_METHOD(collectionViewLayoutSizeForItemAtIndexPath);
  JS_METHOD(collectionViewLayoutInsetForSectionAtIndex);
  JS_METHOD(collectionViewLayoutMinimumLineSpacingForSectionAtIndex);
  JS_METHOD(collectionViewLayoutMinimumInteritemSpacingForSectionAtIndex);
  JS_METHOD(collectionViewLayoutReferenceSizeForHeaderInSection);
  JS_METHOD(collectionViewLayoutReferenceSizeForFooterInSection);
#endif
// UICollectionViewFlowLayout
  JS_PROP(minimumLineSpacing);
  JS_PROP(minimumInteritemSpacing);
  JS_PROP(itemSize);
  JS_PROP(estimatedItemSize);
  JS_PROP(scrollDirection);
  JS_PROP(headerReferenceSize);
  JS_PROP(footerReferenceSize);
  JS_PROP(sectionInset);
  JS_PROP(sectionInsetReference);
  JS_PROP(sectionHeadersPinToVisibleBounds);
  JS_PROP(sectionFootersPinToVisibleBounds);
JS_WRAP_CLASS_END(UICollectionViewFlowLayout);

#endif /* NUICollectionViewFlowLayout_h */
