//
//  NUICollectionView.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionView.h"

#define instancetype UICollectionView
#define js_value_instancetype js_value_UICollectionView

NUICollectionView::NUICollectionView() {}
NUICollectionView::~NUICollectionView() {}

JS_INIT_CLASS(UICollectionView, UIScrollView);
#if TODO
// UICollectionViewPlaceholder
  JS_ASSIGN_STATIC_METHOD(new);
// UICollectionViewDataSource
  JS_ASSIGN_PROTO_METHOD(collectionViewNumberOfItemsInSection);
  JS_ASSIGN_PROTO_METHOD(collectionViewCellForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(numberOfSectionsInCollectionView);
  JS_ASSIGN_PROTO_METHOD(collectionViewViewForSupplementaryElementOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewCanMoveItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewMoveItemAtIndexPathToIndexPath);
  JS_ASSIGN_PROTO_METHOD(indexTitlesForCollectionView);
  JS_ASSIGN_PROTO_METHOD(collectionViewIndexPathForIndexTitleAtIndex);
// UICollectionViewDataSourcePrefetching
  JS_ASSIGN_PROTO_METHOD(collectionViewPrefetchItemsAtIndexPaths);
  JS_ASSIGN_PROTO_METHOD(collectionViewCancelPrefetchingForItemsAtIndexPaths);
// UICollectionViewDelegate
  JS_ASSIGN_PROTO_METHOD(collectionViewShouldHighlightItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDidHighlightItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDidUnhighlightItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewShouldSelectItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewShouldDeselectItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDidSelectItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDidDeselectItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewWillDisplayCellForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewWillDisplaySupplementaryViewForElementKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDidEndDisplayingCellForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewShouldShowMenuForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewCanPerformActionForItemAtIndexPathWithSender);
  JS_ASSIGN_PROTO_METHOD(collectionViewPerformActionForItemAtIndexPathWithSender);
  JS_ASSIGN_PROTO_METHOD(collectionViewTransitionLayoutForOldLayoutNewLayout);
  JS_ASSIGN_PROTO_METHOD(collectionViewCanFocusItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewShouldUpdateFocusInContext);
  JS_ASSIGN_PROTO_METHOD(collectionViewDidUpdateFocusInContextWithAnimationCoordinator);
  JS_ASSIGN_PROTO_METHOD(indexPathForPreferredFocusedViewInCollectionView);
  JS_ASSIGN_PROTO_METHOD(collectionViewTargetIndexPathForMoveFromItemAtIndexPathToProposedIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewTargetContentOffsetForProposedContentOffset);
  JS_ASSIGN_PROTO_METHOD(collectionViewShouldSpringLoadItemAtIndexPathWithContext);
#endif
// UICollectionView
  JS_ASSIGN_STATIC_METHOD(initWithFrameCollectionViewLayout);
  JS_ASSIGN_STATIC_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(registerClassForCellWithReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(registerNibForCellWithReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(registerClassForSupplementaryViewOfKindWithReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(registerNibForSupplementaryViewOfKindWithReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(dequeueReusableCellWithReuseIdentifierForIndexPath);
  JS_ASSIGN_PROTO_METHOD(dequeueReusableSupplementaryViewOfKindWithReuseIdentifierForIndexPath);
  JS_ASSIGN_PROTO_METHOD(indexPathsForSelectedItems);
  JS_ASSIGN_PROTO_METHOD(selectItemAtIndexPathAnimatedScrollPosition);
  JS_ASSIGN_PROTO_METHOD(deselectItemAtIndexPathAnimated);
  JS_ASSIGN_PROTO_METHOD(reloadData);
  JS_ASSIGN_PROTO_METHOD(setCollectionViewLayoutAnimated);
  JS_ASSIGN_PROTO_METHOD(setCollectionViewLayoutAnimatedCompletion);
  JS_ASSIGN_PROTO_METHOD(startInteractiveTransitionToCollectionViewLayoutCompletion);
  JS_ASSIGN_PROTO_METHOD(finishInteractiveTransition);
  JS_ASSIGN_PROTO_METHOD(cancelInteractiveTransition);
  JS_ASSIGN_PROTO_METHOD(numberOfSections);
  JS_ASSIGN_PROTO_METHOD(numberOfItemsInSection);
  JS_ASSIGN_PROTO_METHOD(layoutAttributesForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(layoutAttributesForSupplementaryElementOfKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(indexPathForItemAtPoint);
  JS_ASSIGN_PROTO_METHOD(indexPathForCell);
  JS_ASSIGN_PROTO_METHOD(cellForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(visibleCells);
  JS_ASSIGN_PROTO_METHOD(indexPathsForVisibleItems);
  JS_ASSIGN_PROTO_METHOD(supplementaryViewForElementKindAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(visibleSupplementaryViewsOfKind);
  JS_ASSIGN_PROTO_METHOD(indexPathsForVisibleSupplementaryElementsOfKind);
  JS_ASSIGN_PROTO_METHOD(scrollToItemAtIndexPathAtScrollPositionAnimated);
  JS_ASSIGN_PROTO_METHOD(insertSections);
  JS_ASSIGN_PROTO_METHOD(deleteSections);
  JS_ASSIGN_PROTO_METHOD(reloadSections);
  JS_ASSIGN_PROTO_METHOD(moveSectionToSection);
  JS_ASSIGN_PROTO_METHOD(insertItemsAtIndexPaths);
  JS_ASSIGN_PROTO_METHOD(deleteItemsAtIndexPaths);
  JS_ASSIGN_PROTO_METHOD(reloadItemsAtIndexPaths);
  JS_ASSIGN_PROTO_METHOD(moveItemAtIndexPathToIndexPath);
  JS_ASSIGN_PROTO_METHOD(performBatchUpdatesCompletion);
  JS_ASSIGN_PROTO_METHOD(beginInteractiveMovementForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(updateInteractiveMovementTargetPosition);
  JS_ASSIGN_PROTO_METHOD(endInteractiveMovement);
  JS_ASSIGN_PROTO_METHOD(cancelInteractiveMovement);
#if TODO
// UICollectionViewDragDelegate
  JS_ASSIGN_PROTO_METHOD(collectionViewItemsForBeginningDragSessionAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewItemsForAddingToDragSessionAtIndexPathPoint);
  JS_ASSIGN_PROTO_METHOD(collectionViewDragPreviewParametersForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDragSessionWillBegin);
  JS_ASSIGN_PROTO_METHOD(collectionViewDragSessionDidEnd);
  JS_ASSIGN_PROTO_METHOD(collectionViewDragSessionAllowsMoveOperation);
  JS_ASSIGN_PROTO_METHOD(collectionViewDragSessionIsRestrictedToDraggingApplication);
// UICollectionViewDropDelegate
  JS_ASSIGN_PROTO_METHOD(collectionViewPerformDropWithCoordinator);
  JS_ASSIGN_PROTO_METHOD(collectionViewCanHandleDropSession);
  JS_ASSIGN_PROTO_METHOD(collectionViewDropSessionDidEnter);
  JS_ASSIGN_PROTO_METHOD(collectionViewDropSessionDidUpdateWithDestinationIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewDropSessionDidExit);
  JS_ASSIGN_PROTO_METHOD(collectionViewDropSessionDidEnd);
  JS_ASSIGN_PROTO_METHOD(collectionViewDropPreviewParametersForItemAtIndexPath);
// UICollectionViewDropProposal
  JS_ASSIGN_STATIC_METHOD(initWithDropOperationIntent);
// UICollectionViewDropCoordinator
  JS_ASSIGN_PROTO_METHOD(dropItemToPlaceholder);
  JS_ASSIGN_PROTO_METHOD(dropItemToItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(dropItemIntoItemAtIndexPathRect);
  JS_ASSIGN_PROTO_METHOD(dropItemToTarget);
// UICollectionViewPlaceholder
  JS_ASSIGN_STATIC_METHOD(initWithInsertionIndexPathReuseIdentifier);
  JS_ASSIGN_STATIC_METHOD(init);
// UICollectionViewDropPlaceholderContext
  JS_ASSIGN_PROTO_METHOD(commitInsertionWithDataSourceUpdates);
  JS_ASSIGN_PROTO_METHOD(deletePlaceholder);
  JS_ASSIGN_PROTO_METHOD(setNeedsCellUpdate);
// UICollectionViewFocusUpdateContext
  JS_ASSIGN_PROTO_PROP_READONLY(previouslyFocusedIndexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(nextFocusedIndexPath);
#endif
// UICollectionView
  JS_ASSIGN_PROTO_PROP(collectionViewLayout);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(dataSource);
  JS_ASSIGN_PROTO_PROP(prefetchDataSource);
  JS_ASSIGN_PROTO_PROP(isPrefetchingEnabled);
  JS_ASSIGN_PROTO_PROP(dragDelegate);
  JS_ASSIGN_PROTO_PROP(dropDelegate);
  JS_ASSIGN_PROTO_PROP(dragInteractionEnabled);
  JS_ASSIGN_PROTO_PROP(reorderingCadence);
  JS_ASSIGN_PROTO_PROP(backgroundView);
  JS_ASSIGN_PROTO_PROP(allowsSelection);
  JS_ASSIGN_PROTO_PROP(allowsMultipleSelection);
  JS_ASSIGN_PROTO_PROP_READONLY(indexPathsForSelectedItems);
  JS_ASSIGN_PROTO_PROP_READONLY(hasUncommittedUpdates);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfSections);
  JS_ASSIGN_PROTO_PROP_READONLY(visibleCells);
  JS_ASSIGN_PROTO_PROP_READONLY(indexPathsForVisibleItems);
  JS_ASSIGN_PROTO_PROP(remembersLastFocusedIndexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(hasActiveDrag);
  JS_ASSIGN_PROTO_PROP_READONLY(hasActiveDrop);
#if TODO
// UICollectionViewDropProposal
  JS_ASSIGN_PROTO_PROP_READONLY(intent);
// UICollectionViewDropCoordinator
  JS_ASSIGN_PROTO_PROP_READONLY(items);
  JS_ASSIGN_PROTO_PROP_READONLY(destinationIndexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(proposal);
  JS_ASSIGN_PROTO_PROP_READONLY(session);
// UICollectionViewPlaceholder
  JS_ASSIGN_PROTO_PROP(cellUpdateHandler);
// UICollectionViewDropPlaceholder
  JS_ASSIGN_PROTO_PROP(previewParametersProvider);
// UICollectionViewDropItem
  JS_ASSIGN_PROTO_PROP_READONLY(dragItem);
  JS_ASSIGN_PROTO_PROP_READONLY(sourceIndexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(previewSize);
// UICollectionViewDropPlaceholderContext
  JS_ASSIGN_PROTO_PROP_READONLY(dragItem);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionView, UIScrollView);
  // constants (exports)

//typedef NS_OPTIONS(NSUInteger, UICollectionViewScrollPosition) {
  JS_ASSIGN_ENUM(UICollectionViewScrollPositionNone, NSUInteger); //                  = 0,
  
  // The vertical positions are mutually exclusive to each other, but are bitwise or-able with the horizontal scroll positions.
  // Combining positions from the same grouping (horizontal or vertical) will result in an NSInvalidArgumentException.
  JS_ASSIGN_ENUM(UICollectionViewScrollPositionTop, NSUInteger); //                   = 1 << 0,
  JS_ASSIGN_ENUM(UICollectionViewScrollPositionCenteredVertically, NSUInteger); //    = 1 << 1,
  JS_ASSIGN_ENUM(UICollectionViewScrollPositionBottom, NSUInteger); //                = 1 << 2,
  
  // Likewise, the horizontal positions are mutually exclusive to each other.
  JS_ASSIGN_ENUM(UICollectionViewScrollPositionLeft, NSUInteger); //                  = 1 << 3,
  JS_ASSIGN_ENUM(UICollectionViewScrollPositionCenteredHorizontally, NSUInteger); //  = 1 << 4,
  JS_ASSIGN_ENUM(UICollectionViewScrollPositionRight, NSUInteger); //                 = 1 << 5
//};

//typedef NS_ENUM(NSInteger, UICollectionViewReorderingCadence) {
  JS_ASSIGN_ENUM(UICollectionViewReorderingCadenceImmediate, NSInteger);
  JS_ASSIGN_ENUM(UICollectionViewReorderingCadenceFast, NSInteger);
  JS_ASSIGN_ENUM(UICollectionViewReorderingCadenceSlow, NSInteger);
//} API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);

JS_INIT_CLASS_END(UICollectionView, UIScrollView);

#include "NUICollectionViewLayout.h"
#include "NUICollectionViewFlowLayout.h"

NAN_METHOD(NUICollectionView::New) {
  JS_RECONSTRUCT(UICollectionView);
  @autoreleasepool {
    UICollectionView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionView *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0 && is_value_CGRect(info[0])) {
      CGRect frame(to_value_CGRect(info[0]));
      UICollectionViewLayout *layout = is_value_UICollectionViewLayout(info[1]) ? to_value_UICollectionViewLayout(info[1]) : nil;
      if (!layout) {
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setItemSize:CGSizeMake(frame.size.width, frame.size.height)];
        [flowLayout setEstimatedItemSize:CGSizeMake(frame.size.width, frame.size.height)];
        //For Setting the Spacing between cells
        flowLayout.minimumInteritemSpacing = 0;
        //flowLayout.minimumLineSpacing = 0;
        layout = flowLayout;
      }
      self = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
      [self registerClass:[UICollectionViewCell self] forCellWithReuseIdentifier:@"sweetiekit.UICollectionViewCell"];
    } else if (info.Length() <= 0) {
      self = [[UICollectionView alloc] init];
    }
    if (self) {
      NUICollectionView *wrapper = new NUICollectionView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionView::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NUICollectionViewPlaceholder::new) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([UICollectionViewPlaceholder new]));
  }
}

NAN_METHOD(NUICollectionViewDataSource::collectionViewNumberOfItemsInSection) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_NSInteger([self collectionView: collectionView numberOfItemsInSection: section]));
  }
}

NAN_METHOD(NUICollectionViewDataSource::collectionViewCellForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewCell([self collectionView: collectionView cellForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDataSource::numberOfSectionsInCollectionView) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    JS_SET_RETURN(js_value_NSInteger([self numberOfSectionsInCollectionView: collectionView]));
  }
}

NAN_METHOD(NUICollectionViewDataSource::collectionViewViewForSupplementaryElementOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSString, kind);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionReusableView([self collectionView: collectionView viewForSupplementaryElementOfKind: kind atIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDataSource::collectionViewCanMoveItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView canMoveItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDataSource::collectionViewMoveItemAtIndexPathToIndexPath) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, sourceIndexPath);
    declare_pointer(NSIndexPath, destinationIndexPath);
    [self collectionView: collectionView moveItemAtIndexPath: sourceIndexPath toIndexPath: destinationIndexPath];
  }
}

NAN_METHOD(NUICollectionViewDataSource::indexTitlesForCollectionView) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    JS_SET_RETURN(js_value_NSArray<NSString*>([self indexTitlesForCollectionView: collectionView]));
  }
}

NAN_METHOD(NUICollectionViewDataSource::collectionViewIndexPathForIndexTitleAtIndex) {
  JS_UNWRAP(UICollectionViewDataSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSString, title);
    declare_value(NSInteger, index);
    JS_SET_RETURN(js_value_NSIndexPath([self collectionView: collectionView indexPathForIndexTitle: title atIndex: index]));
  }
}

NAN_METHOD(NUICollectionViewDataSourcePrefetching::collectionViewPrefetchItemsAtIndexPaths) {
  JS_UNWRAP(UICollectionViewDataSourcePrefetching, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self collectionView: collectionView prefetchItemsAtIndexPaths: indexPaths];
  }
}

NAN_METHOD(NUICollectionViewDataSourcePrefetching::collectionViewCancelPrefetchingForItemsAtIndexPaths) {
  JS_UNWRAP(UICollectionViewDataSourcePrefetching, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self collectionView: collectionView cancelPrefetchingForItemsAtIndexPaths: indexPaths];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewShouldHighlightItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView shouldHighlightItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewDidHighlightItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView didHighlightItemAtIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewDidUnhighlightItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView didUnhighlightItemAtIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewShouldSelectItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView shouldSelectItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewShouldDeselectItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView shouldDeselectItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewDidSelectItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView didSelectItemAtIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewDidDeselectItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView didDeselectItemAtIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewWillDisplayCellForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewCell, cell);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView willDisplayCell: cell forItemAtIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewWillDisplaySupplementaryViewForElementKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionReusableView, view);
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView willDisplaySupplementaryView: view forElementKind: elementKind atIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewDidEndDisplayingCellForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewCell, cell);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView didEndDisplayingCell: cell forItemAtIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionReusableView, view);
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, indexPath);
    [self collectionView: collectionView didEndDisplayingSupplementaryView: view forElementOfKind: elementKind atIndexPath: indexPath];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewShouldShowMenuForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView shouldShowMenuForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewCanPerformActionForItemAtIndexPathWithSender) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(SEL, action);
    declare_pointer(NSIndexPath, indexPath);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView canPerformAction: action forItemAtIndexPath: indexPath withSender: sender]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewPerformActionForItemAtIndexPathWithSender) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(SEL, action);
    declare_pointer(NSIndexPath, indexPath);
    declare_nullable_value(id, sender);
    [self collectionView: collectionView performAction: action forItemAtIndexPath: indexPath withSender: sender];
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewTransitionLayoutForOldLayoutNewLayout) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewLayout, fromLayout);
    declare_pointer(UICollectionViewLayout, toLayout);
    JS_SET_RETURN(js_value_nonnull_UICollectionViewTransitionLayout([self collectionView: collectionView transitionLayoutForOldLayout: fromLayout newLayout: toLayout]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewCanFocusItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView canFocusItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewShouldUpdateFocusInContext) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewFocusUpdateContext, context);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView shouldUpdateFocusInContext: context]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewDidUpdateFocusInContextWithAnimationCoordinator) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewFocusUpdateContext, context);
    declare_pointer(UIFocusAnimationCoordinator, coordinator);
    [self collectionView: collectionView didUpdateFocusInContext: context withAnimationCoordinator: coordinator];
  }
}

