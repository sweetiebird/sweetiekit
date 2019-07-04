//
//  NUITableViewFocusUpdateContext.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewFocusUpdateContext.h"

#define instancetype UITableViewFocusUpdateContext
#define js_value_instancetype js_value_UITableViewFocusUpdateContext

NUITableViewFocusUpdateContext::NUITableViewFocusUpdateContext() {}
NUITableViewFocusUpdateContext::~NUITableViewFocusUpdateContext() {}

JS_INIT_CLASS(UITableViewFocusUpdateContext, UIFocusUpdateContext);
  JS_ASSIGN_PROTO_PROP_READONLY(previouslyFocusedIndexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(nextFocusedIndexPath);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewFocusUpdateContext, UIFocusUpdateContext);
  // constant values (exports)
JS_INIT_CLASS_END(UITableViewFocusUpdateContext, UIFocusUpdateContext);

NAN_METHOD(NUITableViewFocusUpdateContext::New) {
  JS_RECONSTRUCT(UITableViewFocusUpdateContext);
  @autoreleasepool {
    UITableViewFocusUpdateContext* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewFocusUpdateContext *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITableViewFocusUpdateContext alloc] init];
    }
    if (self) {
      NUITableViewFocusUpdateContext *wrapper = new NUITableViewFocusUpdateContext();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewFocusUpdateContext::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUITableViewFocusUpdateContext::previouslyFocusedIndexPathGetter) {
  JS_UNWRAP(UITableViewFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self previouslyFocusedIndexPath]));
  }
}

NAN_GETTER(NUITableViewFocusUpdateContext::nextFocusedIndexPathGetter) {
  JS_UNWRAP(UITableViewFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self nextFocusedIndexPath]));
  }
}
