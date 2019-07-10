//
//  NEAGLSharegroup.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NEAGLSharegroup.h"

#if TARGET_OS_IPHONE

#define instancetype EAGLSharegroup
#define js_value_instancetype js_value_EAGLSharegroup

NEAGLSharegroup::NEAGLSharegroup() {}
NEAGLSharegroup::~NEAGLSharegroup() {}

JS_INIT_CLASS(EAGLSharegroup, NSObject);
  JS_ASSIGN_PROTO_PROP(debugLabel);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(EAGLSharegroup, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(EAGLSharegroup, NSObject);

NAN_METHOD(NEAGLSharegroup::New) {
  JS_RECONSTRUCT(EAGLSharegroup);
  @autoreleasepool {
    EAGLSharegroup* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge EAGLSharegroup *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[EAGLSharegroup alloc] init];
    }
    if (self) {
      NEAGLSharegroup *wrapper = new NEAGLSharegroup();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("EAGLSharegroup::New: invalid arguments");
    }
  }
}

NAN_GETTER(NEAGLSharegroup::debugLabelGetter) {
  JS_UNWRAP(EAGLSharegroup, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self debugLabel]));
  }
}

#endif
