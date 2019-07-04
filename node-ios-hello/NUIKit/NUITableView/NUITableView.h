//
//  NUITableView.h
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableView_h
#define NUITableView_h

#include "NUIScrollView.h"

#define js_value_UITableView(x) js_value_wrapper(x, UITableView)
#define to_value_UITableView(x) to_value_wrapper(x, UITableView)
#define is_value_UITableView(x) is_value_wrapper(x, UITableView)

#define js_value_UITableViewStyle(x) JS_ENUM(UITableViewStyle, NSInteger, x)
#define to_value_UITableViewStyle(x) TO_ENUM(UITableViewStyle, NSInteger, x)
#define is_value_UITableViewStyle(x) IS_ENUM(UITableViewStyle, NSInteger, x)

#define js_value_UITableViewScrollPosition(x) JS_ENUM(UITableViewScrollPosition, NSInteger, x)
#define to_value_UITableViewScrollPosition(x) TO_ENUM(UITableViewScrollPosition, NSInteger, x)
#define is_value_UITableViewScrollPosition(x) IS_ENUM(UITableViewScrollPosition, NSInteger, x)

#define js_value_UITableViewRowAnimation(x) JS_ENUM(UITableViewRowAnimation, NSInteger, x)
#define to_value_UITableViewRowAnimation(x) TO_ENUM(UITableViewRowAnimation, NSInteger, x)
#define is_value_UITableViewRowAnimation(x) IS_ENUM(UITableViewRowAnimation, NSInteger, x)

#define js_value_UITableViewRowActionStyle(x) JS_ENUM(UITableViewRowActionStyle, NSInteger, x)
#define to_value_UITableViewRowActionStyle(x) TO_ENUM(UITableViewRowActionStyle, NSInteger, x)
#define is_value_UITableViewRowActionStyle(x) IS_ENUM(UITableViewRowActionStyle, NSInteger, x)

#define js_value_UITableViewSeparatorInsetReference(x) JS_ENUM(UITableViewSeparatorInsetReference, NSInteger, x)
#define to_value_UITableViewSeparatorInsetReference(x) TO_ENUM(UITableViewSeparatorInsetReference, NSInteger, x)
#define is_value_UITableViewSeparatorInsetReference(x) IS_ENUM(UITableViewSeparatorInsetReference, NSInteger, x)

#define js_value_UITableViewDropIntent(x) JS_ENUM(UITableViewDropIntent, NSInteger, x)
#define to_value_UITableViewDropIntent(x) TO_ENUM(UITableViewDropIntent, NSInteger, x)
#define is_value_UITableViewDropIntent(x) IS_ENUM(UITableViewDropIntent, NSInteger, x)

JS_WRAP_CLASS(UITableView, UIScrollView);
  JS_METHOD(initWithFrameStyle);
  JS_METHOD(initWithCoder);
  JS_METHOD(numberOfRowsInSection);
  JS_METHOD(rectForSection);
  JS_METHOD(rectForHeaderInSection);
  JS_METHOD(rectForFooterInSection);
  JS_METHOD(rectForRowAtIndexPath);
  JS_METHOD(indexPathForRowAtPoint);
  JS_METHOD(indexPathForCell);
  JS_METHOD(indexPathsForRowsInRect);
  JS_METHOD(cellForRowAtIndexPath);
  JS_METHOD(headerViewForSection);
  JS_METHOD(footerViewForSection);
  JS_METHOD(scrollToRowAtIndexPathAtScrollPositionAnimated);
  JS_METHOD(scrollToNearestSelectedRowAtScrollPositionAnimated);
  JS_METHOD(performBatchUpdatesCompletion);
  JS_METHOD(beginUpdates);
  JS_METHOD(endUpdates);
  JS_METHOD(insertSectionsWithRowAnimation);
  JS_METHOD(deleteSectionsWithRowAnimation);
  JS_METHOD(reloadSectionsWithRowAnimation);
  JS_METHOD(moveSectionToSection);
  JS_METHOD(insertRowsAtIndexPathsWithRowAnimation);
  JS_METHOD(deleteRowsAtIndexPathsWithRowAnimation);
  JS_METHOD(reloadRowsAtIndexPathsWithRowAnimation);
  JS_METHOD(moveRowAtIndexPathToIndexPath);
  JS_METHOD(reloadData);
  JS_METHOD(reloadSectionIndexTitles);
  JS_METHOD(setEditingAnimated);
  JS_METHOD(selectRowAtIndexPathAnimatedScrollPosition);
  JS_METHOD(deselectRowAtIndexPathAnimated);
  JS_METHOD(dequeueReusableCellWithIdentifier);
  JS_METHOD(dequeueReusableCellWithIdentifierForIndexPath);
  JS_METHOD(dequeueReusableHeaderFooterViewWithIdentifier);
  JS_METHOD(registerNibForCellReuseIdentifier);
  JS_METHOD(registerClassForCellReuseIdentifier);
  JS_METHOD(registerNibForHeaderFooterViewReuseIdentifier);
  JS_METHOD(registerClassForHeaderFooterViewReuseIdentifier);
  JS_PROP_READONLY(style);
  JS_PROP(dataSource);
  JS_PROP(delegate);
  JS_PROP(prefetchDataSource);
  JS_PROP(dragDelegate);
  JS_PROP(dropDelegate);
  JS_PROP(rowHeight);
  JS_PROP(sectionHeaderHeight);
  JS_PROP(sectionFooterHeight);
  JS_PROP(estimatedRowHeight);
  JS_PROP(estimatedSectionHeaderHeight);
  JS_PROP(estimatedSectionFooterHeight);
  JS_PROP(separatorInset);
  JS_PROP(separatorInsetReference);
  JS_PROP(backgroundView);
  JS_PROP_READONLY(numberOfSections);
  JS_PROP_READONLY(visibleCells);
  JS_PROP_READONLY(indexPathsForVisibleRows);
  JS_PROP_READONLY(hasUncommittedUpdates);
  JS_PROP(isEditing);
  JS_PROP(allowsSelection);
  JS_PROP(allowsSelectionDuringEditing);
  JS_PROP(allowsMultipleSelection);
  JS_PROP(allowsMultipleSelectionDuringEditing);
  JS_PROP_READONLY(indexPathForSelectedRow);
  JS_PROP_READONLY(indexPathsForSelectedRows);
  JS_PROP(sectionIndexMinimumDisplayRowCount);
  JS_PROP(sectionIndexColor);
  JS_PROP(sectionIndexBackgroundColor);
  JS_PROP(sectionIndexTrackingBackgroundColor);
  JS_PROP(separatorStyle);
  JS_PROP(separatorColor);
  JS_PROP(separatorEffect);
  JS_PROP(cellLayoutMarginsFollowReadableWidth);
  JS_PROP(insetsContentViewsToSafeArea);
  JS_PROP(tableHeaderView);
  JS_PROP(tableFooterView);
  JS_PROP(remembersLastFocusedIndexPath);
  JS_PROP(dragInteractionEnabled);
  JS_PROP_READONLY(hasActiveDrag);
  JS_PROP_READONLY(hasActiveDrop);
JS_WRAP_CLASS_END(UITableView);

#endif /* NUITableView_h */
