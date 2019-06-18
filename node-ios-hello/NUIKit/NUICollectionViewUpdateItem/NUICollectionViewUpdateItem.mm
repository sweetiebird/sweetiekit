//
//  NUICollectionViewUpdateItem.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewUpdateItem.h"

#define instancetype UICollectionViewUpdateItem
#define js_value_instancetype js_value_UICollectionViewUpdateItem

NUICollectionViewUpdateItem::NUICollectionViewUpdateItem() {}
NUICollectionViewUpdateItem::~NUICollectionViewUpdateItem() {}

JS_INIT_CLASS(UICollectionViewUpdateItem, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(indexPathBeforeUpdate);
  JS_ASSIGN_PROTO_PROP_READONLY(indexPathAfterUpdate);
  JS_ASSIGN_PROTO_PROP_READONLY(updateAction);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewUpdateItem, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UICollectionUpdateAction) {
    JS_ASSIGN_ENUM(UICollectionUpdateActionInsert, NSInteger);
    JS_ASSIGN_ENUM(UICollectionUpdateActionDelete, NSInteger);
    JS_ASSIGN_ENUM(UICollectionUpdateActionReload, NSInteger);
    JS_ASSIGN_ENUM(UICollectionUpdateActionMove, NSInteger);
    JS_ASSIGN_ENUM(UICollectionUpdateActionNone, NSInteger);
  //};

JS_INIT_CLASS_END(UICollectionViewUpdateItem, NSObject);

NAN_METHOD(NUICollectionViewUpdateItem::New) {
  JS_RECONSTRUCT(UICollectionViewUpdateItem);
  @autoreleasepool {
    UICollectionViewUpdateItem* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionViewUpdateItem *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UICollectionViewUpdateItem alloc] init];
    }
    if (self) {
      NUICollectionViewUpdateItem *wrapper = new NUICollectionViewUpdateItem();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionViewUpdateItem::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUICollectionViewUpdateItem::indexPathBeforeUpdateGetter) {
  JS_UNWRAP(UICollectionViewUpdateItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathBeforeUpdate]));
  }
}

NAN_GETTER(NUICollectionViewUpdateItem::indexPathAfterUpdateGetter) {
  JS_UNWRAP(UICollectionViewUpdateItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self indexPathAfterUpdate]));
  }
}

NAN_GETTER(NUICollectionViewUpdateItem::updateActionGetter) {
  JS_UNWRAP(UICollectionViewUpdateItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionUpdateAction([self updateAction]));
  }
}
