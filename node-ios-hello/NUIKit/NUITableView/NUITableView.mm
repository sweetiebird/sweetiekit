//
//  NUITableView.mm
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableView.h"

#define instancetype UITableView
#define js_value_instancetype js_value_UITableView

NUITableView::NUITableView() {}
NUITableView::~NUITableView() {}

JS_INIT_CLASS(UITableView, UIScrollView);
  JS_ASSIGN_PROTO_METHOD(initWithFrameStyle);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(numberOfRowsInSection);
  JS_ASSIGN_PROTO_METHOD(rectForSection);
  JS_ASSIGN_PROTO_METHOD(rectForHeaderInSection);
  JS_ASSIGN_PROTO_METHOD(rectForFooterInSection);
  JS_ASSIGN_PROTO_METHOD(rectForRowAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(indexPathForRowAtPoint);
  JS_ASSIGN_PROTO_METHOD(indexPathForCell);
  JS_ASSIGN_PROTO_METHOD(indexPathsForRowsInRect);
  JS_ASSIGN_PROTO_METHOD(cellForRowAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(headerViewForSection);
  JS_ASSIGN_PROTO_METHOD(footerViewForSection);
  JS_ASSIGN_PROTO_METHOD(scrollToRowAtIndexPathAtScrollPositionAnimated);
  JS_ASSIGN_PROTO_METHOD(scrollToNearestSelectedRowAtScrollPositionAnimated);
  JS_ASSIGN_PROTO_METHOD(performBatchUpdatesCompletion);
  JS_ASSIGN_PROTO_METHOD(beginUpdates);
  JS_ASSIGN_PROTO_METHOD(endUpdates);
  JS_ASSIGN_PROTO_METHOD(insertSectionsWithRowAnimation);
  JS_ASSIGN_PROTO_METHOD(deleteSectionsWithRowAnimation);
  JS_ASSIGN_PROTO_METHOD(reloadSectionsWithRowAnimation);
  JS_ASSIGN_PROTO_METHOD(moveSectionToSection);
  JS_ASSIGN_PROTO_METHOD(insertRowsAtIndexPathsWithRowAnimation);
  JS_ASSIGN_PROTO_METHOD(deleteRowsAtIndexPathsWithRowAnimation);
  JS_ASSIGN_PROTO_METHOD(reloadRowsAtIndexPathsWithRowAnimation);
  JS_ASSIGN_PROTO_METHOD(moveRowAtIndexPathToIndexPath);
  JS_ASSIGN_PROTO_METHOD(reloadData);
  JS_ASSIGN_PROTO_METHOD(reloadSectionIndexTitles);
  JS_ASSIGN_PROTO_METHOD(setEditingAnimated);
  JS_ASSIGN_PROTO_METHOD(selectRowAtIndexPathAnimatedScrollPosition);
  JS_ASSIGN_PROTO_METHOD(deselectRowAtIndexPathAnimated);
  JS_ASSIGN_PROTO_METHOD(dequeueReusableCellWithIdentifier);
  JS_ASSIGN_PROTO_METHOD(dequeueReusableCellWithIdentifierForIndexPath);
  JS_ASSIGN_PROTO_METHOD(dequeueReusableHeaderFooterViewWithIdentifier);
  JS_ASSIGN_PROTO_METHOD(registerNibForCellReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(registerClassForCellReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(registerNibForHeaderFooterViewReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(registerClassForHeaderFooterViewReuseIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(style);
  JS_ASSIGN_PROTO_PROP(dataSource);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(prefetchDataSource);
  JS_ASSIGN_PROTO_PROP(dragDelegate);
  JS_ASSIGN_PROTO_PROP(dropDelegate);
  JS_ASSIGN_PROTO_PROP(rowHeight);
  JS_ASSIGN_PROTO_PROP(sectionHeaderHeight);
  JS_ASSIGN_PROTO_PROP(sectionFooterHeight);
  JS_ASSIGN_PROTO_PROP(estimatedRowHeight);
  JS_ASSIGN_PROTO_PROP(estimatedSectionHeaderHeight);
  JS_ASSIGN_PROTO_PROP(estimatedSectionFooterHeight);
  JS_ASSIGN_PROTO_PROP(separatorInset);
  JS_ASSIGN_PROTO_PROP(separatorInsetReference);
  JS_ASSIGN_PROTO_PROP(backgroundView);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfSections);
  JS_ASSIGN_PROTO_PROP_READONLY(visibleCells);
  JS_ASSIGN_PROTO_PROP_READONLY(indexPathsForVisibleRows);
  JS_ASSIGN_PROTO_PROP_READONLY(hasUncommittedUpdates);
  JS_ASSIGN_PROTO_PROP(isEditing);
  JS_ASSIGN_PROTO_PROP(allowsSelection);
  JS_ASSIGN_PROTO_PROP(allowsSelectionDuringEditing);
  JS_ASSIGN_PROTO_PROP(allowsMultipleSelection);
  JS_ASSIGN_PROTO_PROP(allowsMultipleSelectionDuringEditing);
  JS_ASSIGN_PROTO_PROP_READONLY(indexPathForSelectedRow);
  JS_ASSIGN_PROTO_PROP_READONLY(indexPathsForSelectedRows);
  JS_ASSIGN_PROTO_PROP(sectionIndexMinimumDisplayRowCount);
  JS_ASSIGN_PROTO_PROP(sectionIndexColor);
  JS_ASSIGN_PROTO_PROP(sectionIndexBackgroundColor);
  JS_ASSIGN_PROTO_PROP(sectionIndexTrackingBackgroundColor);
  JS_ASSIGN_PROTO_PROP(separatorStyle);
  JS_ASSIGN_PROTO_PROP(separatorColor);
  JS_ASSIGN_PROTO_PROP(separatorEffect);
  JS_ASSIGN_PROTO_PROP(cellLayoutMarginsFollowReadableWidth);
  JS_ASSIGN_PROTO_PROP(insetsContentViewsToSafeArea);
  JS_ASSIGN_PROTO_PROP(tableHeaderView);
  JS_ASSIGN_PROTO_PROP(tableFooterView);
  JS_ASSIGN_PROTO_PROP(remembersLastFocusedIndexPath);
  JS_ASSIGN_PROTO_PROP(dragInteractionEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(hasActiveDrag);
  JS_ASSIGN_PROTO_PROP_READONLY(hasActiveDrop);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableView, UIScrollView);
  // constants (exports)
  
//typedef NS_ENUM(NSInteger, UITableViewStyle) {
  JS_ASSIGN_ENUM(UITableViewStylePlain, NSInteger);          // regular table view
  JS_ASSIGN_ENUM(UITableViewStyleGrouped, NSInteger);        // preferences style table view
//};

//typedef NS_ENUM(NSInteger, UITableViewScrollPosition) {
  JS_ASSIGN_ENUM(UITableViewScrollPositionNone, NSInteger);
  JS_ASSIGN_ENUM(UITableViewScrollPositionTop, NSInteger);    
  JS_ASSIGN_ENUM(UITableViewScrollPositionMiddle, NSInteger);   
  JS_ASSIGN_ENUM(UITableViewScrollPositionBottom, NSInteger);
//};                // scroll so row of interest is completely visible at top/center/bottom of view

//typedef NS_ENUM(NSInteger, UITableViewRowAnimation) {
  JS_ASSIGN_ENUM(UITableViewRowAnimationFade, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationRight, NSInteger);           // slide in from right (or out to right)
  JS_ASSIGN_ENUM(UITableViewRowAnimationLeft, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationTop, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationBottom, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationNone, NSInteger);            // available in iOS 3.0
  JS_ASSIGN_ENUM(UITableViewRowAnimationMiddle, NSInteger);          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
  JS_ASSIGN_ENUM(UITableViewRowAnimationAutomatic, NSInteger); // = 100  // available in iOS 5.0.  chooses an appropriate animation style for you
//};

// Including this constant string in the array of strings returned by sectionIndexTitlesForTableView: will cause a magnifying glass icon to be displayed at that location in the index.
// This should generally only be used as the first title in the index.
//UIKIT_EXTERN NSString *const UITableViewIndexSearch NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UITableViewIndexSearch, NSString);

// Returning this value from tableView:heightForHeaderInSection: or tableView:heightForFooterInSection: results in a height that fits the value returned from
// tableView:titleForHeaderInSection: or tableView:titleForFooterInSection: if the title is not nil.
//UIKIT_EXTERN const CGFloat UITableViewAutomaticDimension NS_AVAILABLE_IOS(5_0);
  JS_ASSIGN_ENUM(UITableViewAutomaticDimension, CGFloat);

//typedef NS_ENUM(NSInteger, UITableViewRowActionStyle) {
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDefault, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDestructive, NSInteger); //  = UITableViewRowActionStyleDefault,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleNormal, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UITableViewRowActionStyle) {
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDefault, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDestructive, NSInteger); //  = UITableViewRowActionStyleDefault,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleNormal, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UITableViewSeparatorInsetReference) {
  // The value set to the separatorInset property is interpreted as an offset from the edges of the cell.
  JS_ASSIGN_ENUM(UITableViewSeparatorInsetFromCellEdges, NSInteger);
  
  // The value set to the separatorInset property is interpreted as an offset from the automatic separator insets.
  JS_ASSIGN_ENUM(UITableViewSeparatorInsetFromAutomaticInsets, NSInteger);
//} API_AVAILABLE(ios(11.0), tvos(11.0));

//typedef NS_ENUM(NSInteger, UITableViewDropIntent) {
  // Table view will accept the drop, but the location is not yet known and will be determined later.
  // Will not open a gap. You may wish to provide some visual treatment to communicate this to the user.
  JS_ASSIGN_ENUM(UITableViewDropIntentUnspecified, NSInteger);
  
  // The drop will be placed in row(s) inserted at the destination index path.
  // Opens a gap at the specified location simulating the final dropped layout.
  JS_ASSIGN_ENUM(UITableViewDropIntentInsertAtDestinationIndexPath, NSInteger);
  
  // The drop will be placed inside the row at the destination index path (e.g. the row is a container of other items).
  // Will not open a gap. Table view will highlight the row at the destination index path.
  JS_ASSIGN_ENUM(UITableViewDropIntentInsertIntoDestinationIndexPath, NSInteger);
  
  // The table view will automatically choose between .insertAtDestinationIndexPath and
  // .insertIntoDestinationIndexPath depending on the position of the drop. This should be used instead
  // of .insertIntoDestinationIndexPath when the item being dropped can either be placed inside the row
  // at the destination index path or inserted in a new row at the index path of the container row.
  JS_ASSIGN_ENUM(UITableViewDropIntentAutomatic, NSInteger);
//} API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);

JS_INIT_CLASS_END(UITableView, UIScrollView);

NAN_METHOD(NUITableView::New) {
  JS_RECONSTRUCT(UITableView);
  @autoreleasepool {
    UITableView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITableView *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_CGRect(info[0])) {
      declare_args();
      declare_value(CGRect, frame);
      declare_optional_value(UITableViewStyle, style, UITableViewStylePlain);
      self = [[UITableView alloc] initWithFrame:frame style:style];
    } else if (info.Length() <= 0) {
      self = [[UITableView alloc] init];
    }
    if (self) {
      NUITableView *wrapper = new NUITableView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITableView::initWithFrameStyle) {
  JS_UNWRAP_OR_ALLOC(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    declare_value(UITableViewStyle, style);
    JS_SET_RETURN(js_value_instancetype([self initWithFrame: frame style: style]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUITableView::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUITableView::numberOfRowsInSection) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_NSInteger([self numberOfRowsInSection: section]));
  }
}

NAN_METHOD(NUITableView::rectForSection) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_CGRect([self rectForSection: section]));
  }
}

NAN_METHOD(NUITableView::rectForHeaderInSection) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_CGRect([self rectForHeaderInSection: section]));
  }
}

