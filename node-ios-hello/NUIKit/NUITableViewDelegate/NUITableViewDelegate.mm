//
//  NUITableViewDelegate.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDelegate.h"

#define instancetype UITableViewDelegate
#define js_value_instancetype js_value_UITableViewDelegate

NUITableViewDelegate::NUITableViewDelegate() {}
NUITableViewDelegate::~NUITableViewDelegate() {}

JS_INIT_PROTOCOL(UITableViewDelegate, UIScrollViewDelegate);
  JS_ASSIGN_PROTO_PROP(tableViewWillDisplayCellForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewWillDisplayHeaderViewForSection);
  JS_ASSIGN_PROTO_PROP(tableViewWillDisplayFooterViewForSection);
  JS_ASSIGN_PROTO_PROP(tableViewDidEndDisplayingCellForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDidEndDisplayingHeaderViewForSection);
  JS_ASSIGN_PROTO_PROP(tableViewDidEndDisplayingFooterViewForSection);
  JS_ASSIGN_PROTO_PROP(tableViewHeightForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewHeightForHeaderInSection);
  JS_ASSIGN_PROTO_PROP(tableViewHeightForFooterInSection);
  JS_ASSIGN_PROTO_PROP(tableViewEstimatedHeightForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewEstimatedHeightForHeaderInSection);
  JS_ASSIGN_PROTO_PROP(tableViewEstimatedHeightForFooterInSection);
  JS_ASSIGN_PROTO_PROP(tableViewViewForHeaderInSection);
  JS_ASSIGN_PROTO_PROP(tableViewViewForFooterInSection);
#if DEPRECATED
  JS_ASSIGN_PROTO_PROP(tableViewAccessoryTypeForRowWithIndexPath);
#endif
  JS_ASSIGN_PROTO_PROP(tableViewAccessoryButtonTappedForRowWithIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewShouldHighlightRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDidHighlightRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDidUnhighlightRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewWillSelectRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewWillDeselectRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDidSelectRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDidDeselectRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewEditingStyleForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewEditActionsForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewLeadingSwipeActionsConfigurationForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewTrailingSwipeActionsConfigurationForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewShouldIndentWhileEditingRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewWillBeginEditingRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDidEndEditingRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewIndentationLevelForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewShouldShowMenuForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewCanPerformActionForRowAtIndexPathWithSender);
  JS_ASSIGN_PROTO_PROP(tableViewPerformActionForRowAtIndexPathWithSender);
  JS_ASSIGN_PROTO_PROP(tableViewCanFocusRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewShouldUpdateFocusInContext);
  JS_ASSIGN_PROTO_PROP(tableViewDidUpdateFocusInContextWithAnimationCoordinator);
  JS_ASSIGN_PROTO_PROP(indexPathForPreferredFocusedViewInTableView);
  JS_ASSIGN_PROTO_PROP(tableViewShouldSpringLoadRowAtIndexPathWithContext);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDelegate, UIScrollViewDelegate);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDelegate, UIScrollViewDelegate);


NAN_METHOD(NUITableViewDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDelegate);
  @autoreleasepool {
    id<UITableViewDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDelegateType alloc] init];
    }
    if (self) {
      NUITableViewDelegate *wrapper = new NUITableViewDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewWillDisplayCellForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewWillDisplayHeaderViewForSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewWillDisplayFooterViewForSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidEndDisplayingCellForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidEndDisplayingHeaderViewForSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidEndDisplayingFooterViewForSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewHeightForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewHeightForHeaderInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewHeightForFooterInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewEstimatedHeightForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewEstimatedHeightForHeaderInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewEstimatedHeightForFooterInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewViewForHeaderInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewViewForFooterInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewAccessoryTypeForRowWithIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewAccessoryButtonTappedForRowWithIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewShouldHighlightRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidHighlightRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidUnhighlightRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewWillSelectRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewWillDeselectRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidSelectRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidDeselectRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewEditingStyleForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewEditActionsForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewLeadingSwipeActionsConfigurationForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewTrailingSwipeActionsConfigurationForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewShouldIndentWhileEditingRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewWillBeginEditingRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidEndEditingRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewIndentationLevelForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewShouldShowMenuForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewCanPerformActionForRowAtIndexPathWithSender);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewPerformActionForRowAtIndexPathWithSender);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewCanFocusRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewShouldUpdateFocusInContext);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewDidUpdateFocusInContextWithAnimationCoordinator);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, indexPathForPreferredFocusedViewInTableView);
DELEGATE_PROTOCOL_PROP(UITableViewDelegate, tableViewShouldSpringLoadRowAtIndexPathWithContext);

