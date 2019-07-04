//
//  NUITableViewDataSourcePrefetching.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDataSourcePrefetching_h
#define NUITableViewDataSourcePrefetching_h    

#include "NNSObject.h"

#define js_value_UITableViewDataSourcePrefetching(x) js_protocol_wrapper(x, UITableViewDataSourcePrefetching)
#define to_value_UITableViewDataSourcePrefetching(x) to_protocol_wrapper(x, UITableViewDataSourcePrefetching)
#define is_value_UITableViewDataSourcePrefetching(x) is_protocol_wrapper(x, UITableViewDataSourcePrefetching)

JS_WRAP_PROTOCOL(UITableViewDataSourcePrefetching, NSObject);
  JS_PROP(tableViewPrefetchRowsAtIndexPaths);
  JS_PROP(tableViewCancelPrefetchingForRowsAtIndexPaths);
JS_WRAP_PROTOCOL_END(UITableViewDataSourcePrefetching, NSObject);

#if __OBJC__
@interface UITableViewDataSourcePrefetchingType : NSObject<UITableViewDataSourcePrefetching>

// indexPaths are ordered ascending by geometric distance from the table view
- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;

// indexPaths that previously were considered as candidates for pre-fetching, but were not actually used; may be a subset of the previous call to -tableView:prefetchRowsAtIndexPaths:
- (void)tableView:(UITableView *)tableView cancelPrefetchingForRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;

@end
#endif

#endif /* NUITableViewDataSourcePrefetching_h */
