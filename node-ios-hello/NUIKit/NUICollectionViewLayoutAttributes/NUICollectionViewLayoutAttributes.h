//
//  NUICollectionViewLayoutAttributes.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewLayoutAttributes_h
#define NUICollectionViewLayoutAttributes_h    

#include "NNSObject.h"

#define js_value_UICollectionViewLayoutAttributes(x) js_value_wrapper(x, UICollectionViewLayoutAttributes)
#define to_value_UICollectionViewLayoutAttributes(x) to_value_wrapper(x, UICollectionViewLayoutAttributes)
#define is_value_UICollectionViewLayoutAttributes(x) is_value_wrapper(x, UICollectionViewLayoutAttributes)

#define js_value_UICollectionElementCategory(x) JS_ENUM(UICollectionElementCategory, NSUInteger, x)
#define to_value_UICollectionElementCategory(x) TO_ENUM(UICollectionElementCategory, NSUInteger, x)
#define is_value_UICollectionElementCategory(x) IS_ENUM(UICollectionElementCategory, NSUInteger, x)

JS_WRAP_CLASS(UICollectionViewLayoutAttributes, NSObject);
  JS_STATIC_METHOD(layoutAttributesForCellWithIndexPath);
  JS_STATIC_METHOD(layoutAttributesForSupplementaryViewOfKindWithIndexPath);
  JS_STATIC_METHOD(layoutAttributesForDecorationViewOfKindWithIndexPath);
  JS_PROP(frame);
  JS_PROP(center);
  JS_PROP(size);
  JS_PROP(transform3D);
  JS_PROP(bounds);
  JS_PROP(transform);
  JS_PROP(alpha);
  JS_PROP(zIndex);
  JS_PROP(isHidden);
  JS_PROP(indexPath);
  JS_PROP_READONLY(representedElementCategory);
  JS_PROP_READONLY(representedElementKind);

JS_WRAP_CLASS_END(UICollectionViewLayoutAttributes);

#endif /* NUICollectionViewLayoutAttributes_h */