NAN_METHOD(NUICollectionViewDelegate::indexPathForPreferredFocusedViewInCollectionView) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathForPreferredFocusedViewInCollectionView: collectionView]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewTargetIndexPathForMoveFromItemAtIndexPathToProposedIndexPath) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, originalIndexPath);
    declare_pointer(NSIndexPath, proposedIndexPath);
    JS_SET_RETURN(js_value_NSIndexPath([self collectionView: collectionView targetIndexPathForMoveFromItemAtIndexPath: originalIndexPath toProposedIndexPath: proposedIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewTargetContentOffsetForProposedContentOffset) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(CGPoint, proposedContentOffset);
    JS_SET_RETURN(js_value_CGPoint([self collectionView: collectionView targetContentOffsetForProposedContentOffset: proposedContentOffset]));
  }
}

NAN_METHOD(NUICollectionViewDelegate::collectionViewShouldSpringLoadItemAtIndexPathWithContext) {
  JS_UNWRAP(UICollectionViewDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    declare_value(id<UISpringLoadedInteractionContext>, context);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView shouldSpringLoadItemAtIndexPath: indexPath withContext: context]));
  }
}
#endif

#include "NUICollectionViewLayout.h"

NAN_METHOD(NUICollectionView::initWithFrameCollectionViewLayout) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    declare_pointer(UICollectionViewLayout, layout);
    JS_SET_RETURN(js_value_instancetype([[UICollectionView alloc] initWithFrame: frame collectionViewLayout: layout]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUICollectionView::initWithCoder) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([[UICollectionView alloc] initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUICollectionView::registerClassForCellWithReuseIdentifier) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* Class*/, cellClass);
    declare_pointer(NSString, identifier);
    [self registerClass: cellClass forCellWithReuseIdentifier: identifier];
  }
}

