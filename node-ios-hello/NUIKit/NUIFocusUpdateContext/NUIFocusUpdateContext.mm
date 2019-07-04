//
//  NUIFocusUpdateContext.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIFocusUpdateContext.h"

#define instancetype UIFocusUpdateContext
#define js_value_instancetype js_value_UIFocusUpdateContext

NUIFocusUpdateContext::NUIFocusUpdateContext() {}
NUIFocusUpdateContext::~NUIFocusUpdateContext() {}

JS_INIT_CLASS(UIFocusUpdateContext, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(previouslyFocusedItem);
  JS_ASSIGN_PROTO_PROP_READONLY(nextFocusedItem);
  JS_ASSIGN_PROTO_PROP_READONLY(previouslyFocusedView);
  JS_ASSIGN_PROTO_PROP_READONLY(nextFocusedView);
  JS_ASSIGN_PROTO_PROP_READONLY(focusHeading);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIFocusUpdateContext, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIFocusUpdateContext, NSObject);

NAN_METHOD(NUIFocusUpdateContext::New) {
  JS_RECONSTRUCT(UIFocusUpdateContext);
  @autoreleasepool {
    UIFocusUpdateContext* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIFocusUpdateContext *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIFocusUpdateContext alloc] init];
    }
    if (self) {
      NUIFocusUpdateContext *wrapper = new NUIFocusUpdateContext();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIFocusUpdateContext::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIFocusUpdateContext::previouslyFocusedItemGetter) {
  JS_UNWRAP(UIFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIFocusItem>*/([self previouslyFocusedItem]));
  }
}

NAN_GETTER(NUIFocusUpdateContext::nextFocusedItemGetter) {
  JS_UNWRAP(UIFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIFocusItem>*/([self nextFocusedItem]));
  }
}

#include "NUIView.h"

NAN_GETTER(NUIFocusUpdateContext::previouslyFocusedViewGetter) {
  JS_UNWRAP(UIFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self previouslyFocusedView]));
  }
}

NAN_GETTER(NUIFocusUpdateContext::nextFocusedViewGetter) {
  JS_UNWRAP(UIFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self nextFocusedView]));
  }
}

#include "NUIFocus.h"

NAN_GETTER(NUIFocusUpdateContext::focusHeadingGetter) {
  JS_UNWRAP(UIFocusUpdateContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIFocusHeading([self focusHeading]));
  }
}
