//
//  NUICollectionView.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionView_h
#define NUICollectionView_h

#include "NUIScrollView.h"

#define js_value_UICollectionView(x) js_value_wrapper(x, UICollectionView)
#define to_value_UICollectionView(x) to_value_wrapper(x, UICollectionView)
#define is_value_UICollectionView(x) is_value_wrapper(x, UICollectionView)

#define js_value_UICollectionViewScrollPosition(x) JS_OPTS(UICollectionViewScrollPosition, NSUInteger, x)
#define to_value_UICollectionViewScrollPosition(x) TO_OPTS(UICollectionViewScrollPosition, NSUInteger, x)
#define is_value_UICollectionViewScrollPosition(x) IS_OPTS(UICollectionViewScrollPosition, NSUInteger, x)

#define js_value_UICollectionViewReorderingCadence(x) JS_ENUM(UICollectionViewReorderingCadence, NSInteger, x)
#define to_value_UICollectionViewReorderingCadence(x) TO_ENUM(UICollectionViewReorderingCadence, NSInteger, x)
#define is_value_UICollectionViewReorderingCadence(x) IS_ENUM(UICollectionViewReorderingCadence, NSInteger, x)

JS_WRAP_CLASS(UICollectionView, UIScrollView);
#if TODO
// UICollectionViewPlaceholder
  JS_STATIC_METHOD(new);
// UICollectionViewDataSource
  JS_METHOD(collectionViewNumberOfItemsInSection);
  JS_METHOD(collectionViewCellForItemAtIndexPath);
  JS_METHOD(numberOfSectionsInCollectionView);
  JS_METHOD(collectionViewViewForSupplementaryElementOfKindAtIndexPath);
  JS_METHOD(collectionViewCanMoveItemAtIndexPath);
  JS_METHOD(collectionViewMoveItemAtIndexPathToIndexPath);
  JS_METHOD(indexTitlesForCollectionView);
  JS_METHOD(collectionViewIndexPathForIndexTitleAtIndex);
// UICollectionViewDataSourcePrefetching
  JS_METHOD(collectionViewPrefetchItemsAtIndexPaths);
  JS_METHOD(collectionViewCancelPrefetchingForItemsAtIndexPaths);
// UICollectionViewDelegate
  JS_METHOD(collectionViewShouldHighlightItemAtIndexPath);
  JS_METHOD(collectionViewDidHighlightItemAtIndexPath);
  JS_METHOD(collectionViewDidUnhighlightItemAtIndexPath);
  JS_METHOD(collectionViewShouldSelectItemAtIndexPath);
  JS_METHOD(collectionViewShouldDeselectItemAtIndexPath);
  JS_METHOD(collectionViewDidSelectItemAtIndexPath);
  JS_METHOD(collectionViewDidDeselectItemAtIndexPath);
  JS_METHOD(collectionViewWillDisplayCellForItemAtIndexPath);
  JS_METHOD(collectionViewWillDisplaySupplementaryViewForElementKindAtIndexPath);
  JS_METHOD(collectionViewDidEndDisplayingCellForItemAtIndexPath);
  JS_METHOD(collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtIndexPath);
  JS_METHOD(collectionViewShouldShowMenuForItemAtIndexPath);
  JS_METHOD(collectionViewCanPerformActionForItemAtIndexPathWithSender);
  JS_METHOD(collectionViewPerformActionForItemAtIndexPathWithSender);
  JS_METHOD(collectionViewTransitionLayoutForOldLayoutNewLayout);
  JS_METHOD(collectionViewCanFocusItemAtIndexPath);
  JS_METHOD(collectionViewShouldUpdateFocusInContext);
  JS_METHOD(collectionViewDidUpdateFocusInContextWithAnimationCoordinator);
  JS_METHOD(indexPathForPreferredFocusedViewInCollectionView);
  JS_METHOD(collectionViewTargetIndexPathForMoveFromItemAtIndexPathToProposedIndexPath);
  JS_METHOD(collectionViewTargetContentOffsetForProposedContentOffset);
  JS_METHOD(collectionViewShouldSpringLoadItemAtIndexPathWithContext);