#include "NUINib.h"

NAN_METHOD(NUICollectionView::registerNibForCellWithReuseIdentifier) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UINib, nib);
    declare_pointer(NSString, identifier);
    [self registerNib: nib forCellWithReuseIdentifier: identifier];
  }
}

NAN_METHOD(NUICollectionView::registerClassForSupplementaryViewOfKindWithReuseIdentifier) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* Class*/, viewClass);
    declare_pointer(NSString, elementKind);
    declare_pointer(NSString, identifier);
    [self registerClass: viewClass forSupplementaryViewOfKind: elementKind withReuseIdentifier: identifier];
  }
}

NAN_METHOD(NUICollectionView::registerNibForSupplementaryViewOfKindWithReuseIdentifier) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UINib, nib);
    declare_pointer(NSString, kind);
    declare_pointer(NSString, identifier);
    [self registerNib: nib forSupplementaryViewOfKind: kind withReuseIdentifier: identifier];
  }
}

#include "NUICollectionViewCell.h"

NAN_METHOD(NUICollectionView::dequeueReusableCellWithReuseIdentifierForIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewCell([self dequeueReusableCellWithReuseIdentifier: identifier forIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionView::dequeueReusableSupplementaryViewOfKindWithReuseIdentifierForIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSString, identifier);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionReusableView([self dequeueReusableSupplementaryViewOfKind: elementKind withReuseIdentifier: identifier forIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionView::indexPathsForSelectedItems) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForSelectedItems]));
  }
}

