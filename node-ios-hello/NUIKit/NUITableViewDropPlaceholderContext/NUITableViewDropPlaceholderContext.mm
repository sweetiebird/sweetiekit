//
//  NUITableViewDropPlaceholderContext.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDropPlaceholderContext.h"

#define instancetype UITableViewDropPlaceholderContext
#define js_value_instancetype js_value_UITableViewDropPlaceholderContext

NUITableViewDropPlaceholderContext::NUITableViewDropPlaceholderContext() {}
NUITableViewDropPlaceholderContext::~NUITableViewDropPlaceholderContext() {}

JS_INIT_PROTOCOL(UITableViewDropPlaceholderContext, UIDragAnimating);
  JS_ASSIGN_PROTO_PROP(commitInsertionWithDataSourceUpdates);
  JS_ASSIGN_PROTO_PROP(deletePlaceholder);
  JS_ASSIGN_PROTO_PROP_READONLY(dragItem);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDropPlaceholderContext, UIDragAnimating);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDropPlaceholderContext, UIDragAnimating);

NAN_METHOD(NUITableViewDropPlaceholderContext::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDropPlaceholderContext);
  @autoreleasepool {
    id<UITableViewDropPlaceholderContext> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDropPlaceholderContext>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDropPlaceholderContext> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDropPlaceholderContext, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDropPlaceholderContextType alloc] init];
    }
    if (self) {
      NUITableViewDropPlaceholderContext *wrapper = new NUITableViewDropPlaceholderContext();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDropPlaceholderContext::New: invalid arguments");
    }
  }
}

#include "NUIDragItem.h"

NAN_GETTER(NUITableViewDropPlaceholderContext::dragItemGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropPlaceholderContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragItem([self dragItem]));
  }
}

DELEGATE_PROTOCOL_PROP(UITableViewDropPlaceholderContext, commitInsertionWithDataSourceUpdates);
DELEGATE_PROTOCOL_PROP(UITableViewDropPlaceholderContext, deletePlaceholder);

@implementation UITableViewDropPlaceholderContextType

#if TODO
// Exchange the placeholder for the final cell.
// You are only responsible for updating your data source inside the block using the provided insertionIndexPath.
// If the placeholder is no longer available (e.g. -reloadData has been called) the dataSourceUpdates block
// will not be executed and this will return NO.
- (BOOL)commitInsertionWithDataSourceUpdates:(void(NS_NOESCAPE ^)(NSIndexPath *insertionIndexPath))dataSourceUpdates
{
  __block BOOL result = NO; // TODO: unsure about this default.
  // TODO
  return result;
}

// If the placeholder is no longer needed or you wish to manually insert a cell for the drop data, you can
// remove the placeholder via this method.
// If the placeholder is no longer available (e.g. -reloadData has been called) this will return NO.
- (BOOL)deletePlaceholder
{
  __block BOOL result = NO; // TODO: unsure about this default.
  // TODO
  return result;
}
#endif

@end
