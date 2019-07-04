//
//  NUITableViewDropPlaceholder.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDropPlaceholder.h"

#define instancetype UITableViewDropPlaceholder
#define js_value_instancetype js_value_UITableViewDropPlaceholder

NUITableViewDropPlaceholder::NUITableViewDropPlaceholder() {}
NUITableViewDropPlaceholder::~NUITableViewDropPlaceholder() {}

JS_INIT_CLASS(UITableViewDropPlaceholder, UITableViewPlaceholder);
  JS_ASSIGN_PROTO_PROP(previewParametersProvider);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDropPlaceholder, UITableViewPlaceholder);
  // constant values (exports)
JS_INIT_CLASS_END(UITableViewDropPlaceholder, UITableViewPlaceholder);

NAN_METHOD(NUITableViewDropPlaceholder::New) {
  JS_RECONSTRUCT(UITableViewDropPlaceholder);
  @autoreleasepool {
    UITableViewDropPlaceholder* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewDropPlaceholder *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUITableViewDropPlaceholder *wrapper = new NUITableViewDropPlaceholder();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDropPlaceholder::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUITableViewDropPlaceholder::previewParametersProviderGetter) {
  JS_UNWRAP(UITableViewDropPlaceholder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_UIDragPreviewParameters_pointer _Nullable 94previewParametersProvider([self UITableViewCell()]));
    #endif
  }
}

NAN_SETTER(NUITableViewDropPlaceholder::previewParametersProviderSetter) {
  JS_UNWRAP(UITableViewDropPlaceholder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(UIDragPreviewParameters-pointer _Nullable ^previewParametersProvider, input);
    [self set-UITableViewCell: input];
    #endif
  }
}