NAN_METHOD(NUITableView::rectForFooterInSection) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_CGRect([self rectForFooterInSection: section]));
  }
}

NAN_METHOD(NUITableView::rectForRowAtIndexPath) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_CGRect([self rectForRowAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUITableView::indexPathForRowAtPoint) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathForRowAtPoint: point]));
  }
}

#include "NUITableViewCell.h"

NAN_METHOD(NUITableView::indexPathForCell) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITableViewCell, cell);
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathForCell: cell]));
  }
}

NAN_METHOD(NUITableView::indexPathsForRowsInRect) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForRowsInRect: rect]));
  }
}

NAN_METHOD(NUITableView::cellForRowAtIndexPath) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UITableViewCell([self cellForRowAtIndexPath: indexPath]));
  }
}

#include "NUITableViewHeaderFooterView.h"

NAN_METHOD(NUITableView::headerViewForSection) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_UITableViewHeaderFooterView([self headerViewForSection: section]));
  }
}

NAN_METHOD(NUITableView::footerViewForSection) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_UITableViewHeaderFooterView([self footerViewForSection: section]));
  }
}

NAN_METHOD(NUITableView::scrollToRowAtIndexPathAtScrollPositionAnimated) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_value(UITableViewScrollPosition, scrollPosition);
    declare_value(BOOL, animated);
    [self scrollToRowAtIndexPath: indexPath atScrollPosition: scrollPosition animated: animated];
  }
}

