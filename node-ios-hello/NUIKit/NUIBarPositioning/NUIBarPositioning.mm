//
//  NUIBarPositioning.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIBarPositioning.h"

#define instancetype UIBarPositioning
#define js_value_instancetype js_value_UIBarPositioning

NUIBarPositioning::NUIBarPositioning() {}
NUIBarPositioning::~NUIBarPositioning() {}

JS_INIT_PROTOCOL(UIBarPositioning, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(barPosition);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIBarPositioning, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIBarPositioning, NSObject);


NAN_METHOD(NUIBarPositioning::New) {
  JS_RECONSTRUCT_PROTOCOL(UIBarPositioning);
  @autoreleasepool {
    id<UIBarPositioning> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIBarPositioning>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIBarPositioning> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIBarPositioning, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIBarPositioningType alloc] init];
    }
    if (self) {
      NUIBarPositioning *wrapper = new NUIBarPositioning();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIBarPositioning::New: invalid arguments");
    }
  }
}

#include "NUIBarCommon.h"

NAN_GETTER(NUIBarPositioning::barPositionGetter) {
  JS_UNWRAP_PROTOCOL(UIBarPositioning, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarPosition([self barPosition]));
  }
}

@implementation UIBarPositioningType
@end
