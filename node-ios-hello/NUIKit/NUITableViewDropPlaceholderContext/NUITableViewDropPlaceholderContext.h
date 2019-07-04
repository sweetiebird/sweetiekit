//
//  NUITableViewDropPlaceholderContext.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDropPlaceholderContext_h
#define NUITableViewDropPlaceholderContext_h    

#include "NUIDragAnimating.h"

#define js_value_UITableViewDropPlaceholderContext(x) js_protocol_wrapper(x, UITableViewDropPlaceholderContext)
#define to_value_UITableViewDropPlaceholderContext(x) to_protocol_wrapper(x, UITableViewDropPlaceholderContext)
#define is_value_UITableViewDropPlaceholderContext(x) is_protocol_wrapper(x, UITableViewDropPlaceholderContext)

JS_WRAP_PROTOCOL(UITableViewDropPlaceholderContext, UIDragAnimating);
  JS_PROP(commitInsertionWithDataSourceUpdates);
  JS_PROP(deletePlaceholder);
  JS_PROP_READONLY(dragItem);
JS_WRAP_PROTOCOL_END(UITableViewDropPlaceholderContext, UIDragAnimating);

#if __OBJC__
@interface UITableViewDropPlaceholderContextType : UIDragAnimatingType<UITableViewDropPlaceholderContext>

// The drag item this placeholder was created for.
@property (nonatomic, readonly) UIDragItem *dragItem;

#if TODO
// Exchange the placeholder for the final cell.
// You are only responsible for updating your data source inside the block using the provided insertionIndexPath.
// If the placeholder is no longer available (e.g. -reloadData has been called) the dataSourceUpdates block
// will not be executed and this will return NO.
- (BOOL)commitInsertionWithDataSourceUpdates:(void(NS_NOESCAPE ^)(NSIndexPath *insertionIndexPath))dataSourceUpdates;

// If the placeholder is no longer needed or you wish to manually insert a cell for the drop data, you can
// remove the placeholder via this method.
// If the placeholder is no longer available (e.g. -reloadData has been called) this will return NO.
- (BOOL)deletePlaceholder;
#endif

@end
#endif

#endif /* NUITableViewDropPlaceholderContext_h */