NAN_METHOD(NUITableView::scrollToNearestSelectedRowAtScrollPositionAnimated) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITableViewScrollPosition, scrollPosition);
    declare_value(BOOL, animated);
    [self scrollToNearestSelectedRowAtScrollPosition: scrollPosition animated: animated];
  }
}

NAN_METHOD(NUITableView::performBatchUpdatesCompletion) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(updates);
    declare_callback(completion);
    [self performBatchUpdates:^{
      dispatch_main(^{
        if (updates) {
          [updates jsFunction]->Call("NUITableView::performBatchUpdatesCompletion::updates");
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUITableView::performBatchUpdatesCompletion::completion",
            js_value_BOOL(finished));
        }
        if (finished) {
          clear_callback(updates);
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUITableView::beginUpdates) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    [self beginUpdates];
  }
}

NAN_METHOD(NUITableView::endUpdates) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    [self endUpdates];
  }
}

#include "NNSIndexSet.h"

NAN_METHOD(NUITableView::insertSectionsWithRowAnimation) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, sections);
    declare_value(UITableViewRowAnimation, animation);
    [self insertSections: sections withRowAnimation: animation];
  }
}

NAN_METHOD(NUITableView::deleteSectionsWithRowAnimation) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, sections);
    declare_value(UITableViewRowAnimation, animation);
    [self deleteSections: sections withRowAnimation: animation];
  }
}

