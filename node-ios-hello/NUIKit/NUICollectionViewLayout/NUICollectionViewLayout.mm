//
//  NUICollectionViewLayout.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewLayout.h"

#define instancetype UICollectionViewLayout
#define js_value_instancetype js_value_UICollectionViewLayout

NUICollectionViewLayout::NUICollectionViewLayout() {}
NUICollectionViewLayout::~NUICollectionViewLayout() {}

JS_INIT_CLASS(UICollectionViewLayout, NSObject);
  JS_ASSIGN_STATIC_METHOD(layoutAttributesClass);
  JS_ASSIGN_STATIC_METHOD(invalidationContextClass);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(invalidateLayout);
  JS_ASSIGN_PROTO_METHOD(invalidateLayoutWithContext);
  JS_ASSIGN_PROTO_METHOD(registerClassForDecorationViewOfKind);
  JS_ASSIGN_PROTO_METHOD(registerNibForDecorationViewOfKind);
  JS_ASSIGN_PROTO_METHOD(prepareLayout);
  JS_ASSIGN_PROTO_METHOD(layoutAttributesForElementsInRect);
  JS_ASSIGN_PROTO_METHOD(layoutAttributesForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(layoutAttributesForSupplementaryViewOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(layoutAttributesForDecorationViewOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(shouldInvalidateLayoutForBoundsChange);
  JS_ASSIGN_PROTO_METHOD(invalidationContextForBoundsChange);
  JS_ASSIGN_PROTO_METHOD(shouldInvalidateLayoutForPreferredLayoutAttributesWithOriginalAttributes);
  JS_ASSIGN_PROTO_METHOD(invalidationContextForPreferredLayoutAttributesWithOriginalAttributes);
  JS_ASSIGN_PROTO_METHOD(targetContentOffsetForProposedContentOffsetWithScrollingVelocity);
  JS_ASSIGN_PROTO_METHOD(targetContentOffsetForProposedContentOffset);
  JS_ASSIGN_PROTO_METHOD(collectionViewContentSize);
  JS_ASSIGN_PROTO_METHOD(prepareForCollectionViewUpdates);
  JS_ASSIGN_PROTO_METHOD(finalizeCollectionViewUpdates);
  JS_ASSIGN_PROTO_METHOD(prepareForAnimatedBoundsChange);
  JS_ASSIGN_PROTO_METHOD(finalizeAnimatedBoundsChange);
  JS_ASSIGN_PROTO_METHOD(prepareForTransitionToLayout);
  JS_ASSIGN_PROTO_METHOD(prepareForTransitionFromLayout);
  JS_ASSIGN_PROTO_METHOD(finalizeLayoutTransition);
  JS_ASSIGN_PROTO_METHOD(initialLayoutAttributesForAppearingItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(finalLayoutAttributesForDisappearingItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(initialLayoutAttributesForAppearingSupplementaryElementOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(finalLayoutAttributesForDisappearingSupplementaryElementOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(initialLayoutAttributesForAppearingDecorationElementOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(finalLayoutAttributesForDisappearingDecorationElementOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(indexPathsToDeleteForSupplementaryViewOfKind);
  JS_ASSIGN_PROTO_METHOD(indexPathsToDeleteForDecorationViewOfKind);
  JS_ASSIGN_PROTO_METHOD(indexPathsToInsertForSupplementaryViewOfKind);
  JS_ASSIGN_PROTO_METHOD(indexPathsToInsertForDecorationViewOfKind);
  JS_ASSIGN_PROTO_METHOD(targetIndexPathForInteractivelyMovingItemWithPosition);
  JS_ASSIGN_PROTO_METHOD(layoutAttributesForInteractivelyMovingItemAtIndexPathWithTargetPosition);
  JS_ASSIGN_PROTO_METHOD(invalidationContextForInteractivelyMovingItemsWithTargetPositionPreviousIndexPathsPreviousPosition);
  JS_ASSIGN_PROTO_METHOD(invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPathsPreviousIndexPathsMovementCancelled);
  JS_ASSIGN_PROTO_PROP_READONLY(collectionView);
  JS_ASSIGN_STATIC_PROP_READONLY(layoutAttributesClass);
  JS_ASSIGN_STATIC_PROP_READONLY(invalidationContextClass);
  JS_ASSIGN_PROTO_PROP_READONLY(collectionViewContentSize);
  JS_ASSIGN_PROTO_PROP_READONLY(developmentLayoutDirection);
  JS_ASSIGN_PROTO_PROP_READONLY(flipsHorizontallyInOppositeLayoutDirection);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewLayout, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UICollectionViewLayout, NSObject);

NAN_METHOD(NUICollectionViewLayout::New) {
  JS_RECONSTRUCT(UICollectionViewLayout);
  @autoreleasepool {
    UICollectionViewLayout* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionViewLayout *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UICollectionViewLayout alloc] init];
    }
    if (self) {
      NUICollectionViewLayout *wrapper = new NUICollectionViewLayout();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionViewLayout::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUICollectionViewLayout::layoutAttributesClass) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_Class([UICollectionViewLayout layoutAttributesClass]));
  }
}

NAN_METHOD(NUICollectionViewLayout::invalidationContextClass) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_Class([UICollectionViewLayout invalidationContextClass]));
  }
}

NAN_METHOD(NUICollectionViewLayout::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UICollectionViewLayout alloc] init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUICollectionViewLayout::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUICollectionViewLayout::invalidateLayout) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    [self invalidateLayout];
  }
}

