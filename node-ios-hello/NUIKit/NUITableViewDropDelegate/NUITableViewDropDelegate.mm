//
//  NUITableViewDropDelegate.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDropDelegate.h"

#define instancetype UITableViewDropDelegate
#define js_value_instancetype js_value_UITableViewDropDelegate

NUITableViewDropDelegate::NUITableViewDropDelegate() {}
NUITableViewDropDelegate::~NUITableViewDropDelegate() {}

JS_INIT_PROTOCOL(UITableViewDropDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(tableViewPerformDropWithCoordinator);
  JS_ASSIGN_PROTO_PROP(tableViewCanHandleDropSession);
  JS_ASSIGN_PROTO_PROP(tableViewDropSessionDidEnter);
  JS_ASSIGN_PROTO_PROP(tableViewDropSessionDidUpdateWithDestinationIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewDropSessionDidExit);
  JS_ASSIGN_PROTO_PROP(tableViewDropSessionDidEnd);
  JS_ASSIGN_PROTO_PROP(tableViewDropPreviewParametersForRowAtIndexPath);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDropDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDropDelegate, NSObject);

NAN_METHOD(NUITableViewDropDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDropDelegate);
  @autoreleasepool {
    id<UITableViewDropDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDropDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDropDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDropDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDropDelegateType alloc] init];
    }
    if (self) {
      NUITableViewDropDelegate *wrapper = new NUITableViewDropDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDropDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UITableViewDropDelegate, tableViewPerformDropWithCoordinator);
DELEGATE_PROTOCOL_PROP(UITableViewDropDelegate, tableViewCanHandleDropSession);
DELEGATE_PROTOCOL_PROP(UITableViewDropDelegate, tableViewDropSessionDidEnter);
DELEGATE_PROTOCOL_PROP(UITableViewDropDelegate, tableViewDropSessionDidUpdateWithDestinationIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDropDelegate, tableViewDropSessionDidExit);
DELEGATE_PROTOCOL_PROP(UITableViewDropDelegate, tableViewDropSessionDidEnd);
DELEGATE_PROTOCOL_PROP(UITableViewDropDelegate, tableViewDropPreviewParametersForRowAtIndexPath);

#include "NUITableView.h"
#include "NUITableViewDropCoordinator.h"
#include "NUIDropSession.h"
#include "NUITableViewDropProposal.h"
#include "NUIDragPreviewParameters.h"

@implementation UITableViewDropDelegateType

// Called when the user initiates the drop.
// Use the drop coordinator to access the items in the drop and the final destination index path and proposal for the drop,
// as well as specify how you wish to animate each item to its final position.
// If your implementation of this method does nothing, default drop animations will be supplied and the table view will
// revert back to its initial state before the drop session entered.
- (void)tableView:(UITableView *)tableView performDropWithCoordinator:(id<UITableViewDropCoordinator>)coordinator
{
  call_delegate_async(noop(), tableViewPerformDropWithCoordinator,
    js_value_UITableView(tableView),
    js_value_UITableViewDropCoordinator(coordinator));
}

// If NO is returned no further delegate methods will be called for this drop session.
// If not implemented, a default value of YES is assumed.
- (BOOL)tableView:(UITableView *)tableView canHandleDropSession:(id<UIDropSession>)session
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewCanHandleDropSession,
    js_value_UITableView(tableView),
    js_value_UIDropSession(session));
  return result;
}

// Called when the drop session begins tracking in the table view's coordinate space.
- (void)tableView:(UITableView *)tableView dropSessionDidEnter:(id<UIDropSession>)session
{
  call_delegate_async(noop(), tableViewDropSessionDidEnter,
    js_value_UITableView(tableView),
    js_value_UIDropSession(session));
}

// Called frequently while the drop session being tracked inside the table view's coordinate space.
// When the drop is at the end of a section, the destination index path passed will be for a row that does not yet exist (equal
// to the number of rows in that section), where an inserted row would append to the end of the section.
// The destination index path may be nil in some circumstances (e.g. when dragging over empty space where there are no cells).
// Note that in some cases your proposal may not be allowed and the system will enforce a different proposal.
// You may perform your own hit testing via -[session locationInView:]
- (UITableViewDropProposal *)tableView:(UITableView *)tableView dropSessionDidUpdate:(id<UIDropSession>)session withDestinationIndexPath:(nullable NSIndexPath *)destinationIndexPath
{
  __block UITableViewDropProposal* result = nil;
  call_delegate(result = is_value_UITableViewDropProposal(JS_RESULT) ? to_value_UITableViewDropProposal(JS_RESULT) : result, tableViewDropSessionDidUpdateWithDestinationIndexPath,
    js_value_UITableView(tableView),
    js_value_UIDropSession(session),
    js_value_NSIndexPath(destinationIndexPath));
  return result;
}

// Called when the drop session is no longer being tracked inside the table view's coordinate space.
- (void)tableView:(UITableView *)tableView dropSessionDidExit:(id<UIDropSession>)session
{
  call_delegate_async(noop(), tableViewDropSessionDidExit,
    js_value_UITableView(tableView),
    js_value_UIDropSession(session));
}

// Called when the drop session completed, regardless of outcome. Useful for performing any cleanup.
- (void)tableView:(UITableView *)tableView dropSessionDidEnd:(id<UIDropSession>)session
{
  call_delegate_async(noop(), tableViewDropSessionDidEnd,
    js_value_UITableView(tableView),
    js_value_UIDropSession(session));
}

// Allows customization of the preview used when dropping to a newly inserted row.
// If not implemented or if nil is returned, the entire cell will be used for the preview.
- (nullable UIDragPreviewParameters *)tableView:(UITableView *)tableView dropPreviewParametersForRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block UIDragPreviewParameters* result = nil;
  call_delegate(result = is_value_UIDragPreviewParameters(JS_RESULT) ? to_value_UIDragPreviewParameters(JS_RESULT) : result, tableViewDropPreviewParametersForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  
  return result;
}

@end