NAN_METHOD(NUITableView::reloadSectionsWithRowAnimation) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexSet, sections);
    declare_value(UITableViewRowAnimation, animation);
    [self reloadSections: sections withRowAnimation: animation];
  }
}

NAN_METHOD(NUITableView::moveSectionToSection) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, section);
    declare_value(NSInteger, newSection);
    [self moveSection: section toSection: newSection];
  }
}

NAN_METHOD(NUITableView::insertRowsAtIndexPathsWithRowAnimation) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    declare_value(UITableViewRowAnimation, animation);
    [self insertRowsAtIndexPaths: indexPaths withRowAnimation: animation];
  }
}

NAN_METHOD(NUITableView::deleteRowsAtIndexPathsWithRowAnimation) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    declare_value(UITableViewRowAnimation, animation);
    [self deleteRowsAtIndexPaths: indexPaths withRowAnimation: animation];
  }
}

NAN_METHOD(NUITableView::reloadRowsAtIndexPathsWithRowAnimation) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    declare_value(UITableViewRowAnimation, animation);
    [self reloadRowsAtIndexPaths: indexPaths withRowAnimation: animation];
  }
}

NAN_METHOD(NUITableView::moveRowAtIndexPathToIndexPath) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_pointer(NSIndexPath, newIndexPath);
    [self moveRowAtIndexPath: indexPath toIndexPath: newIndexPath];
  }
}