#include "NUITableViewCell.h"
#include "NUITableView.h"
#include "NUIView.h"
#include "NUISwipeActionsConfiguration.h"
#include "NUITableViewFocusUpdateContext.h"
#include "NUIFocusAnimationCoordinator.h"

@implementation UITableViewDelegateType

// Display customization

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  call_delegate_async(noop(), tableViewWillDisplayCellForRowAtIndexPath,
    js_value_UITableViewCell(cell),
    js_value_NSIndexPath(indexPath));
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
  call_delegate_async(noop(), tableViewWillDisplayHeaderViewForSection,
    js_value_UIView(view),
    js_value_NSInteger(section));
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
  call_delegate_async(noop(), tableViewWillDisplayFooterViewForSection,
    js_value_UIView(view),
    js_value_NSInteger(section));
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0)
{
  call_delegate_async(noop(), tableViewDidEndDisplayingCellForRowAtIndexPath,
    js_value_UITableViewCell(cell),
    js_value_NSIndexPath(indexPath));
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
  call_delegate_async(noop(), tableViewDidEndDisplayingHeaderViewForSection,
    js_value_UIView(view),
    js_value_NSInteger(section));
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
  call_delegate_async(noop(), tableViewDidEndDisplayingFooterViewForSection,
    js_value_UIView(view),
    js_value_NSInteger(section));
}

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block CGFloat result = UITableViewAutomaticDimension; // TODO: unsure about this default.
  call_delegate(result = is_value_CGFloat(JS_RESULT) ? to_value_CGFloat(JS_RESULT) : result, tableViewHeightForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  __block CGFloat result = UITableViewAutomaticDimension;
  call_delegate(result = is_value_CGFloat(JS_RESULT) ? to_value_CGFloat(JS_RESULT) : result, tableViewHeightForHeaderInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  __block CGFloat result = UITableViewAutomaticDimension;
  call_delegate(result = is_value_CGFloat(JS_RESULT) ? to_value_CGFloat(JS_RESULT) : result, tableViewHeightForFooterInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}


// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0)
{
  __block CGFloat result = UITableViewAutomaticDimension; // TODO: unsure about this default.
  call_delegate(result = is_value_CGFloat(JS_RESULT) ? to_value_CGFloat(JS_RESULT) : result, tableViewEstimatedHeightForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0)
{
  __block CGFloat result = UITableViewAutomaticDimension;
  call_delegate(result = is_value_CGFloat(JS_RESULT) ? to_value_CGFloat(JS_RESULT) : result, tableViewEstimatedHeightForHeaderInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0)
{
  __block CGFloat result = UITableViewAutomaticDimension;
  call_delegate(result = is_value_CGFloat(JS_RESULT) ? to_value_CGFloat(JS_RESULT) : result, tableViewEstimatedHeightForFooterInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

// Section header & footer information. Views are preferred over title should you decide to provide both

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section   // custom view for header. will be adjusted to default or specified header height
{
  __block UIView* result = nil;
  call_delegate(result = is_value_UIView(JS_RESULT) ? to_value_UIView(JS_RESULT) : result, tableViewViewForHeaderInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section   // custom view for footer. will be adjusted to default or specified footer height
{
  __block UIView* result = nil;
  call_delegate(result = is_value_UIView(JS_RESULT) ? to_value_UIView(JS_RESULT) : result, tableViewViewForFooterInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

// Accessories (disclosures). 

#if DEPRECATED
/*
 node-ios-hello[49662:2207864] WARNING: Using legacy cell layout due to
 delegate implementation of tableView:accessoryTypeForRowWithIndexPath: in
 <UITableViewDelegateType: 0x6000036b9bd0>.  Please remove your implementation
 of this method and set the cell properties accessoryType and/or
 editingAccessoryType to move to the new cell layout behavior.  This method
 will no longer be called in a future release.
*/
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED
{
  __block UITableViewCellAccessoryType result = UITableViewCellAccessoryNone;
  call_delegate(result = is_value_UITableViewCellAccessoryType(JS_RESULT) ? to_value_UITableViewCellAccessoryType(JS_RESULT) : result, tableViewAccessoryTypeForRowWithIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}
#endif

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
  call_delegate_async(noop(), tableViewAccessoryButtonTappedForRowWithIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
}

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row. 
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewShouldHighlightRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
  call_delegate_async(noop(), tableViewDidHighlightRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
  call_delegate_async(noop(), tableViewDidUnhighlightRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block NSIndexPath* result = indexPath;
  call_delegate(result = is_value_NSIndexPath(JS_RESULT) ? to_value_NSIndexPath(JS_RESULT) : result, tableViewWillSelectRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0)
{
  __block NSIndexPath* result = indexPath;
  call_delegate(result = is_value_NSIndexPath(JS_RESULT) ? to_value_NSIndexPath(JS_RESULT) : result, tableViewWillDeselectRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  call_delegate_async(noop(), tableViewDidSelectRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0)
{
  call_delegate_async(noop(), tableViewDidDeselectRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
}

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block UITableViewCellEditingStyle result = UITableViewCellEditingStyleDelete;
  call_delegate(result = is_value_UITableViewCellEditingStyle(JS_RESULT) ? to_value_UITableViewCellEditingStyle(JS_RESULT) : result, tableViewEditingStyleForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED
{
  __block NSString* result = nil;
  call_delegate(result = is_value_NSString(JS_RESULT) ? to_value_NSString(JS_RESULT) : result, tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Use -tableView:trailingSwipeActionsConfigurationForRowAtIndexPath: instead of this method, which will be deprecated in a future release.
// This method supersedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED
{
  __block NSArray<UITableViewRowAction *>* result = nil;
  call_delegate(result = is_value_NSArray<UITableViewRowAction *>(JS_RESULT) ? to_value_NSArray<UITableViewRowAction *>(JS_RESULT) : result, tableViewEditActionsForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Swipe actions
// These methods supersede -editActionsForRowAtIndexPath: if implemented
// return nil to get the default swipe actions
- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos)
{
  __block UISwipeActionsConfiguration* result = nil;
  call_delegate(result = is_value_UISwipeActionsConfiguration(JS_RESULT) ? to_value_UISwipeActionsConfiguration(JS_RESULT) : result, tableViewLeadingSwipeActionsConfigurationForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos)
{
  __block UISwipeActionsConfiguration* result = nil;
  call_delegate(result = is_value_UISwipeActionsConfiguration(JS_RESULT) ? to_value_UISwipeActionsConfiguration(JS_RESULT) : result, tableViewTrailingSwipeActionsConfigurationForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewShouldIndentWhileEditingRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED
{
  call_delegate_async(noop(), tableViewWillBeginEditingRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath __TVOS_PROHIBITED
{
  call_delegate_async(noop(), tableViewDidEndEditingRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
}

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
  __block NSIndexPath* result = proposedDestinationIndexPath; // TODO: unsure about this default.
  call_delegate(result = is_value_NSIndexPath(JS_RESULT) ? to_value_NSIndexPath(JS_RESULT) : result, tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(sourceIndexPath),
    js_value_NSIndexPath(proposedDestinationIndexPath));
  return result;
}

// Indentation

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath // return 'depth' of row for hierarchies
{
  __block NSInteger result = 0; // TODO: unsure about this default.
  call_delegate(result = is_value_NSInteger(JS_RESULT) ? to_value_NSInteger(JS_RESULT) : result, tableViewIndentationLevelForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Copy/Paste.  All three methods must be implemented by the delegate.

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0)
{
  __block BOOL result = NO; // TODO: unsure about this default
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewShouldShowMenuForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0)
{
  __block BOOL result = YES; // TODO: unsure about this default
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewCanPerformActionForRowAtIndexPathWithSender,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath),
    js_value_id(sender));
  return result;
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0)
{
  call_delegate_async(noop(), tableViewPerformActionForRowAtIndexPathWithSender,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath),
    js_value_id(sender));
}

// Focus

- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0)
{
  __block BOOL result = YES; // TODO: unsure about this default
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewCanFocusRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0)
{
  __block BOOL result = YES; // TODO: unsure about this default
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewShouldUpdateFocusInContext,
    js_value_UITableView(tableView),
    js_value_UITableViewFocusUpdateContext(context));
  return result;
}

- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0)
{
  call_delegate_async(noop(), tableViewDidUpdateFocusInContextWithAnimationCoordinator,
    js_value_UITableView(tableView),
    js_value_UITableViewFocusUpdateContext(context),
    js_value_UIFocusAnimationCoordinator(coordinator));
}

- (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0)
{
  __block NSIndexPath* result = nil;
  call_delegate(result = is_value_NSIndexPath(JS_RESULT) ? to_value_NSIndexPath(JS_RESULT) : result, indexPathForPreferredFocusedViewInTableView,
    js_value_UITableView(tableView));
  return result;
}

// Spring Loading

// Allows opting-out of spring loading for an particular row.
// If you want the interaction effect on a different subview of the spring loaded cell, modify the context.targetView property. The default is the cell.
// If this method is not implemented, the default is YES except when the row is part of a drag session.
- (BOOL)tableView:(UITableView *)tableView shouldSpringLoadRowAtIndexPath:(NSIndexPath *)indexPath withContext:(id<UISpringLoadedInteractionContext>)context API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos)
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewShouldSpringLoadRowAtIndexPathWithContext,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath),
    js_value_id/* <UISpringLoadedInteractionContext>*/(context));
  return result;
}

@end