NAN_METHOD(NUICollectionView::selectItemAtIndexPathAnimatedScrollPosition) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSIndexPath, indexPath);
    declare_value(BOOL, animated);
    declare_value(UICollectionViewScrollPosition, scrollPosition);
    [self selectItemAtIndexPath: indexPath animated: animated scrollPosition: scrollPosition];
  }
}

NAN_METHOD(NUICollectionView::deselectItemAtIndexPathAnimated) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_value(BOOL, animated);
    [self deselectItemAtIndexPath: indexPath animated: animated];
  }
}

NAN_METHOD(NUICollectionView::reloadData) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    [self reloadData];
  }
}

#include "NUICollectionViewLayout.h"

NAN_METHOD(NUICollectionView::setCollectionViewLayoutAnimated) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayout, layout);
    declare_value(BOOL, animated);
    [self setCollectionViewLayout: layout animated: animated];
  }
}

NAN_METHOD(NUICollectionView::setCollectionViewLayoutAnimatedCompletion) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayout, layout);
    declare_value(BOOL, animated);
    declare_callback(completion);
    [self setCollectionViewLayout: layout animated: animated completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewController::setCollectionViewLayoutAnimatedCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

#include "NUICollectionViewTransitionLayout.h"

NAN_METHOD(NUICollectionView::startInteractiveTransitionToCollectionViewLayoutCompletion) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayout, layout);
    declare_callback(completion);
    JS_SET_RETURN(js_value_UICollectionViewTransitionLayout([self startInteractiveTransitionToCollectionViewLayout: layout completion:^(BOOL completed, BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewController::startInteractiveTransitionToCollectionViewLayoutCompletion::completion",
            js_value_BOOL(completed),
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }]));
  }
}