#endif
// UICollectionView
  JS_STATIC_METHOD(initWithFrameCollectionViewLayout);
  JS_STATIC_METHOD(initWithCoder);
  JS_METHOD(registerClassForCellWithReuseIdentifier);
  JS_METHOD(registerNibForCellWithReuseIdentifier);
  JS_METHOD(registerClassForSupplementaryViewOfKindWithReuseIdentifier);
  JS_METHOD(registerNibForSupplementaryViewOfKindWithReuseIdentifier);
  JS_METHOD(dequeueReusableCellWithReuseIdentifierForIndexPath);
  JS_METHOD(dequeueReusableSupplementaryViewOfKindWithReuseIdentifierForIndexPath);
  JS_METHOD(indexPathsForSelectedItems);
  JS_METHOD(selectItemAtIndexPathAnimatedScrollPosition);
  JS_METHOD(deselectItemAtIndexPathAnimated);
  JS_METHOD(reloadData);
  JS_METHOD(setCollectionViewLayoutAnimated);
  JS_METHOD(setCollectionViewLayoutAnimatedCompletion);
  JS_METHOD(startInteractiveTransitionToCollectionViewLayoutCompletion);
  JS_METHOD(finishInteractiveTransition);
  JS_METHOD(cancelInteractiveTransition);
  JS_METHOD(numberOfSections);
  JS_METHOD(numberOfItemsInSection);
  JS_METHOD(layoutAttributesForItemAtIndexPath);
  JS_METHOD(layoutAttributesForSupplementaryElementOfKindAtIndexPath);
  JS_METHOD(indexPathForItemAtPoint);
  JS_METHOD(indexPathForCell);
  JS_METHOD(cellForItemAtIndexPath);
  JS_METHOD(visibleCells);
  JS_METHOD(indexPathsForVisibleItems);
  JS_METHOD(supplementaryViewForElementKindAtIndexPath);
  JS_METHOD(visibleSupplementaryViewsOfKind);
  JS_METHOD(indexPathsForVisibleSupplementaryElementsOfKind);
  JS_METHOD(scrollToItemAtIndexPathAtScrollPositionAnimated);
  JS_METHOD(insertSections);
  JS_METHOD(deleteSections);
  JS_METHOD(reloadSections);
  JS_METHOD(moveSectionToSection);
  JS_METHOD(insertItemsAtIndexPaths);
  JS_METHOD(deleteItemsAtIndexPaths);
  JS_METHOD(reloadItemsAtIndexPaths);
  JS_METHOD(moveItemAtIndexPathToIndexPath);
  JS_METHOD(performBatchUpdatesCompletion);
  JS_METHOD(beginInteractiveMovementForItemAtIndexPath);
  JS_METHOD(updateInteractiveMovementTargetPosition);
  JS_METHOD(endInteractiveMovement);
  JS_METHOD(cancelInteractiveMovement);
#if TODO
// UICollectionViewDragDelegate
  JS_METHOD(collectionViewItemsForBeginningDragSessionAtIndexPath);
  JS_METHOD(collectionViewItemsForAddingToDragSessionAtIndexPathPoint);
  JS_METHOD(collectionViewDragPreviewParametersForItemAtIndexPath);
  JS_METHOD(collectionViewDragSessionWillBegin);
  JS_METHOD(collectionViewDragSessionDidEnd);
  JS_METHOD(collectionViewDragSessionAllowsMoveOperation);
  JS_METHOD(collectionViewDragSessionIsRestrictedToDraggingApplication);
// UICollectionViewDropDelegate
  JS_METHOD(collectionViewPerformDropWithCoordinator);
  JS_METHOD(collectionViewCanHandleDropSession);
  JS_METHOD(collectionViewDropSessionDidEnter);
  JS_METHOD(collectionViewDropSessionDidUpdateWithDestinationIndexPath);
  JS_METHOD(collectionViewDropSessionDidExit);
  JS_METHOD(collectionViewDropSessionDidEnd);
  JS_METHOD(collectionViewDropPreviewParametersForItemAtIndexPath);
// UICollectionViewDropProposal
  JS_STATIC_METHOD(initWithDropOperationIntent);
// UICollectionViewDropCoordinator
  JS_METHOD(dropItemToPlaceholder);
  JS_METHOD(dropItemToItemAtIndexPath);
  JS_METHOD(dropItemIntoItemAtIndexPathRect);
  JS_METHOD(dropItemToTarget);
// UICollectionViewPlaceholder
  JS_STATIC_METHOD(initWithInsertionIndexPathReuseIdentifier);
  JS_STATIC_METHOD(init);
// UICollectionViewDropPlaceholderContext
  JS_METHOD(commitInsertionWithDataSourceUpdates);
  JS_METHOD(deletePlaceholder);
  JS_METHOD(setNeedsCellUpdate);
// UICollectionViewFocusUpdateContext
  JS_PROP_READONLY(previouslyFocusedIndexPath);
  JS_PROP_READONLY(nextFocusedIndexPath);
#endif
// UICollectionView
  JS_PROP(collectionViewLayout);
  JS_PROP(delegate);
  JS_PROP(dataSource);
  JS_PROP(prefetchDataSource);
  JS_PROP(isPrefetchingEnabled);
  JS_PROP(dragDelegate);
  JS_PROP(dropDelegate);
  JS_PROP(dragInteractionEnabled);
  JS_PROP(reorderingCadence);
  JS_PROP(backgroundView);
  JS_PROP(allowsSelection);
  JS_PROP(allowsMultipleSelection);
  JS_PROP_READONLY(indexPathsForSelectedItems);
  JS_PROP_READONLY(hasUncommittedUpdates);
  JS_PROP_READONLY(numberOfSections);
  JS_PROP_READONLY(visibleCells);
  JS_PROP_READONLY(indexPathsForVisibleItems);
  JS_PROP(remembersLastFocusedIndexPath);
  JS_PROP_READONLY(hasActiveDrag);
  JS_PROP_READONLY(hasActiveDrop);
#if TODO
// UICollectionViewDropProposal
  JS_PROP_READONLY(intent);
// UICollectionViewDropCoordinator
  JS_PROP_READONLY(items);
  JS_PROP_READONLY(destinationIndexPath);
  JS_PROP_READONLY(proposal);
  JS_PROP_READONLY(session);
// UICollectionViewPlaceholder
  JS_PROP(UICollectionViewCell());
// UICollectionViewDropPlaceholder
  JS_PROP(UICollectionViewCell());
// UICollectionViewDropItem
  JS_PROP_READONLY(dragItem);
  JS_PROP_READONLY(sourceIndexPath);
  JS_PROP_READONLY(previewSize);
// UICollectionViewDropPlaceholderContext
  JS_PROP_READONLY(dragItem);
#endif

JS_WRAP_CLASS_END(UICollectionView);

#endif /* NUICollectionView_h */
