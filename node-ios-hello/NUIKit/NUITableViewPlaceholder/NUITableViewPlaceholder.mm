//
//  NUITableViewPlaceholder.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewPlaceholder.h"

#define instancetype UITableViewPlaceholder
#define js_value_instancetype js_value_UITableViewPlaceholder

NUITableViewPlaceholder::NUITableViewPlaceholder() {}
NUITableViewPlaceholder::~NUITableViewPlaceholder() {}

JS_INIT_CLASS(UITableViewPlaceholder, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithInsertionIndexPathReuseIdentifierRowHeight);
  JS_ASSIGN_PROTO_PROP(cellUpdateHandler);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewPlaceholder, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITableViewPlaceholder, NSObject);

NAN_METHOD(NUITableViewPlaceholder::New) {
  JS_RECONSTRUCT(UITableViewPlaceholder);
  @autoreleasepool {
    UITableViewPlaceholder* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewPlaceholder *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUITableViewPlaceholder *wrapper = new NUITableViewPlaceholder();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewPlaceholder::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITableViewPlaceholder::initWithInsertionIndexPathReuseIdentifierRowHeight) {
  JS_UNWRAP_OR_ALLOC(UITableViewPlaceholder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, insertionIndexPath);
    declare_pointer(NSString, reuseIdentifier);
    declare_value(CGFloat, rowHeight);
    JS_SET_RETURN(js_value_instancetype([self initWithInsertionIndexPath: insertionIndexPath reuseIdentifier: reuseIdentifier rowHeight: rowHeight]));
  }
}

NAN_GETTER(NUITableViewPlaceholder::cellUpdateHandlerGetter) {
  JS_UNWRAP(UITableViewPlaceholder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_void 94cellUpdateHandler([self UITableViewCell()]));
    #endif
  }
}

NAN_SETTER(NUITableViewPlaceholder::cellUpdateHandlerSetter) {
  JS_UNWRAP(UITableViewPlaceholder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(void ^cellUpdateHandler, input);
    [self set-UITableViewCell: input];
    #endif
  }
}