NAN_METHOD(NUICollectionView::finishInteractiveTransition) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    [self finishInteractiveTransition];
  }
}

NAN_METHOD(NUICollectionView::cancelInteractiveTransition) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    [self cancelInteractiveTransition];
  }
}

NAN_METHOD(NUICollectionView::numberOfSections) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self numberOfSections]));
  }
}

NAN_METHOD(NUICollectionView::numberOfItemsInSection) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_NSInteger([self numberOfItemsInSection: section]));
  }
}

#include "NUICollectionViewLayoutAttributes.h"

NAN_METHOD(NUICollectionView::layoutAttributesForItemAtIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self layoutAttributesForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionView::layoutAttributesForSupplementaryElementOfKindAtIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, kind);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewLayoutAttributes([self layoutAttributesForSupplementaryElementOfKind: kind atIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionView::indexPathForItemAtPoint) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathForItemAtPoint: point]));
  }
}

NAN_METHOD(NUICollectionView::indexPathForCell) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewCell, cell);
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathForCell: cell]));
  }
}

NAN_METHOD(NUICollectionView::cellForItemAtIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionViewCell([self cellForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionView::visibleCells) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UICollectionViewCell*>([self visibleCells]));
  }
}

NAN_METHOD(NUICollectionView::indexPathsForVisibleItems) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForVisibleItems]));
  }
}

NAN_METHOD(NUICollectionView::supplementaryViewForElementKindAtIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UICollectionReusableView([self supplementaryViewForElementKind: elementKind atIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionView::visibleSupplementaryViewsOfKind) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    JS_SET_RETURN(js_value_NSArray<UICollectionReusableView*>([self visibleSupplementaryViewsOfKind: elementKind]));
  }
}

NAN_METHOD(NUICollectionView::indexPathsForVisibleSupplementaryElementsOfKind) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForVisibleSupplementaryElementsOfKind: elementKind]));
  }
}

NAN_METHOD(NUICollectionView::scrollToItemAtIndexPathAtScrollPositionAnimated) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_value(UICollectionViewScrollPosition, scrollPosition);
    declare_value(BOOL, animated);
    [self scrollToItemAtIndexPath: indexPath atScrollPosition: scrollPosition animated: animated];
  }
}

#define js_value_NSIndexSet(x) js_value_wrapper_unknown(x, NSIndexSet)
#define to_value_NSIndexSet(x) to_value_wrapper_unknown(x, NSIndexSet)
#define is_value_NSIndexSet(x) is_value_wrapper_unknown(x, NSIndexSet)

NAN_METHOD(NUICollectionView::insertSections) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, sections);
    [self insertSections: sections];
  }
}

NAN_METHOD(NUICollectionView::deleteSections) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, sections);
    [self deleteSections: sections];
  }
}

NAN_METHOD(NUICollectionView::reloadSections) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, sections);
    [self reloadSections: sections];
  }
}

