//
//  NNSPort.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSPort.h"

#define instancetype NSPort
#define js_value_instancetype js_value_NSPort

NNSPort::NNSPort() {}
NNSPort::~NNSPort() {}

JS_INIT_CLASS(NSPort, NSObject);
  JS_ASSIGN_STATIC_METHOD(port);
  JS_ASSIGN_PROTO_METHOD(invalidate);
  JS_ASSIGN_PROTO_METHOD(setDelegate);
  JS_ASSIGN_PROTO_METHOD(delegate);
  JS_ASSIGN_PROTO_METHOD(scheduleInRunLoopForMode);
  JS_ASSIGN_PROTO_METHOD(removeFromRunLoopForMode);
  JS_ASSIGN_PROTO_METHOD(sendBeforeDateComponentsFromReserved);
  JS_ASSIGN_PROTO_METHOD(sendBeforeDateMsgidComponentsFromReserved);
#if TARGET_OS_MAC || TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_METHOD(addConnectionToRunLoopForMode);
  JS_ASSIGN_PROTO_METHOD(removeConnectionFromRunLoopForMode);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(isValid);
  JS_ASSIGN_PROTO_PROP_READONLY(reservedSpaceLength);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSPort, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSPort, NSObject);

NAN_METHOD(NNSPort::New) {
  JS_RECONSTRUCT(NSPort);
  @autoreleasepool {
    NSPort* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSPort *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSPort alloc] init];
    }
    if (self) {
      NNSPort *wrapper = new NNSPort();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSPort::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSPort::port) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSPort([NSPort port]));
  }
}

NAN_METHOD(NNSPort::invalidate) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    [self invalidate];
  }
}

#include "NNSPortDelegate.h"

NAN_METHOD(NNSPort::setDelegate) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(NSPortDelegate, anObject);
    [self setDelegate: anObject];
    [self associateValue:anObject withKey:@"NNSPort::delegate"];
  }
}

NAN_METHOD(NNSPort::delegate) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSPortDelegate([self delegate]));
  }
}

#include "NNSRunLoop.h"
#include "NNSObjCRuntime.h"

NAN_METHOD(NNSPort::scheduleInRunLoopForMode) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSRunLoop, runLoop);
    declare_value(NSRunLoopMode, mode);
    [self scheduleInRunLoop: runLoop forMode: mode];
  }
}

NAN_METHOD(NNSPort::removeFromRunLoopForMode) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSRunLoop, runLoop);
    declare_value(NSRunLoopMode, mode);
    [self removeFromRunLoop: runLoop forMode: mode];
  }
}

NAN_METHOD(NNSPort::sendBeforeDateComponentsFromReserved) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, limitDate);
    declare_nullable_pointer(NSMutableArray, components);
    declare_nullable_pointer(NSPort, receivePort);
    declare_value(NSUInteger, headerSpaceReserved);
    JS_SET_RETURN(js_value_BOOL([self sendBeforeDate: limitDate components: components from: receivePort reserved: headerSpaceReserved]));
  }
}

NAN_METHOD(NNSPort::sendBeforeDateMsgidComponentsFromReserved) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, limitDate);
    declare_value(NSUInteger, msgID);
    declare_nullable_pointer(NSMutableArray, components);
    declare_nullable_pointer(NSPort, receivePort);
    declare_value(NSUInteger, headerSpaceReserved);
    JS_SET_RETURN(js_value_BOOL([self sendBeforeDate: limitDate msgid: msgID components: components from: receivePort reserved: headerSpaceReserved]));
  }
}


#if TARGET_OS_MAC || TARGET_OS_UIKITFORMAC

//#include "NNSConnection.h"
#define js_value_NSConnection(x) js_value_wrapper_unknown(x, NSConnection)
#define to_value_NSConnection(x) to_value_wrapper_unknown(x, NSConnection)
#define is_value_NSConnection(x) is_value_wrapper_unknown(x, NSConnection)

NAN_METHOD(NNSPort::addConnectionToRunLoopForMode) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSConnection, conn);
    declare_pointer(NSRunLoop, runLoop);
    declare_value(NSRunLoopMode, mode);
    [self addConnection: conn toRunLoop: runLoop forMode: mode];
  }
}

NAN_METHOD(NNSPort::removeConnectionFromRunLoopForMode) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSConnection, conn);
    declare_pointer(NSRunLoop, runLoop);
    declare_value(NSRunLoopMode, mode);
    [self removeConnection: conn fromRunLoop: runLoop forMode: mode];
  }
}
#endif

NAN_GETTER(NNSPort::isValidGetter) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isValid]));
  }
}

NAN_GETTER(NNSPort::reservedSpaceLengthGetter) {
  JS_UNWRAP(NSPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self reservedSpaceLength]));
  }
}
