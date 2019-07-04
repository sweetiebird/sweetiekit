//
//  NUIDragItem.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragItem.h"

#define instancetype UIDragItem
#define js_value_instancetype js_value_UIDragItem

NUIDragItem::NUIDragItem() {}
NUIDragItem::~NUIDragItem() {}

JS_INIT_CLASS(UIDragItem, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithItemProvider);
  JS_ASSIGN_PROTO_PROP_READONLY(itemProvider);
  JS_ASSIGN_PROTO_PROP(localObject);
  JS_ASSIGN_PROTO_PROP(previewProvider);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragItem, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIDragItem, NSObject);

NAN_METHOD(NUIDragItem::New) {
  JS_RECONSTRUCT(UIDragItem);
  @autoreleasepool {
    UIDragItem* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDragItem *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIDragItem *wrapper = new NUIDragItem();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragItem::New: invalid arguments");
    }
  }
}

#include "NNSItemProvider.h"

NAN_METHOD(NUIDragItem::initWithItemProvider) {
  JS_UNWRAP_OR_ALLOC(UIDragItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSItemProvider, itemProvider);
    JS_SET_RETURN(js_value_instancetype([self initWithItemProvider: itemProvider]));
  }
}

NAN_GETTER(NUIDragItem::itemProviderGetter) {
  JS_UNWRAP(UIDragItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSItemProvider([self itemProvider]));
  }
}

NAN_GETTER(NUIDragItem::localObjectGetter) {
  JS_UNWRAP(UIDragItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self localObject]));
  }
}

NAN_SETTER(NUIDragItem::localObjectSetter) {
  JS_UNWRAP(UIDragItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setLocalObject: input];
  }
}

NAN_GETTER(NUIDragItem::previewProviderGetter) {
  JS_UNWRAP(UIDragItem, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_UIDragPreview_pointer _Nullable 94previewProvider([self _void()]));
    #endif
  }
}

NAN_SETTER(NUIDragItem::previewProviderSetter) {
  JS_UNWRAP(UIDragItem, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(UIDragPreview-pointer _Nullable ^previewProvider, input);
    [self setVoid: input];
    #endif
  }
}