NAN_METHOD(NUICollectionView::moveSectionToSection) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    declare_value(NSInteger, newSection);
    [self moveSection: section toSection: newSection];
  }
}

NAN_METHOD(NUICollectionView::insertItemsAtIndexPaths) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self insertItemsAtIndexPaths: indexPaths];
  }
}

NAN_METHOD(NUICollectionView::deleteItemsAtIndexPaths) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self deleteItemsAtIndexPaths: indexPaths];
  }
}

NAN_METHOD(NUICollectionView::reloadItemsAtIndexPaths) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self reloadItemsAtIndexPaths: indexPaths];
  }
}

NAN_METHOD(NUICollectionView::moveItemAtIndexPathToIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_pointer(NSIndexPath, newIndexPath);
    [self moveItemAtIndexPath: indexPath toIndexPath: newIndexPath];
  }
}

NAN_METHOD(NUICollectionView::performBatchUpdatesCompletion) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(updates);
    declare_callback(completion);
    [self performBatchUpdates:^{
      dispatch_main(^{
        if (updates) {
          [updates jsFunction]->Call("NUIViewController::performBatchUpdatesCompletion::updates");
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewController::performBatchUpdatesCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
        clear_callback(updates);
      });
    }];
  }
}

NAN_METHOD(NUICollectionView::beginInteractiveMovementForItemAtIndexPath) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_BOOL([self beginInteractiveMovementForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionView::updateInteractiveMovementTargetPosition) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, targetPosition);
    [self updateInteractiveMovementTargetPosition: targetPosition];
  }
}

NAN_METHOD(NUICollectionView::endInteractiveMovement) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    [self endInteractiveMovement];
  }
}

NAN_METHOD(NUICollectionView::cancelInteractiveMovement) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    [self cancelInteractiveMovement];
  }
}

#if TODO
NAN_METHOD(NUICollectionViewDragDelegate::collectionViewItemsForBeginningDragSessionAtIndexPath) {
  JS_UNWRAP(UICollectionViewDragDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDragSession>, session);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_NSArray<UIDragItem*>([self collectionView: collectionView itemsForBeginningDragSession: session atIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDragDelegate::collectionViewItemsForAddingToDragSessionAtIndexPathPoint) {
  JS_UNWRAP(UICollectionViewDragDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDragSession>, session);
    declare_pointer(NSIndexPath, indexPath);
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_NSArray<UIDragItem*>([self collectionView: collectionView itemsForAddingToDragSession: session atIndexPath: indexPath point: point]));
  }
}

NAN_METHOD(NUICollectionViewDragDelegate::collectionViewDragPreviewParametersForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDragDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UIDragPreviewParameters([self collectionView: collectionView dragPreviewParametersForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDragDelegate::collectionViewDragSessionWillBegin) {
  JS_UNWRAP(UICollectionViewDragDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDragSession>, session);
    [self collectionView: collectionView dragSessionWillBegin: session];
  }
}

NAN_METHOD(NUICollectionViewDragDelegate::collectionViewDragSessionDidEnd) {
  JS_UNWRAP(UICollectionViewDragDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDragSession>, session);
    [self collectionView: collectionView dragSessionDidEnd: session];
  }
}

NAN_METHOD(NUICollectionViewDragDelegate::collectionViewDragSessionAllowsMoveOperation) {
  JS_UNWRAP(UICollectionViewDragDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDragSession>, session);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView dragSessionAllowsMoveOperation: session]));
  }
}

NAN_METHOD(NUICollectionViewDragDelegate::collectionViewDragSessionIsRestrictedToDraggingApplication) {
  JS_UNWRAP(UICollectionViewDragDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDragSession>, session);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView dragSessionIsRestrictedToDraggingApplication: session]));
  }
}

NAN_METHOD(NUICollectionViewDropDelegate::collectionViewPerformDropWithCoordinator) {
  JS_UNWRAP(UICollectionViewDropDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UICollectionViewDropCoordinator>, coordinator);
    [self collectionView: collectionView performDropWithCoordinator: coordinator];
  }
}

NAN_METHOD(NUICollectionViewDropDelegate::collectionViewCanHandleDropSession) {
  JS_UNWRAP(UICollectionViewDropDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDropSession>, session);
    JS_SET_RETURN(js_value_BOOL([self collectionView: collectionView canHandleDropSession: session]));
  }
}

NAN_METHOD(NUICollectionViewDropDelegate::collectionViewDropSessionDidEnter) {
  JS_UNWRAP(UICollectionViewDropDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDropSession>, session);
    [self collectionView: collectionView dropSessionDidEnter: session];
  }
}

NAN_METHOD(NUICollectionViewDropDelegate::collectionViewDropSessionDidUpdateWithDestinationIndexPath) {
  JS_UNWRAP(UICollectionViewDropDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDropSession>, session);
    declare_nullable_pointer(NSIndexPath, destinationIndexPath);
    JS_SET_RETURN(js_value_UICollectionViewDropProposal([self collectionView: collectionView dropSessionDidUpdate: session withDestinationIndexPath: destinationIndexPath]));
  }
}

NAN_METHOD(NUICollectionViewDropDelegate::collectionViewDropSessionDidExit) {
  JS_UNWRAP(UICollectionViewDropDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDropSession>, session);
    [self collectionView: collectionView dropSessionDidExit: session];
  }
}

