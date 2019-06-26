//
//  NNSPortDelegate.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSPortDelegate.h"

#define instancetype NSPortDelegate
#define js_value_instancetype js_value_NSPortDelegate

NNSPortDelegate::NNSPortDelegate() {}
NNSPortDelegate::~NNSPortDelegate() {}

JS_INIT_PROTOCOL(NSPortDelegate, NSObject);
  JS_ASSIGN_PROTO_METHOD(handlePortMessage);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSPortDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(NSPortDelegate, NSObject);


NAN_METHOD(NNSPortDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(NSPortDelegate);
  @autoreleasepool {
    id<NSPortDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<NSPortDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<NSPortDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], NSPortDelegate, value);
      self = value;
    }
    if (self) {
      NNSPortDelegate *wrapper = new NNSPortDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSPortDelegate::New: invalid arguments");
    }
  }
}

#define js_value_NSPortMessage(x) js_value_wrapper_unknown(x, NSPortMessage)
#define to_value_NSPortMessage(x) to_value_wrapper_unknown(x, NSPortMessage)
#define is_value_NSPortMessage(x) is_value_wrapper_unknown(x, NSPortMessage)

NAN_METHOD(NNSPortDelegate::handlePortMessage) {
  JS_UNWRAP_PROTOCOL(NSPortDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSPortMessage, message);
    [self handlePortMessage: message];
  }
}
