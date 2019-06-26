//
//  NNSMachPortDelegate.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMachPortDelegate.h"

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

#define instancetype NSMachPortDelegate
#define js_value_instancetype js_value_NSMachPortDelegate

NNSMachPortDelegate::NNSMachPortDelegate() {}
NNSMachPortDelegate::~NNSMachPortDelegate() {}

JS_INIT_PROTOCOL(NSMachPortDelegate, NSPortDelegate);
  JS_ASSIGN_PROTO_METHOD(handleMachMessage);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSMachPortDelegate, NSPortDelegate);
  // constant values (exports)
JS_INIT_PROTOCOL_END(NSMachPortDelegate, NSPortDelegate);


NAN_METHOD(NNSMachPortDelegate::New) {
  JS_RECONSTRUCT(NSMachPortDelegate);
  @autoreleasepool {
    id<NSMachPortDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<NSMachPortDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<NSMachPortDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], NSMachPortDelegate, value);
      self = value;
    }
    if (self) {
      NNSMachPortDelegate *wrapper = new NNSMachPortDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSMachPortDelegate::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSMachPortDelegate::handleMachMessage) {
  JS_UNWRAP_PROTOCOL(NSMachPortDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(void, msg);
    [self handleMachMessage: msg];
  }
}

#endif
