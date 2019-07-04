//
//  NUITableViewDropItem.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDropItem.h"

#define instancetype UITableViewDropItem
#define js_value_instancetype js_value_UITableViewDropItem

NUITableViewDropItem::NUITableViewDropItem() {}
NUITableViewDropItem::~NUITableViewDropItem() {}

JS_INIT_PROTOCOL(UITableViewDropItem, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(dragItem);
  JS_ASSIGN_PROTO_PROP_READONLY(sourceIndexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(previewSize);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDropItem, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UITableViewDropItem, NSObject);


NAN_METHOD(NUITableViewDropItem::New) {
  JS_RECONSTRUCT_PROTOCOL(UITableViewDropItem);
  @autoreleasepool {
    id<UITableViewDropItem> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITableViewDropItem>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UITableViewDropItem> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UITableViewDropItem, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UITableViewDropItemType alloc] init];
    }
    if (self) {
      NUITableViewDropItem *wrapper = new NUITableViewDropItem();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDropItem::New: invalid arguments");
    }
  }
}

#include "NUIDragItem.h"

NAN_GETTER(NUITableViewDropItem::dragItemGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragItem([self dragItem]));
  }
}

NAN_GETTER(NUITableViewDropItem::sourceIndexPathGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self sourceIndexPath]));
  }
}

NAN_GETTER(NUITableViewDropItem::previewSizeGetter) {
  JS_UNWRAP_PROTOCOL(UITableViewDropItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self previewSize]));
  }
}


@implementation UITableViewDropItemType
@end
