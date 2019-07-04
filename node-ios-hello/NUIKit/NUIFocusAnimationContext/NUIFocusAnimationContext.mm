//
//  NUIFocusAnimationContext.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIFocusAnimationContext.h"

#define instancetype UIFocusAnimationContext
#define js_value_instancetype js_value_UIFocusAnimationContext

NUIFocusAnimationContext::NUIFocusAnimationContext() {}
NUIFocusAnimationContext::~NUIFocusAnimationContext() {}

JS_INIT_PROTOCOL(UIFocusAnimationContext, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(duration);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIFocusAnimationContext, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIFocusAnimationContext, NSObject);


NAN_METHOD(NUIFocusAnimationContext::New) {
  JS_RECONSTRUCT_PROTOCOL(UIFocusAnimationContext);
  @autoreleasepool {
    id<UIFocusAnimationContext> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIFocusAnimationContext>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIFocusAnimationContext> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIFocusAnimationContext, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIFocusAnimationContextType alloc] init];
    }
    if (self) {
      NUIFocusAnimationContext *wrapper = new NUIFocusAnimationContext();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIFocusAnimationContext::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIFocusAnimationContext::durationGetter) {
  JS_UNWRAP_PROTOCOL(UIFocusAnimationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self duration]));
  }
}

@implementation UIFocusAnimationContextType
@end
