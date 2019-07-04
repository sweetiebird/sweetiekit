//
//  NUITableViewDataSourcePrefetching.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDataSourcePrefetching.h"

#define instancetype UITableViewDataSourcePrefetching
#define js_value_instancetype js_value_UITableViewDataSourcePrefetching

NUITableViewDataSourcePrefetching::NUITableViewDataSourcePrefetching() {}
NUITableViewDataSourcePrefetching::~NUITableViewDataSourcePrefetching() {}

JS_INIT_PROTOCOL(UITableViewDataSourcePrefetching, NSObject);
  JS_ASSIGN_PROTO_PROP(tableViewPrefetchRowsAtIndexPaths);
  JS_ASSIGN_PROTO_PROP(tableViewCancelPrefetchingForRowsAtIndexPaths);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDataSourcePrefetching, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDataSourcePrefetching, NSObject);


NAN_METHOD(NUITableViewDataSourcePrefetching::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDataSourcePrefetching);
  @autoreleasepool {
    id<UITableViewDataSourcePrefetching> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDataSourcePrefetching>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDataSourcePrefetching> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDataSourcePrefetching, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDataSourcePrefetchingType alloc] init];
    }
    if (self) {
      NUITableViewDataSourcePrefetching *wrapper = new NUITableViewDataSourcePrefetching();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDataSourcePrefetching::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UITableViewDataSourcePrefetching, tableViewPrefetchRowsAtIndexPaths);
DELEGATE_PROTOCOL_PROP(UITableViewDataSourcePrefetching, tableViewCancelPrefetchingForRowsAtIndexPaths);

#include "NUITableView.h"

@implementation UITableViewDataSourcePrefetchingType

// indexPaths are ordered ascending by geometric distance from the table view
- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
  call_delegate(noop(), tableViewPrefetchRowsAtIndexPaths,
    js_value_UITableView(tableView),
    js_value_NSArray<NSIndexPath *>(indexPaths));
}

// indexPaths that previously were considered as candidates for pre-fetching, but were not actually used; may be a subset of the previous call to -tableView:prefetchRowsAtIndexPaths:
- (void)tableView:(UITableView *)tableView cancelPrefetchingForRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
  call_delegate(noop(), tableViewCancelPrefetchingForRowsAtIndexPaths,
    js_value_UITableView(tableView),
    js_value_NSArray<NSIndexPath *>(indexPaths));
}

@end
