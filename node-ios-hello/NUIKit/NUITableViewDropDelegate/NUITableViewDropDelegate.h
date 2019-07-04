//
//  NUITableViewDropDelegate.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDropDelegate_h
#define NUITableViewDropDelegate_h    

#include "NNSObject.h"

#define js_value_UITableViewDropDelegate(x) js_protocol_wrapper(x, UITableViewDropDelegate)
#define to_value_UITableViewDropDelegate(x) to_protocol_wrapper(x, UITableViewDropDelegate)
#define is_value_UITableViewDropDelegate(x) is_protocol_wrapper(x, UITableViewDropDelegate)

JS_WRAP_PROTOCOL(UITableViewDropDelegate, NSObject);
  JS_PROP(tableViewPerformDropWithCoordinator);
  JS_PROP(tableViewCanHandleDropSession);
  JS_PROP(tableViewDropSessionDidEnter);
  JS_PROP(tableViewDropSessionDidUpdateWithDestinationIndexPath);
  JS_PROP(tableViewDropSessionDidExit);
  JS_PROP(tableViewDropSessionDidEnd);
  JS_PROP(tableViewDropPreviewParametersForRowAtIndexPath);
JS_WRAP_PROTOCOL_END(UITableViewDropDelegate, NSObject);

#if __OBJC__
@interface UITableViewDropDelegateType : NSObject<UITableViewDropDelegate>

// Called when the user initiates the drop.
// Use the drop coordinator to access the items in the drop and the final destination index path and proposal for the drop,
// as well as specify how you wish to animate each item to its final position.
// If your implementation of this method does nothing, default drop animations will be supplied and the table view will
// revert back to its initial state before the drop session entered.
- (void)tableView:(UITableView *)tableView performDropWithCoordinator:(id<UITableViewDropCoordinator>)coordinator;

// If NO is returned no further delegate methods will be called for this drop session.
// If not implemented, a default value of YES is assumed.
- (BOOL)tableView:(UITableView *)tableView canHandleDropSession:(id<UIDropSession>)session;

// Called when the drop session begins tracking in the table view's coordinate space.
- (void)tableView:(UITableView *)tableView dropSessionDidEnter:(id<UIDropSession>)session;

// Called frequently while the drop session being tracked inside the table view's coordinate space.
// When the drop is at the end of a section, the destination index path passed will be for a row that does not yet exist (equal
// to the number of rows in that section), where an inserted row would append to the end of the section.
// The destination index path may be nil in some circumstances (e.g. when dragging over empty space where there are no cells).
// Note that in some cases your proposal may not be allowed and the system will enforce a different proposal.
// You may perform your own hit testing via -[session locationInView:]
- (UITableViewDropProposal *)tableView:(UITableView *)tableView dropSessionDidUpdate:(id<UIDropSession>)session withDestinationIndexPath:(nullable NSIndexPath *)destinationIndexPath;

// Called when the drop session is no longer being tracked inside the table view's coordinate space.
- (void)tableView:(UITableView *)tableView dropSessionDidExit:(id<UIDropSession>)session;

// Called when the drop session completed, regardless of outcome. Useful for performing any cleanup.
- (void)tableView:(UITableView *)tableView dropSessionDidEnd:(id<UIDropSession>)session;

// Allows customization of the preview used when dropping to a newly inserted row.
// If not implemented or if nil is returned, the entire cell will be used for the preview.
- (nullable UIDragPreviewParameters *)tableView:(UITableView *)tableView dropPreviewParametersForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
#endif

#endif /* NUITableViewDropDelegate_h */
