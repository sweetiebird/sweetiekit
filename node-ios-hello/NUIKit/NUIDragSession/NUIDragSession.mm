//
//  NUIDragSession.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragSession.h"

#define instancetype UIDragSession
#define js_value_instancetype js_value_UIDragSession

NUIDragSession::NUIDragSession() {}
NUIDragSession::~NUIDragSession() {}

JS_INIT_PROTOCOL(UIDragSession, UIDragDropSession);
  JS_ASSIGN_PROTO_PROP(localContext);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragSession, UIDragDropSession);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIDragSession, UIDragDropSession);


NAN_METHOD(NUIDragSession::New) {
  JS_RECONSTRUCT_PROTOCOL(UIDragSession);
  @autoreleasepool {
    id<UIDragSession> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIDragSession>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIDragSession> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIDragSession, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIDragSessionType alloc] init];
    }
    if (self) {
      NUIDragSession *wrapper = new NUIDragSession();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragSession::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIDragSession::localContextGetter) {
  JS_UNWRAP_PROTOCOL(UIDragSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self localContext]));
  }
}

NAN_SETTER(NUIDragSession::localContextSetter) {
  JS_UNWRAP_PROTOCOL(UIDragSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setLocalContext: input];
    // TODO: should we call [self associateValue: input ...]?
  }
}

@implementation UIDragSessionType
@end
