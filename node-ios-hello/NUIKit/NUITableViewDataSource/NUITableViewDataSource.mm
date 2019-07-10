//
//  NUITableViewDataSource.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDataSource.h"

#define instancetype UITableViewDataSource
#define js_value_instancetype js_value_UITableViewDataSource

NUITableViewDataSource::NUITableViewDataSource() {}
NUITableViewDataSource::~NUITableViewDataSource() {}

JS_INIT_PROTOCOL(UITableViewDataSource, NSObject);
  JS_ASSIGN_PROTO_PROP(tableViewNumberOfRowsInSection);
  JS_ASSIGN_PROTO_PROP(tableViewCellForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(numberOfSectionsInTableView);
  JS_ASSIGN_PROTO_PROP(tableViewTitleForHeaderInSection);
  JS_ASSIGN_PROTO_PROP(tableViewTitleForFooterInSection);
  JS_ASSIGN_PROTO_PROP(tableViewCanEditRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewCanMoveRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(sectionIndexTitlesForTableView);
  JS_ASSIGN_PROTO_PROP(tableViewSectionForSectionIndexTitleAtIndex);
  JS_ASSIGN_PROTO_PROP(tableViewCommitEditingStyleForRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(tableViewMoveRowAtIndexPathToIndexPath);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDataSource, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDataSource, NSObject);


NAN_METHOD(NUITableViewDataSource::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDataSource);
  @autoreleasepool {
    id<UITableViewDataSource> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDataSource>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDataSource> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDataSource, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDataSourceType alloc] init];
    }
    if (self) {
      NUITableViewDataSource *wrapper = new NUITableViewDataSource();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDataSource::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewNumberOfRowsInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewCellForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, numberOfSectionsInTableView);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewTitleForHeaderInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewTitleForFooterInSection);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewCanEditRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewCanMoveRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, sectionIndexTitlesForTableView);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewSectionForSectionIndexTitleAtIndex);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewCommitEditingStyleForRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDataSource, tableViewMoveRowAtIndexPathToIndexPath);

#include "NUITableView.h"
#include "NUITableViewCell.h"

@implementation UITableViewDataSourceType

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  __block NSInteger result = 0;
  call_delegate(result = is_value_NSInteger(JS_RESULT) ? to_value_NSInteger(JS_RESULT) : result, tableViewNumberOfRowsInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block UITableViewCell* result = nil;
  call_delegate(result = is_value_UITableViewCell(JS_RESULT) ? to_value_UITableViewCell(JS_RESULT) : result, tableViewCellForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
  __block NSInteger result = 1;
  call_delegate(result = is_value_NSInteger(JS_RESULT) ? to_value_NSInteger(JS_RESULT) : result, numberOfSectionsInTableView,
    js_value_UITableView(tableView));
  return result;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
{
  __block NSString* result = nil;
  call_delegate(result = is_value_NSString(JS_RESULT) ? to_value_NSString(JS_RESULT) : result, tableViewTitleForHeaderInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
  __block NSString* result = nil;
  call_delegate(result = is_value_NSString(JS_RESULT) ? to_value_NSString(JS_RESULT) : result, tableViewTitleForFooterInSection,
    js_value_UITableView(tableView),
    js_value_NSInteger(section));
  return result;
}

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewCanEditRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block BOOL result = ([self associatedValueForKey:@"tableViewMoveRowAtIndexPathToIndexPath"] != nullptr) ? YES : NO;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, tableViewCanMoveRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Index

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView                                // return list of section titles to display in section index view (e.g. "ABCD...Z#")
{
  __block NSArray<NSString *>* result = nil;
  call_delegate(result = is_value_NSArray<NSString *>(JS_RESULT) ? to_value_NSArray<NSString *>(JS_RESULT) : result, sectionIndexTitlesForTableView,
    js_value_UITableView(tableView));
  return result;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index   // tell table which section corresponds to section title/index (e.g. "B",1))
{
  __block NSInteger result = 0; // TODO: unsure about this default.
  call_delegate(result = is_value_NSInteger(JS_RESULT) ? to_value_NSInteger(JS_RESULT) : result, tableViewSectionForSectionIndexTitleAtIndex,
    js_value_UITableView(tableView),
    js_value_NSString(title),
    js_value_NSInteger(index));
  return result;
}

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  call_delegate_async(noop(), tableViewCommitEditingStyleForRowAtIndexPath,
    js_value_UITableView(tableView),
    js_value_UITableViewCellEditingStyle(editingStyle),
    js_value_NSIndexPath(indexPath));
}

// Data manipulation - reorder / moving support

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
  call_delegate_async(noop(), tableViewMoveRowAtIndexPathToIndexPath,
    js_value_UITableView(tableView),
    js_value_NSIndexPath(sourceIndexPath),
    js_value_NSIndexPath(destinationIndexPath));
}

@end