#include "NUICollectionViewLayoutInvalidationContext.h"

NAN_METHOD(NUICollectionViewLayout::invalidateLayoutWithContext) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayoutInvalidationContext, context);
    [self invalidateLayoutWithContext: context];
  }
}

NAN_METHOD(NUICollectionViewLayout::registerClassForDecorationViewOfKind) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* Class*/, viewClass);
    declare_pointer(NSString, elementKind);
    [self registerClass: viewClass forDecorationViewOfKind: elementKind];
  }
}

#include "NUINib.h"

NAN_METHOD(NUICollectionViewLayout::registerNibForDecorationViewOfKind) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UINib, nib);
    declare_pointer(NSString, elementKind);
    [self registerNib: nib forDecorationViewOfKind: elementKind];
  }
}

NAN_METHOD(NUICollectionViewLayout::prepareLayout) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    [self prepareLayout];
  }
}

#include "NUICollectionViewLayoutAttributes.h"

NAN_METHOD(NUICollectionViewLayout::layoutAttributesForElementsInRect) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_NSArray<UICollectionViewLayoutAttributes*>([self layoutAttributesForElementsInRect: rect]));
  }
}

NAN_METHOD(NUICollectionViewLayout::layoutAttributesForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self layoutAttributesForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::layoutAttributesForSupplementaryViewOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self layoutAttributesForSupplementaryViewOfKind: elementKind atIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::layoutAttributesForDecorationViewOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self layoutAttributesForDecorationViewOfKind: elementKind atIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::shouldInvalidateLayoutForBoundsChange) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, newBounds);
    JS_SET_RETURN(js_value_BOOL([self shouldInvalidateLayoutForBoundsChange: newBounds]));
  }
}

NAN_METHOD(NUICollectionViewLayout::invalidationContextForBoundsChange) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, newBounds);
    JS_SET_RETURN(js_value_UICollectionViewLayoutInvalidationContext([self invalidationContextForBoundsChange: newBounds]));
  }
}

NAN_METHOD(NUICollectionViewLayout::shouldInvalidateLayoutForPreferredLayoutAttributesWithOriginalAttributes) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayoutAttributes, preferredAttributes);
    declare_pointer(UICollectionViewLayoutAttributes, originalAttributes);
    JS_SET_RETURN(js_value_BOOL([self shouldInvalidateLayoutForPreferredLayoutAttributes: preferredAttributes withOriginalAttributes: originalAttributes]));
  }
}

NAN_METHOD(NUICollectionViewLayout::invalidationContextForPreferredLayoutAttributesWithOriginalAttributes) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayoutAttributes, preferredAttributes);
    declare_pointer(UICollectionViewLayoutAttributes, originalAttributes);
    JS_SET_RETURN(js_value_UICollectionViewLayoutInvalidationContext([self invalidationContextForPreferredLayoutAttributes: preferredAttributes withOriginalAttributes: originalAttributes]));
  }
}

NAN_METHOD(NUICollectionViewLayout::targetContentOffsetForProposedContentOffsetWithScrollingVelocity) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, proposedContentOffset);
    declare_value(CGPoint, velocity);
    JS_SET_RETURN(js_value_CGPoint([self targetContentOffsetForProposedContentOffset: proposedContentOffset withScrollingVelocity: velocity]));
  }
}

NAN_METHOD(NUICollectionViewLayout::targetContentOffsetForProposedContentOffset) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, proposedContentOffset);
    JS_SET_RETURN(js_value_CGPoint([self targetContentOffsetForProposedContentOffset: proposedContentOffset]));
  }
}

NAN_METHOD(NUICollectionViewLayout::collectionViewContentSize) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self collectionViewContentSize]));
  }
}

NAN_METHOD(NUICollectionViewLayout::prepareForCollectionViewUpdates) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UICollectionViewUpdateItem*>, updateItems);
    [self prepareForCollectionViewUpdates: updateItems];
  }
}

NAN_METHOD(NUICollectionViewLayout::finalizeCollectionViewUpdates) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    [self finalizeCollectionViewUpdates];
  }
}

NAN_METHOD(NUICollectionViewLayout::prepareForAnimatedBoundsChange) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, oldBounds);
    [self prepareForAnimatedBoundsChange: oldBounds];
  }
}

NAN_METHOD(NUICollectionViewLayout::finalizeAnimatedBoundsChange) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    [self finalizeAnimatedBoundsChange];
  }
}

NAN_METHOD(NUICollectionViewLayout::prepareForTransitionToLayout) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayout, newLayout);
    [self prepareForTransitionToLayout: newLayout];
  }
}

