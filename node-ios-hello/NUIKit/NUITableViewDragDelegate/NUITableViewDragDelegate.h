//
//  NUITableViewDragDelegate.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDragDelegate_h
#define NUITableViewDragDelegate_h    

#include "NNSObject.h"

#define js_value_UITableViewDragDelegate(x) js_protocol_wrapper(x, UITableViewDragDelegate)
#define to_value_UITableViewDragDelegate(x) to_protocol_wrapper(x, UITableViewDragDelegate)
#define is_value_UITableViewDragDelegate(x) is_protocol_wrapper(x, UITableViewDragDelegate)

JS_WRAP_PROTOCOL(UITableViewDragDelegate, NSObject);
  JS_PROP(tableViewItemsForBeginningDragSessionAtIndexPath);
  JS_PROP(tableViewItemsForAddingToDragSessionAtIndexPathPoint);
  JS_PROP(tableViewDragPreviewParametersForRowAtIndexPath);
  JS_PROP(tableViewDragSessionWillBegin);
  JS_PROP(tableViewDragSessionDidEnd);
  JS_PROP(tableViewDragSessionAllowsMoveOperation);
  JS_PROP(tableViewDragSessionIsRestrictedToDraggingApplication);
JS_WRAP_PROTOCOL_END(UITableViewDragDelegate, NSObject);

#if __OBJC__
@interface UITableViewDragDelegateType : NSObject<UITableViewDragDelegate>

// Provide items to begin a drag associated with a given index path.
// You can use -[session locationInView:] to do additional hit testing if desired.
// If an empty array is returned a drag session will not begin.
- (NSArray<UIDragItem *> *)tableView:(UITableView *)tableView itemsForBeginningDragSession:(id<UIDragSession>)session atIndexPath:(NSIndexPath *)indexPath;

// Called to request items to add to an existing drag session in response to the add item gesture.
// You can use the provided point (in the table view's coordinate space) to do additional hit testing if desired.
// If not implemented, or if an empty array is returned, no items will be added to the drag and the gesture
// will be handled normally.
- (NSArray<UIDragItem *> *)tableView:(UITableView *)tableView itemsForAddingToDragSession:(id<UIDragSession>)session atIndexPath:(NSIndexPath *)indexPath point:(CGPoint)point;

// Allows customization of the preview used for the row when it is lifted or if the drag cancels.
// If not implemented or if nil is returned, the entire cell will be used for the preview.
- (nullable UIDragPreviewParameters *)tableView:(UITableView *)tableView dragPreviewParametersForRowAtIndexPath:(NSIndexPath *)indexPath;

// Called after the lift animation has completed to signal the start of a drag session.
// This call will always be balanced with a corresponding call to -tableView:dragSessionDidEnd:
- (void)tableView:(UITableView *)tableView dragSessionWillBegin:(id<UIDragSession>)session;

// Called to signal the end of the drag session.
- (void)tableView:(UITableView *)tableView dragSessionDidEnd:(id<UIDragSession>)session;

// Controls whether move operations are allowed for the drag session.
// If not implemented, defaults to YES.
- (BOOL)tableView:(UITableView *)tableView dragSessionAllowsMoveOperation:(id<UIDragSession>)session;

// Controls whether the drag session is restricted to the source application.
// If not implemented, defaults to NO.
- (BOOL)tableView:(UITableView *)tableView dragSessionIsRestrictedToDraggingApplication:(id<UIDragSession>)session;

@end
#endif

#endif /* NUITableViewDragDelegate_h */
