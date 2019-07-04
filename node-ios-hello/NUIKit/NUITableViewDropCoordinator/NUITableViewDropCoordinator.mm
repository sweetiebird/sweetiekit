//
//  NUITableViewDropCoordinator.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDropCoordinator.h"

#define instancetype UITableViewDropCoordinator
#define js_value_instancetype js_value_UITableViewDropCoordinator

NUITableViewDropCoordinator::NUITableViewDropCoordinator() {}
NUITableViewDropCoordinator::~NUITableViewDropCoordinator() {}

JS_INIT_PROTOCOL(UITableViewDropCoordinator, NSObject);
  JS_ASSIGN_PROTO_PROP(dropItemToPlaceholder);
  JS_ASSIGN_PROTO_PROP(dropItemToRowAtIndexPath);
  JS_ASSIGN_PROTO_PROP(dropItemIntoRowAtIndexPathRect);
  JS_ASSIGN_PROTO_PROP(dropItemToTarget);
  JS_ASSIGN_PROTO_PROP_READONLY(items);
  JS_ASSIGN_PROTO_PROP_READONLY(destinationIndexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(proposal);
  JS_ASSIGN_PROTO_PROP_READONLY(session);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDropCoordinator, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDropCoordinator, NSObject);

NAN_METHOD(NUITableViewDropCoordinator::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDropCoordinator);
  @autoreleasepool {
    id<UITableViewDropCoordinator> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDropCoordinator>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDropCoordinator> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDropCoordinator, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDropCoordinatorType alloc] init];
    }
    if (self) {
      NUITableViewDropCoordinator *wrapper = new NUITableViewDropCoordinator();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDropCoordinator::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUITableViewDropCoordinator::itemsGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<UITableViewDropItem>>([self items]));
  }
}

NAN_GETTER(NUITableViewDropCoordinator::destinationIndexPathGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self destinationIndexPath]));
  }
}

#include "NUITableViewDropProposal.h"

NAN_GETTER(NUITableViewDropCoordinator::proposalGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewDropProposal([self proposal]));
  }
}

#include "NUIDropSession.h"

NAN_GETTER(NUITableViewDropCoordinator::sessionGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropCoordinator, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDropSession([self session]));
  }
}

DELEGATE_PROTOCOL_PROP(UITableViewDropCoordinator, dropItemToPlaceholder);
DELEGATE_PROTOCOL_PROP(UITableViewDropCoordinator, dropItemToRowAtIndexPath);
DELEGATE_PROTOCOL_PROP(UITableViewDropCoordinator, dropItemIntoRowAtIndexPathRect);
DELEGATE_PROTOCOL_PROP(UITableViewDropCoordinator, dropItemToTarget);

#include "NUITableViewDropPlaceholderContext.h"
#include "NUITableViewDropPlaceholder.h"
#include "NUIDragItem.h"
#include "NUIDragAnimating.h"
#include "NUIDragPreviewTarget.h"

@implementation UITableViewDropCoordinatorType

// Animate the dragItem to an automatically inserted placeholder row.
// Once the dragItem data is available, you can exchange the temporary placeholder cell with the final cell using the placeholder context
// method -commitInsertionWithDataSourceUpdates:
- (id<UITableViewDropPlaceholderContext>)dropItem:(UIDragItem *)dragItem toPlaceholder:(UITableViewDropPlaceholder *)placeholder
{
  __block id<UITableViewDropPlaceholderContext> result = nil;
  call_delegate(result = is_value_UITableViewDropPlaceholderContext(JS_RESULT) ? to_value_UITableViewDropPlaceholderContext(JS_RESULT) : result, dropItemToPlaceholder,
    js_value_UIDragItem(dragItem),
    js_value_UITableViewDropPlaceholder(placeholder));
  return result;
}

// Animate the dragItem to a row that you inserted at this index path.
// You must call -performBatchUpdates:completion: to update your data source and insert a new row into the table view prior to calling this method.
// If desired, use the drop delegate method -tableView:dropPreviewParametersForRowAtIndexPath: to provide preview parameters.
- (id<UIDragAnimating>)dropItem:(UIDragItem *)dragItem toRowAtIndexPath:(NSIndexPath *)indexPath
{
  __block id<UIDragAnimating> result = nil;
  call_delegate(result = is_value_UIDragAnimating(JS_RESULT) ? to_value_UIDragAnimating(JS_RESULT) : result, dropItemToRowAtIndexPath,
    js_value_UIDragItem(dragItem),
    js_value_NSIndexPath(indexPath));
  return result;
}

// Animate the dragItem to a rect inside an existing row.
// The rect is in the coordinate space of the cell at this index path.
// The item will be animated with an aspect fit scale transform to fit inside the rect. Use a rect with zero size to shrink the item to a single point.
- (id<UIDragAnimating>)dropItem:(UIDragItem *)dragItem intoRowAtIndexPath:(NSIndexPath *)indexPath rect:(CGRect)rect
{
  __block id<UIDragAnimating> result = nil;
  call_delegate(result = is_value_UIDragAnimating(JS_RESULT) ? to_value_UIDragAnimating(JS_RESULT) : result, dropItemIntoRowAtIndexPathRect,
    js_value_UIDragItem(dragItem),
    js_value_NSIndexPath(indexPath),
    js_value_CGRect(rect));
  return result;
}

// Animate the dragItem to a location specified by the UIDragPreviewTarget.
// The -[UITableViewDropItem previewSize] may be helpful to compute an appropriate transform.
- (id<UIDragAnimating>)dropItem:(UIDragItem *)dragItem toTarget:(UIDragPreviewTarget *)target
{
  __block id<UIDragAnimating> result = nil;
  call_delegate(result = is_value_UIDragAnimating(JS_RESULT) ? to_value_UIDragAnimating(JS_RESULT) : result, dropItemToTarget,
    js_value_UIDragItem(dragItem),
    js_value_UIDragPreviewTarget(target));
  return result;
}

@end