NAN_METHOD(NUICollectionViewDropDelegate::collectionViewDropSessionDidEnd) {
  JS_UNWRAP(UICollectionViewDropDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_value(id<UIDropSession>, session);
    [self collectionView: collectionView dropSessionDidEnd: session];
  }
}

NAN_METHOD(NUICollectionViewDropDelegate::collectionViewDropPreviewParametersForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDropDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UIDragPreviewParameters([self collectionView: collectionView dropPreviewParametersForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDropProposal::initWithDropOperationIntent) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDropOperation, operation);
    declare_value(UICollectionViewDropIntent, intent);
    JS_SET_RETURN(js_value_instancetype([[UICollectionViewDropProposal alloc] initWithDropOperation: operation intent: intent]));
  }
}

NAN_METHOD(NUICollectionViewDropCoordinator::dropItemToPlaceholder) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIDragItem, dragItem);
    declare_pointer(UICollectionViewDropPlaceholder, placeholder);
    JS_SET_RETURN(js_value_id<UICollectionViewDropPlaceholderContext>([self dropItem: dragItem toPlaceholder: placeholder]));
  }
}

NAN_METHOD(NUICollectionViewDropCoordinator::dropItemToItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIDragItem, dragItem);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_id<UIDragAnimating>([self dropItem: dragItem toItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDropCoordinator::dropItemIntoItemAtIndexPathRect) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIDragItem, dragItem);
    declare_pointer(NSIndexPath, indexPath);
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_id<UIDragAnimating>([self dropItem: dragItem intoItemAtIndexPath: indexPath rect: rect]));
  }
}

NAN_METHOD(NUICollectionViewDropCoordinator::dropItemToTarget) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIDragItem, dragItem);
    declare_pointer(UIDragPreviewTarget, target);
    JS_SET_RETURN(js_value_id<UIDragAnimating>([self dropItem: dragItem toTarget: target]));
  }
}

NAN_METHOD(NUICollectionViewPlaceholder::initWithInsertionIndexPathReuseIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, insertionIndexPath);
    declare_pointer(NSString, reuseIdentifier);
    JS_SET_RETURN(js_value_instancetype([[UICollectionViewPlaceholder alloc] initWithInsertionIndexPath: insertionIndexPath reuseIdentifier: reuseIdentifier]));
  }
}

NAN_METHOD(NUICollectionViewPlaceholder::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UICollectionViewPlaceholder alloc] init]));
  }
}

NAN_METHOD(NUICollectionViewDropPlaceholderContext::commitInsertionWithDataSourceUpdates) {
  JS_UNWRAP(UICollectionViewDropPlaceholderContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(void-NS_NOESCAPE,^-NSIndexPath-pointer,insertionIndexPath, dataSourceUpdates);
    JS_SET_RETURN(js_value_BOOL([self commitInsertionWithDataSourceUpdates: dataSourceUpdates]));
  }
}

NAN_METHOD(NUICollectionViewDropPlaceholderContext::deletePlaceholder) {
  JS_UNWRAP(UICollectionViewDropPlaceholderContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self deletePlaceholder]));
  }
}

NAN_METHOD(NUICollectionViewDropPlaceholderContext::setNeedsCellUpdate) {
  JS_UNWRAP(UICollectionViewDropPlaceholderContext, self);
  declare_autoreleasepool {
    [self setNeedsCellUpdate];
  }
}

NAN_GETTER(NUICollectionViewFocusUpdateContext::previouslyFocusedIndexPathGetter) {
  JS_UNWRAP(UICollectionViewFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self previouslyFocusedIndexPath]));
  }
}

NAN_GETTER(NUICollectionViewFocusUpdateContext::nextFocusedIndexPathGetter) {
  JS_UNWRAP(UICollectionViewFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self nextFocusedIndexPath]));
  }
}
#endif

NAN_GETTER(NUICollectionView::collectionViewLayoutGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewLayout([self collectionViewLayout]));
  }
}

NAN_SETTER(NUICollectionView::collectionViewLayoutSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UICollectionViewLayout, input);
    [self setCollectionViewLayout: input];
  }
}

NAN_GETTER(NUICollectionView::delegateGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICollectionViewDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUICollectionView::delegateSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UICollectionViewDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NUICollectionView::dataSourceGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICollectionViewDataSource>*/([self dataSource]));
  }
}

NAN_SETTER(NUICollectionView::dataSourceSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UICollectionViewDataSource>*/, input);
    [self setDataSource: input];
  }
}

NAN_GETTER(NUICollectionView::prefetchDataSourceGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICollectionViewDataSourcePrefetching>*/([self prefetchDataSource]));
  }
}

NAN_SETTER(NUICollectionView::prefetchDataSourceSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UICollectionViewDataSourcePrefetching>*/, input);
    [self setPrefetchDataSource: input];
  }
}

NAN_GETTER(NUICollectionView::isPrefetchingEnabledGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPrefetchingEnabled]));
  }
}

NAN_SETTER(NUICollectionView::isPrefetchingEnabledSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPrefetchingEnabled: input];
  }
}

NAN_GETTER(NUICollectionView::dragDelegateGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICollectionViewDragDelegate>*/([self dragDelegate]));
  }
}

NAN_SETTER(NUICollectionView::dragDelegateSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UICollectionViewDragDelegate>*/, input);
    [self setDragDelegate: input];
  }
}

