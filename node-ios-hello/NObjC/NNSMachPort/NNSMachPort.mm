//
//  NNSMachPort.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMachPort.h"

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

#define instancetype NSMachPort
#define js_value_instancetype js_value_NSMachPort

NNSMachPort::NNSMachPort() {}
NNSMachPort::~NNSMachPort() {}

JS_INIT_CLASS(NSMachPort, NSPort);
  JS_ASSIGN_STATIC_METHOD(portWithMachPort);
  JS_ASSIGN_STATIC_METHOD(portWithMachPortOptions);
  JS_ASSIGN_PROTO_METHOD(initWithMachPort);
  JS_ASSIGN_PROTO_METHOD(setDelegate);
  JS_ASSIGN_PROTO_METHOD(delegate);
  JS_ASSIGN_PROTO_METHOD(initWithMachPortOptions);
  JS_ASSIGN_PROTO_METHOD(scheduleInRunLoopForMode);
  JS_ASSIGN_PROTO_METHOD(removeFromRunLoopForMode);
  JS_ASSIGN_PROTO_PROP_READONLY(machPort);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSMachPort, NSPort);
  // constant values (exports)
  
  //typedef NS_OPTIONS(NSUInteger, NSMachPortOptions) {
    JS_ASSIGN_ENUM(NSMachPortDeallocateNone, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(NSMachPortDeallocateSendRight, NSUInteger); // = (1UL << 0),
    JS_ASSIGN_ENUM(NSMachPortDeallocateReceiveRight, NSUInteger); // = (1UL << 1)
  //} API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));

JS_INIT_CLASS_END(NSMachPort, NSPort);

NAN_METHOD(NNSMachPort::New) {
  JS_RECONSTRUCT(NSMachPort);
  @autoreleasepool {
    NSMachPort* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSMachPort *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSMachPort alloc] init];
    }
    if (self) {
      NNSMachPort *wrapper = new NNSMachPort();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSMachPort::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSMachPort::portWithMachPort) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, machPort);
    JS_SET_RETURN(js_value_NSPort([NSMachPort portWithMachPort: machPort]));
  }
}

NAN_METHOD(NNSMachPort::portWithMachPortOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, machPort);
    declare_value(NSMachPortOptions, f);
    JS_SET_RETURN(js_value_NSPort([NSMachPort portWithMachPort: machPort options: f]));
  }
}

NAN_METHOD(NNSMachPort::initWithMachPort) {
  JS_UNWRAP_OR_ALLOC(NSMachPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, machPort);
    JS_SET_RETURN(js_value_instancetype([self initWithMachPort: machPort]));
  }
}

NAN_METHOD(NNSMachPort::setDelegate) {
  JS_UNWRAP(NSMachPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<NSMachPortDelegate>, anObject);
    [self setDelegate: anObject];
  }
}

NAN_METHOD(NNSMachPort::delegate) {
  JS_UNWRAP(NSMachPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id<NSMachPortDelegate>([self delegate]));
  }
}

NAN_METHOD(NNSMachPort::initWithMachPortOptions) {
  JS_UNWRAP_OR_ALLOC(NSMachPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, machPort);
    declare_value(NSMachPortOptions, f);
    JS_SET_RETURN(js_value_instancetype([self initWithMachPort: machPort options: f]));
  }
}

NAN_METHOD(NNSMachPort::scheduleInRunLoopForMode) {
  JS_UNWRAP(NSMachPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSRunLoop, runLoop);
    declare_value(NSRunLoopMode, mode);
    [self scheduleInRunLoop: runLoop forMode: mode];
  }
}

NAN_METHOD(NNSMachPort::removeFromRunLoopForMode) {
  JS_UNWRAP(NSMachPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSRunLoop, runLoop);
    declare_value(NSRunLoopMode, mode);
    [self removeFromRunLoop: runLoop forMode: mode];
  }
}

NAN_GETTER(NNSMachPort::machPortGetter) {
  JS_UNWRAP(NSMachPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self machPort]));
  }
}

#endif
