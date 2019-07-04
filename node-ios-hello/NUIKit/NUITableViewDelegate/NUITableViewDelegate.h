//
//  NUITableViewDelegate.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDelegate_h
#define NUITableViewDelegate_h    

#include "NUIScrollViewDelegate.h"

#define js_value_UITableViewDelegate(x) js_protocol_wrapper(x, UITableViewDelegate)
#define to_value_UITableViewDelegate(x) to_protocol_wrapper(x, UITableViewDelegate)
#define is_value_UITableViewDelegate(x) is_protocol_wrapper(x, UITableViewDelegate)

JS_WRAP_PROTOCOL(UITableViewDelegate, UIScrollViewDelegate);
  JS_PROP(tableViewWillDisplayCellForRowAtIndexPath);
  JS_PROP(tableViewWillDisplayHeaderViewForSection);
  JS_PROP(tableViewWillDisplayFooterViewForSection);
  JS_PROP(tableViewDidEndDisplayingCellForRowAtIndexPath);
  JS_PROP(tableViewDidEndDisplayingHeaderViewForSection);
  JS_PROP(tableViewDidEndDisplayingFooterViewForSection);
  JS_PROP(tableViewHeightForRowAtIndexPath);
  JS_PROP(tableViewHeightForHeaderInSection);
  JS_PROP(tableViewHeightForFooterInSection);
  JS_PROP(tableViewEstimatedHeightForRowAtIndexPath);
  JS_PROP(tableViewEstimatedHeightForHeaderInSection);
  JS_PROP(tableViewEstimatedHeightForFooterInSection);
  JS_PROP(tableViewViewForHeaderInSection);
  JS_PROP(tableViewViewForFooterInSection);
  JS_PROP(tableViewAccessoryTypeForRowWithIndexPath);
  JS_PROP(tableViewAccessoryButtonTappedForRowWithIndexPath);
  JS_PROP(tableViewShouldHighlightRowAtIndexPath);
  JS_PROP(tableViewDidHighlightRowAtIndexPath);
  JS_PROP(tableViewDidUnhighlightRowAtIndexPath);
  JS_PROP(tableViewWillSelectRowAtIndexPath);
  JS_PROP(tableViewWillDeselectRowAtIndexPath);
  JS_PROP(tableViewDidSelectRowAtIndexPath);
  JS_PROP(tableViewDidDeselectRowAtIndexPath);
  JS_PROP(tableViewEditingStyleForRowAtIndexPath);
  JS_PROP(tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath);
  JS_PROP(tableViewEditActionsForRowAtIndexPath);
  JS_PROP(tableViewLeadingSwipeActionsConfigurationForRowAtIndexPath);
  JS_PROP(tableViewTrailingSwipeActionsConfigurationForRowAtIndexPath);
  JS_PROP(tableViewShouldIndentWhileEditingRowAtIndexPath);
  JS_PROP(tableViewWillBeginEditingRowAtIndexPath);
  JS_PROP(tableViewDidEndEditingRowAtIndexPath);
  JS_PROP(tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath);
  JS_PROP(tableViewIndentationLevelForRowAtIndexPath);
  JS_PROP(tableViewShouldShowMenuForRowAtIndexPath);
  JS_PROP(tableViewCanPerformActionForRowAtIndexPathWithSender);
  JS_PROP(tableViewPerformActionForRowAtIndexPathWithSender);
  JS_PROP(tableViewCanFocusRowAtIndexPath);
  JS_PROP(tableViewShouldUpdateFocusInContext);
  JS_PROP(tableViewDidUpdateFocusInContextWithAnimationCoordinator);
  JS_PROP(indexPathForPreferredFocusedViewInTableView);
  JS_PROP(tableViewShouldSpringLoadRowAtIndexPathWithContext);
JS_WRAP_PROTOCOL_END(UITableViewDelegate, UIScrollViewDelegate);

#if __OBJC__
@interface UITableViewDelegateType : NSObject<UITableViewDelegate>

// Display customization

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0);
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0);
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0);
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0);

// Section header & footer information. Views are preferred over title should you decide to provide both

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height

// Accessories (disclosures). 

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED;
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row. 
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;

// Use -tableView:trailingSwipeActionsConfigurationForRowAtIndexPath: instead of this method, which will be deprecated in a future release.
// This method supersedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;

// Swipe actions
// These methods supersede -editActionsForRowAtIndexPath: if implemented
// return nil to get the default swipe actions
- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos);
- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos);

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED;
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath __TVOS_PROHIBITED;

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;               

// Indentation

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath; // return 'depth' of row for hierarchies

// Copy/Paste.  All three methods must be implemented by the delegate.

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0);
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0);
- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0);

// Focus

- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0);
- (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0);
- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0);
- (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0);

// Spring Loading

// Allows opting-out of spring loading for an particular row.
// If you want the interaction effect on a different subview of the spring loaded cell, modify the context.targetView property. The default is the cell.
// If this method is not implemented, the default is YES except when the row is part of a drag session.
- (BOOL)tableView:(UITableView *)tableView shouldSpringLoadRowAtIndexPath:(NSIndexPath *)indexPath withContext:(id<UISpringLoadedInteractionContext>)context API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);

@end
#endif

#endif /* NUITableViewDelegate_h */