NAN_GETTER(NUICollectionView::dropDelegateGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICollectionViewDropDelegate>*/([self dropDelegate]));
  }
}

NAN_SETTER(NUICollectionView::dropDelegateSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UICollectionViewDropDelegate>*/, input);
    [self setDropDelegate: input];
  }
}

NAN_GETTER(NUICollectionView::dragInteractionEnabledGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self dragInteractionEnabled]));
  }
}

NAN_SETTER(NUICollectionView::dragInteractionEnabledSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDragInteractionEnabled: input];
  }
}

NAN_GETTER(NUICollectionView::reorderingCadenceGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewReorderingCadence([self reorderingCadence]));
  }
}

NAN_SETTER(NUICollectionView::reorderingCadenceSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UICollectionViewReorderingCadence, input);
    [self setReorderingCadence: input];
  }
}

#include "NUIView.h"

NAN_GETTER(NUICollectionView::backgroundViewGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self backgroundView]));
  }
}

NAN_SETTER(NUICollectionView::backgroundViewSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setBackgroundView: input];
  }
}

NAN_GETTER(NUICollectionView::allowsSelectionGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsSelection]));
  }
}

NAN_SETTER(NUICollectionView::allowsSelectionSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsSelection: input];
  }
}

NAN_GETTER(NUICollectionView::allowsMultipleSelectionGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsMultipleSelection]));
  }
}

NAN_SETTER(NUICollectionView::allowsMultipleSelectionSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsMultipleSelection: input];
  }
}

NAN_GETTER(NUICollectionView::indexPathsForSelectedItemsGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForSelectedItems]));
  }
}

NAN_GETTER(NUICollectionView::hasUncommittedUpdatesGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasUncommittedUpdates]));
  }
}

NAN_GETTER(NUICollectionView::numberOfSectionsGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self numberOfSections]));
  }
}

NAN_GETTER(NUICollectionView::visibleCellsGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UICollectionViewCell*>([self visibleCells]));
  }
}

NAN_GETTER(NUICollectionView::indexPathsForVisibleItemsGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForVisibleItems]));
  }
}

NAN_GETTER(NUICollectionView::remembersLastFocusedIndexPathGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self remembersLastFocusedIndexPath]));
  }
}

NAN_SETTER(NUICollectionView::remembersLastFocusedIndexPathSetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRemembersLastFocusedIndexPath: input];
  }
}

NAN_GETTER(NUICollectionView::hasActiveDragGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasActiveDrag]));
  }
}

NAN_GETTER(NUICollectionView::hasActiveDropGetter) {
  JS_UNWRAP(UICollectionView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasActiveDrop]));
  }
}

#if TODO
NAN_GETTER(NUICollectionViewDropProposal::intentGetter) {
  JS_UNWRAP(UICollectionViewDropProposal, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewDropIntent([self intent]));
  }
}

NAN_GETTER(NUICollectionViewDropCoordinator::itemsGetter) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<UICollectionViewDropItem>>([self items]));
  }
}

NAN_GETTER(NUICollectionViewDropCoordinator::destinationIndexPathGetter) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self destinationIndexPath]));
  }
}

NAN_GETTER(NUICollectionViewDropCoordinator::proposalGetter) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewDropProposal([self proposal]));
  }
}

NAN_GETTER(NUICollectionViewDropCoordinator::sessionGetter) {
  JS_UNWRAP(UICollectionViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id<UIDropSession>([self session]));
  }
}

NAN_GETTER(NUICollectionViewPlaceholder::UICollectionViewCell()Getter) {
  JS_UNWRAP(UICollectionViewPlaceholder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_void 94cellUpdateHandler([self UICollectionViewCell()]));
  }
}

NAN_SETTER(NUICollectionViewPlaceholder::UICollectionViewCell()Setter) {
  JS_UNWRAP(UICollectionViewPlaceholder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(void ^cellUpdateHandler, input);
    [self set-UICollectionViewCell: input];
  }
}

NAN_GETTER(NUICollectionViewDropPlaceholder::UICollectionViewCell()Getter) {
  JS_UNWRAP(UICollectionViewDropPlaceholder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragPreviewParameters_pointer _Nullable 94previewParametersProvider([self UICollectionViewCell()]));
  }
}

NAN_SETTER(NUICollectionViewDropPlaceholder::UICollectionViewCell()Setter) {
  JS_UNWRAP(UICollectionViewDropPlaceholder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIDragPreviewParameters-pointer _Nullable ^previewParametersProvider, input);
    [self set-UICollectionViewCell: input];
  }
}

NAN_GETTER(NUICollectionViewDropItem::dragItemGetter) {
  JS_UNWRAP(UICollectionViewDropItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragItem([self dragItem]));
  }
}

NAN_GETTER(NUICollectionViewDropItem::sourceIndexPathGetter) {
  JS_UNWRAP(UICollectionViewDropItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self sourceIndexPath]));
  }
}

NAN_GETTER(NUICollectionViewDropItem::previewSizeGetter) {
  JS_UNWRAP(UICollectionViewDropItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self previewSize]));
  }
}

NAN_GETTER(NUICollectionViewDropPlaceholderContext::dragItemGetter) {
  JS_UNWRAP(UICollectionViewDropPlaceholderContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragItem([self dragItem]));
  }
}
#endif

