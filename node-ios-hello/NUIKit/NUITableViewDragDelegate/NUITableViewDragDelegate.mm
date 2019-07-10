//
//  NUITableViewDragDelegate.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDragDelegate.h"

#define instancetype UITableViewDragDelegate
#define js_value_instancetype js_value_UITableViewDragDelegate

NUITableViewDragDelegate::NUITableViewDragDelegate() {}
NUITableViewDragDelegate::~NUITableViewDragDelegate() {}

JS_INIT_PROTOCOL(UITableViewDragDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(tableViewItemsForBeginningDragSessionAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewItemsForAddingToDragSessionAtIndexPathPoint);
  JS_ASSIGN_PROTO_PROP(tableViewDragPreviewParametersForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDragSessionWillBegin);
  JS_ASSIGN_PROTO_PROP(tableViewDragSessionDidEnd);
  JS_ASSIGN_PROTO_PROP(tableViewDragSessionAllowsMoveOperation);
  JS_ASSIGN_PROTO_PROP(tableViewDragSessionIsRestrictedToDraggingApplication);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDragDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDragDelegate, NSObject);

NAN_METHOD(NUITableViewDragDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDragDelegate);
  @autoreleasepool {
    id<UITableViewDragDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDragDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDragDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDragDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDragDelegateType alloc] init];
    }
    if (self) {
      NUITableViewDragDelegate *wrapper = new NUITableViewDragDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDragDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UITableViewDragDelegate, tableViewItemsForBeginningDragSessionAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDragDelegate, tableViewItemsForAddingToDragSessionAtIndexPathPoint);
DELEGATE_PROTOCOL_PROP(UITableViewDragDelegate, tableViewDragPreviewParametersForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDragDelegate, tableViewDragSessionWillBegin);
DELEGATE_PROTOCOL_PROP(UITableViewDragDelegate, tableViewDragSessionDidEnd);
DELEGATE_PROTOCOL_PROP(UITableViewDragDelegate, tableViewDragSessionAllowsMoveOperation);
DELEGATE_PROTOCOL_PROP(UITableViewDragDelegate, tableViewDragSessionIsRestrictedToDraggingApplication);

#include "NUITableView.h"
#include "NUIDragItem.h"
#include "NUIDragPreviewParameters.h"

@implementation UITableViewDragDelegateType

// Provide items to begin a drag associated with a given index path.
// You can use -[session locationInView:] to do additional hit testing if desired.
// If an empty array is returned a drag session will not begin.
- (NSArray<UIDragItem *> *)tableView:(UITableView *)tableView itemsForBeginningDragSession:(id<UIDragSession>)session atIndexPath:(NSIndexPath *)indexPath
{
  __block NSArray<UIDragItem *>* result = @[];
  call_delegate(result = is_value_NSArray<UIDragItem *>(JS_RESULT) ? to_value_NSArray<UIDragItem *>(JS_RESULT) : result, tableViewItemsForBeginningDragSessionAtIndexPath,
    js_value_UITableView(tableView),
    js_value_id/* <UIDragSession>*/(session),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Called to request items to add to an existing drag session in response to the add item gesture.
// You can use the provided point (in the table view's coordinate space) to do additional hit testing if desired.
// If not implemented, or if an empty array is returned, no items will be added to the drag and the gesture
// will be handled normally.
- (NSArray<UIDragItem *> *)tableView:(UITableView *)tableView itemsForAddingToDragSession:(id<UIDragSession>)session atIndexPath:(NSIndexPath *)indexPath point:(CGPoint)point
{
  __block NSArray<UIDragItem *>* result = @[];
  call_delegate(result = is_value_NSArray<UIDragItem *>(JS_RESULT) ? to_value_NSArray<UIDragItem *>(JS_RESULT) : result, tableViewItemsForAddingToDragSessionAtIndexPathPoint,
    js_value_UITableView(tableView),
    js_value_id/* <UIDragSession>*/(session),
    js_value_NSIndexPath(indexPath),
    js_value_CGPoint(point));
  return result;
}

// Allows customization of the preview used for the row when it is lifted or if the drag cancels.
// If not implemented or if nil is returned, the entire cell will be used for the preview.
- (nullable UIDragPreviewParameters *)tableView:(UITableView *)tableView dragPreviewParametersForRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block UIDragPreviewParameters* result = nil;
  call_delegate(result = is_value_UIDragPreviewParameters(JS_RESULT) ? to_value_UIDragPreviewParameters(JS_RESULT) : result, tableViewDragPreviewParametersForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Called after the lift animation has completed to signal the start of a drag session.
// This call will always be balanced with a corresponding call to -tableView:dragSessionDidEnd:
- (void)tableView:(UITableView *)tableView dragSessionWillBegin:(id<UIDragSession>)session
{
  call_delegate_async(noop(), tableViewDragSessionWillBegin,
    js_value_UITableView(tableView),
    js_value_id/* <UIDragSession>*/(session));
}

// Called to signal the end of the drag session.
- (void)tableView:(UITableView *)tableView dragSessionDidEnd:(id<UIDragSession>)session
{
  call_delegate_async(noop(), tableViewDragSessionDidEnd,
    js_value_UITableView(tableView),
    js_value_id/* <UIDragSession>*/(session));
}

// Controls whether move operations are allowed for the drag session.
// If not implemented, defaults to YES.
- (BOOL)tableView:(UITableView *)tableView dragSessionAllowsMoveOperation:(id<UIDragSession>)session
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewDragSessionAllowsMoveOperation,
    js_value_UITableView(tableView),
    js_value_id/* <UIDragSession>*/(session));
  return result;
}

// Controls whether the drag session is restricted to the source application.
// If not implemented, defaults to NO.
- (BOOL)tableView:(UITableView *)tableView dragSessionIsRestrictedToDraggingApplication:(id<UIDragSession>)session
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewDragSessionIsRestrictedToDraggingApplication,
    js_value_UITableView(tableView),
    js_value_id/* <UIDragSession>*/(session));
  return result;
}

@end