NAN_METHOD(NUICollectionViewLayout::prepareForTransitionFromLayout) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayout, oldLayout);
    [self prepareForTransitionFromLayout: oldLayout];
  }
}

NAN_METHOD(NUICollectionViewLayout::finalizeLayoutTransition) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    [self finalizeLayoutTransition];
  }
}

NAN_METHOD(NUICollectionViewLayout::initialLayoutAttributesForAppearingItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, itemIndexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self initialLayoutAttributesForAppearingItemAtIndexPath: itemIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::finalLayoutAttributesForDisappearingItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, itemIndexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self finalLayoutAttributesForDisappearingItemAtIndexPath: itemIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::initialLayoutAttributesForAppearingSupplementaryElementOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, elementIndexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self initialLayoutAttributesForAppearingSupplementaryElementOfKind: elementKind atIndexPath: elementIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::finalLayoutAttributesForDisappearingSupplementaryElementOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, elementIndexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self finalLayoutAttributesForDisappearingSupplementaryElementOfKind: elementKind atIndexPath: elementIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::initialLayoutAttributesForAppearingDecorationElementOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, decorationIndexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self initialLayoutAttributesForAppearingDecorationElementOfKind: elementKind atIndexPath: decorationIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::finalLayoutAttributesForDisappearingDecorationElementOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, decorationIndexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self finalLayoutAttributesForDisappearingDecorationElementOfKind: elementKind atIndexPath: decorationIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayout::indexPathsToDeleteForSupplementaryViewOfKind) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsToDeleteForSupplementaryViewOfKind: elementKind]));
  }
}

NAN_METHOD(NUICollectionViewLayout::indexPathsToDeleteForDecorationViewOfKind) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsToDeleteForDecorationViewOfKind: elementKind]));
  }
}

NAN_METHOD(NUICollectionViewLayout::indexPathsToInsertForSupplementaryViewOfKind) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsToInsertForSupplementaryViewOfKind: elementKind]));
  }
}

NAN_METHOD(NUICollectionViewLayout::indexPathsToInsertForDecorationViewOfKind) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsToInsertForDecorationViewOfKind: elementKind]));
  }
}

NAN_METHOD(NUICollectionViewLayout::targetIndexPathForInteractivelyMovingItemWithPosition) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, previousIndexPath);
    declare_value(CGPoint, position);
    JS_SET_RETURN(js_value_NSIndexPath([self targetIndexPathForInteractivelyMovingItem: previousIndexPath withPosition: position]));
  }
}

NAN_METHOD(NUICollectionViewLayout::layoutAttributesForInteractivelyMovingItemAtIndexPathWithTargetPosition) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_value(CGPoint, position);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self layoutAttributesForInteractivelyMovingItemAtIndexPath: indexPath withTargetPosition: position]));
  }
}

NAN_METHOD(NUICollectionViewLayout::invalidationContextForInteractivelyMovingItemsWithTargetPositionPreviousIndexPathsPreviousPosition) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, targetIndexPaths);
    declare_value(CGPoint, targetPosition);
    declare_pointer(NSArray<NSIndexPath*>, previousIndexPaths);
    declare_value(CGPoint, previousPosition);
    JS_SET_RETURN(js_value_UICollectionViewLayoutInvalidationContext([self invalidationContextForInteractivelyMovingItems: targetIndexPaths withTargetPosition: targetPosition previousIndexPaths: previousIndexPaths previousPosition: previousPosition]));
  }
}

NAN_METHOD(NUICollectionViewLayout::invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPathsPreviousIndexPathsMovementCancelled) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    declare_pointer(NSArray<NSIndexPath*>, previousIndexPaths);
    declare_value(BOOL, movementCancelled);
    JS_SET_RETURN(js_value_UICollectionViewLayoutInvalidationContext([self invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths: indexPaths previousIndexPaths: previousIndexPaths movementCancelled: movementCancelled]));
  }
}

#include "NUICollectionView.h"

NAN_GETTER(NUICollectionViewLayout::collectionViewGetter) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionView([self collectionView]));
  }
}

NAN_GETTER(NUICollectionViewLayout::layoutAttributesClassGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* Class*/([UICollectionViewLayout layoutAttributesClass]));
  }
}

NAN_GETTER(NUICollectionViewLayout::invalidationContextClassGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* Class*/([UICollectionViewLayout invalidationContextClass]));
  }
}

NAN_GETTER(NUICollectionViewLayout::collectionViewContentSizeGetter) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self collectionViewContentSize]));
  }
}

#include "NUIView.h"

NAN_GETTER(NUICollectionViewLayout::developmentLayoutDirectionGetter) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceLayoutDirection([self developmentLayoutDirection]));
  }
}

NAN_GETTER(NUICollectionViewLayout::flipsHorizontallyInOppositeLayoutDirectionGetter) {
  JS_UNWRAP(UICollectionViewLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self flipsHorizontallyInOppositeLayoutDirection]));
  }
}