NAN_METHOD(NUITableView::reloadData) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    [self reloadData];
  }
}

NAN_METHOD(NUITableView::reloadSectionIndexTitles) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    [self reloadSectionIndexTitles];
  }
}

NAN_METHOD(NUITableView::setEditingAnimated) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, editing);
    declare_value(BOOL, animated);
    [self setEditing: editing animated: animated];
  }
}

NAN_METHOD(NUITableView::selectRowAtIndexPathAnimatedScrollPosition) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSIndexPath, indexPath);
    declare_value(BOOL, animated);
    declare_value(UITableViewScrollPosition, scrollPosition);
    [self selectRowAtIndexPath: indexPath animated: animated scrollPosition: scrollPosition];
  }
}

NAN_METHOD(NUITableView::deselectRowAtIndexPathAnimated) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_value(BOOL, animated);
    [self deselectRowAtIndexPath: indexPath animated: animated];
  }
}

NAN_METHOD(NUITableView::dequeueReusableCellWithIdentifier) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_UITableViewCell([self dequeueReusableCellWithIdentifier: identifier]));
  }
}

NAN_METHOD(NUITableView::dequeueReusableCellWithIdentifierForIndexPath) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_UITableViewCell([self dequeueReusableCellWithIdentifier: identifier forIndexPath: indexPath]));
  }
}

NAN_METHOD(NUITableView::dequeueReusableHeaderFooterViewWithIdentifier) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_UITableViewHeaderFooterView([self dequeueReusableHeaderFooterViewWithIdentifier: identifier]));
  }
}

#include "NUINib.h"

NAN_METHOD(NUITableView::registerNibForCellReuseIdentifier) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UINib, nib);
    declare_pointer(NSString, identifier);
    [self registerNib: nib forCellReuseIdentifier: identifier];
  }
}

NAN_METHOD(NUITableView::registerClassForCellReuseIdentifier) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* Class*/, cellClass);
    declare_pointer(NSString, identifier);
    [self registerClass: cellClass forCellReuseIdentifier: identifier];
  }
}

NAN_METHOD(NUITableView::registerNibForHeaderFooterViewReuseIdentifier) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UINib, nib);
    declare_pointer(NSString, identifier);
    [self registerNib: nib forHeaderFooterViewReuseIdentifier: identifier];
  }
}

NAN_METHOD(NUITableView::registerClassForHeaderFooterViewReuseIdentifier) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* Class*/, aClass);
    declare_pointer(NSString, identifier);
    [self registerClass: aClass forHeaderFooterViewReuseIdentifier: identifier];
  }
}

NAN_GETTER(NUITableView::styleGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewStyle([self style]));
  }
}

#include "NUITableViewDataSource.h"

NAN_GETTER(NUITableView::dataSourceGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewDataSource([self dataSource]));
  }
}

NAN_SETTER(NUITableView::dataSourceSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UITableViewDataSource, input);
    [self setDataSource: input];
    [self associateValue:input withKey:@"NUITableView::dataSource"];
  }
}

#include "NUITableViewDelegate.h"

NAN_GETTER(NUITableView::delegateGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewDelegate([self delegate]));
  }
}

NAN_SETTER(NUITableView::delegateSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UITableViewDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NUITableView::delegate"];
  }
}

#include "NUITableViewDataSourcePrefetching.h"

NAN_GETTER(NUITableView::prefetchDataSourceGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewDataSourcePrefetching([self prefetchDataSource]));
  }
}

NAN_SETTER(NUITableView::prefetchDataSourceSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UITableViewDataSourcePrefetching, input);
    [self setPrefetchDataSource: input];
    [self associateValue:input withKey:@"NUITableView::prefetchDataSource"];
  }
}

#include "NUITableViewDragDelegate.h"

NAN_GETTER(NUITableView::dragDelegateGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewDragDelegate([self dragDelegate]));
  }
}

