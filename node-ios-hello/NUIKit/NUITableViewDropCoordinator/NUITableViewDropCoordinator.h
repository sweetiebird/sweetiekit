//
//  NUITableViewDropCoordinator.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDropCoordinator_h
#define NUITableViewDropCoordinator_h    

#include "NNSObject.h"

#define js_value_UITableViewDropCoordinator(x) js_protocol_wrapper(x, UITableViewDropCoordinator)
#define to_value_UITableViewDropCoordinator(x) to_protocol_wrapper(x, UITableViewDropCoordinator)
#define is_value_UITableViewDropCoordinator(x) is_protocol_wrapper(x, UITableViewDropCoordinator)

JS_WRAP_PROTOCOL(UITableViewDropCoordinator, NSObject);
  JS_PROP(dropItemToPlaceholder);
  JS_PROP(dropItemToRowAtIndexPath);
  JS_PROP(dropItemIntoRowAtIndexPathRect);
  JS_PROP(dropItemToTarget);
  JS_PROP_READONLY(items);
  JS_PROP_READONLY(destinationIndexPath);
  JS_PROP_READONLY(proposal);
  JS_PROP_READONLY(session);
JS_WRAP_PROTOCOL_END(UITableViewDropCoordinator, NSObject);

#if __OBJC__
@interface UITableViewDropCoordinatorType : NSObject<UITableViewDropCoordinator>

// Ordered list of items available for this drop.
@property (nonatomic, readonly) NSArray<id<UITableViewDropItem>> *items;

// The last hit-tested index path known during the drop session.
// When the drop is at the end of a section, this index path will be for a row that does not yet exist (equal
// to the number of rows in that section), where an inserted row would append to the end of the section.
// This index path may be nil in some circumstances (e.g. when dragging over empty space where there are no cells),
// and if it is nil, the proposal's intent will always be UITableViewDropIntentUnspecified.
@property (nonatomic, readonly, nullable) NSIndexPath *destinationIndexPath;

// The current drop proposal at the time of the drop.
@property (nonatomic, readonly) UITableViewDropProposal *proposal;

// The drop session.
@property (nonatomic, readonly) id<UIDropSession> session;

// Animate the dragItem to an automatically inserted placeholder row.
// Once the dragItem data is available, you can exchange the temporary placeholder cell with the final cell using the placeholder context
// method -commitInsertionWithDataSourceUpdates:
- (id<UITableViewDropPlaceholderContext>)dropItem:(UIDragItem *)dragItem toPlaceholder:(UITableViewDropPlaceholder *)placeholder;

// Animate the dragItem to a row that you inserted at this index path.
// You must call -performBatchUpdates:completion: to update your data source and insert a new row into the table view prior to calling this method.
// If desired, use the drop delegate method -tableView:dropPreviewParametersForRowAtIndexPath: to provide preview parameters.
- (id<UIDragAnimating>)dropItem:(UIDragItem *)dragItem toRowAtIndexPath:(NSIndexPath *)indexPath;

// Animate the dragItem to a rect inside an existing row.
// The rect is in the coordinate space of the cell at this index path.
// The item will be animated with an aspect fit scale transform to fit inside the rect. Use a rect with zero size to shrink the item to a single point.
- (id<UIDragAnimating>)dropItem:(UIDragItem *)dragItem intoRowAtIndexPath:(NSIndexPath *)indexPath rect:(CGRect)rect;

// Animate the dragItem to a location specified by the UIDragPreviewTarget.
// The -[UITableViewDropItem previewSize] may be helpful to compute an appropriate transform.
- (id<UIDragAnimating>)dropItem:(UIDragItem *)dragItem toTarget:(UIDragPreviewTarget *)target;

@end
#endif

#endif /* NUITableViewDropCoordinator_h */
