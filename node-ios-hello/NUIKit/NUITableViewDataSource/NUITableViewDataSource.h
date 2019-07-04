//
//  NUITableViewDataSource.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDataSource_h
#define NUITableViewDataSource_h    

#include "NNSObject.h"

#define js_value_UITableViewDataSource(x) js_protocol_wrapper(x, UITableViewDataSource)
#define to_value_UITableViewDataSource(x) to_protocol_wrapper(x, UITableViewDataSource)
#define is_value_UITableViewDataSource(x) is_protocol_wrapper(x, UITableViewDataSource)

JS_WRAP_PROTOCOL(UITableViewDataSource, NSObject);
  JS_PROP(tableViewNumberOfRowsInSection);
  JS_PROP(tableViewCellForRowAtIndexPath);
  JS_PROP(numberOfSectionsInTableView);
  JS_PROP(tableViewTitleForHeaderInSection);
  JS_PROP(tableViewTitleForFooterInSection);
  JS_PROP(tableViewCanEditRowAtIndexPath);
  JS_PROP(tableViewCanMoveRowAtIndexPath);
  JS_PROP(sectionIndexTitlesForTableView);
  JS_PROP(tableViewSectionForSectionIndexTitleAtIndex);
  JS_PROP(tableViewCommitEditingStyleForRowAtIndexPath);
  JS_PROP(tableViewMoveRowAtIndexPathToIndexPath);
JS_WRAP_PROTOCOL_END(UITableViewDataSource, NSObject);

#if __OBJC__
@interface UITableViewDataSourceType : NSObject<UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;    // fixed font style. use custom view (UILabel) if you want something different
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;

// Index

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView;                               // return list of section titles to display in section index view (e.g. "ABCD...Z#")
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;  // tell table which section corresponds to section title/index (e.g. "B",1))

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

// Data manipulation - reorder / moving support

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

@end
#endif

#endif /* NUITableViewDataSource_h */