NAN_SETTER(NUITableView::dragDelegateSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UITableViewDragDelegate, input);
    [self setDragDelegate: input];
    [self associateValue:input withKey:@"NUITableView::dragDelegate"];
  }
}

#include "NUITableViewDropDelegate.h"

NAN_GETTER(NUITableView::dropDelegateGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewDropDelegate([self dropDelegate]));
  }
}

NAN_SETTER(NUITableView::dropDelegateSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UITableViewDropDelegate, input);
    [self setDropDelegate: input];
    [self associateValue:input withKey:@"NUITableView::dropDelegate"];
  }
}

NAN_GETTER(NUITableView::rowHeightGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self rowHeight]));
  }
}

NAN_SETTER(NUITableView::rowHeightSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setRowHeight: input];
  }
}

NAN_GETTER(NUITableView::sectionHeaderHeightGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self sectionHeaderHeight]));
  }
}

NAN_SETTER(NUITableView::sectionHeaderHeightSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSectionHeaderHeight: input];
  }
}

NAN_GETTER(NUITableView::sectionFooterHeightGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self sectionFooterHeight]));
  }
}

NAN_SETTER(NUITableView::sectionFooterHeightSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSectionFooterHeight: input];
  }
}

NAN_GETTER(NUITableView::estimatedRowHeightGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self estimatedRowHeight]));
  }
}

NAN_SETTER(NUITableView::estimatedRowHeightSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEstimatedRowHeight: input];
  }
}

NAN_GETTER(NUITableView::estimatedSectionHeaderHeightGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self estimatedSectionHeaderHeight]));
  }
}

NAN_SETTER(NUITableView::estimatedSectionHeaderHeightSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEstimatedSectionHeaderHeight: input];
  }
}

NAN_GETTER(NUITableView::estimatedSectionFooterHeightGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self estimatedSectionFooterHeight]));
  }
}

NAN_SETTER(NUITableView::estimatedSectionFooterHeightSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEstimatedSectionFooterHeight: input];
  }
}

NAN_GETTER(NUITableView::separatorInsetGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self separatorInset]));
  }
}

NAN_SETTER(NUITableView::separatorInsetSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setSeparatorInset: input];
  }
}

NAN_GETTER(NUITableView::separatorInsetReferenceGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewSeparatorInsetReference([self separatorInsetReference]));
  }
}

NAN_SETTER(NUITableView::separatorInsetReferenceSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITableViewSeparatorInsetReference, input);
    [self setSeparatorInsetReference: input];
  }
}

NAN_GETTER(NUITableView::backgroundViewGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self backgroundView]));
  }
}

NAN_SETTER(NUITableView::backgroundViewSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setBackgroundView: input];
  }
}

NAN_GETTER(NUITableView::numberOfSectionsGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self numberOfSections]));
  }
}

NAN_GETTER(NUITableView::visibleCellsGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UITableViewCell*>([self visibleCells]));
  }
}

NAN_GETTER(NUITableView::indexPathsForVisibleRowsGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForVisibleRows]));
  }
}

NAN_GETTER(NUITableView::hasUncommittedUpdatesGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasUncommittedUpdates]));
  }
}

NAN_GETTER(NUITableView::isEditingGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEditing]));
  }
}

NAN_SETTER(NUITableView::isEditingSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEditing: input];
  }
}

NAN_GETTER(NUITableView::allowsSelectionGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsSelection]));
  }
}

NAN_SETTER(NUITableView::allowsSelectionSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsSelection: input];
  }
}

NAN_GETTER(NUITableView::allowsSelectionDuringEditingGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsSelectionDuringEditing]));
  }
}

NAN_SETTER(NUITableView::allowsSelectionDuringEditingSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsSelectionDuringEditing: input];
  }
}

NAN_GETTER(NUITableView::allowsMultipleSelectionGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsMultipleSelection]));
  }
}

NAN_SETTER(NUITableView::allowsMultipleSelectionSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsMultipleSelection: input];
  }
}

NAN_GETTER(NUITableView::allowsMultipleSelectionDuringEditingGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsMultipleSelectionDuringEditing]));
  }
}

NAN_SETTER(NUITableView::allowsMultipleSelectionDuringEditingSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsMultipleSelectionDuringEditing: input];
  }
}

NAN_GETTER(NUITableView::indexPathForSelectedRowGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathForSelectedRow]));
  }
}

NAN_GETTER(NUITableView::indexPathsForSelectedRowsGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self indexPathsForSelectedRows]));
  }
}

NAN_GETTER(NUITableView::sectionIndexMinimumDisplayRowCountGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self sectionIndexMinimumDisplayRowCount]));
  }
}

NAN_SETTER(NUITableView::sectionIndexMinimumDisplayRowCountSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setSectionIndexMinimumDisplayRowCount: input];
  }
}

NAN_GETTER(NUITableView::sectionIndexColorGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self sectionIndexColor]));
  }
}

NAN_SETTER(NUITableView::sectionIndexColorSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setSectionIndexColor: input];
  }
}

NAN_GETTER(NUITableView::sectionIndexBackgroundColorGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self sectionIndexBackgroundColor]));
  }
}

NAN_SETTER(NUITableView::sectionIndexBackgroundColorSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setSectionIndexBackgroundColor: input];
  }
}

NAN_GETTER(NUITableView::sectionIndexTrackingBackgroundColorGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self sectionIndexTrackingBackgroundColor]));
  }
}

NAN_SETTER(NUITableView::sectionIndexTrackingBackgroundColorSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setSectionIndexTrackingBackgroundColor: input];
  }
}

NAN_GETTER(NUITableView::separatorStyleGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewCellSeparatorStyle([self separatorStyle]));
  }
}

NAN_SETTER(NUITableView::separatorStyleSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITableViewCellSeparatorStyle, input);
    [self setSeparatorStyle: input];
  }
}

NAN_GETTER(NUITableView::separatorColorGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self separatorColor]));
  }
}

NAN_SETTER(NUITableView::separatorColorSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setSeparatorColor: input];
  }
}

#include "NUIVisualEffect.h"

NAN_GETTER(NUITableView::separatorEffectGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIVisualEffect([self separatorEffect]));
  }
}

NAN_SETTER(NUITableView::separatorEffectSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIVisualEffect, input);
    [self setSeparatorEffect: input];
  }
}

NAN_GETTER(NUITableView::cellLayoutMarginsFollowReadableWidthGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self cellLayoutMarginsFollowReadableWidth]));
  }
}

NAN_SETTER(NUITableView::cellLayoutMarginsFollowReadableWidthSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCellLayoutMarginsFollowReadableWidth: input];
  }
}

NAN_GETTER(NUITableView::insetsContentViewsToSafeAreaGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self insetsContentViewsToSafeArea]));
  }
}

NAN_SETTER(NUITableView::insetsContentViewsToSafeAreaSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInsetsContentViewsToSafeArea: input];
  }
}

NAN_GETTER(NUITableView::tableHeaderViewGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self tableHeaderView]));
  }
}

NAN_SETTER(NUITableView::tableHeaderViewSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setTableHeaderView: input];
  }
}

NAN_GETTER(NUITableView::tableFooterViewGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self tableFooterView]));
  }
}

NAN_SETTER(NUITableView::tableFooterViewSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setTableFooterView: input];
  }
}

NAN_GETTER(NUITableView::remembersLastFocusedIndexPathGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self remembersLastFocusedIndexPath]));
  }
}

NAN_SETTER(NUITableView::remembersLastFocusedIndexPathSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRemembersLastFocusedIndexPath: input];
  }
}

NAN_GETTER(NUITableView::dragInteractionEnabledGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self dragInteractionEnabled]));
  }
}

NAN_SETTER(NUITableView::dragInteractionEnabledSetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDragInteractionEnabled: input];
  }
}

NAN_GETTER(NUITableView::hasActiveDragGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasActiveDrag]));
  }
}

NAN_GETTER(NUITableView::hasActiveDropGetter) {
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasActiveDrop]));
  }
}
