//
//  NNSSocketPort.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSSocketPort.h"

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || 0 || TARGET_IPHONE_SIMULATOR

#define instancetype NSSocketPort
#define js_value_instancetype js_value_NSSocketPort

NNSSocketPort::NNSSocketPort() {}
NNSSocketPort::~NNSSocketPort() {}

JS_INIT_CLASS(NSSocketPort, NSPort);
  JS_ASSIGN_PROTO_METHOD(initWithTCPPort);
  JS_ASSIGN_PROTO_METHOD(initWithProtocolFamilySocketTypeProtocolAddress);
  JS_ASSIGN_PROTO_METHOD(initWithProtocolFamilySocketTypeProtocolSocket);
  JS_ASSIGN_PROTO_METHOD(initRemoteWithTCPPortHost);
  JS_ASSIGN_PROTO_METHOD(initRemoteWithProtocolFamilySocketTypeProtocolAddress);
  JS_ASSIGN_PROTO_PROP_READONLY(protocolFamily);
  JS_ASSIGN_PROTO_PROP_READONLY(socketType);
  JS_ASSIGN_PROTO_PROP_READONLY(protocol);
  JS_ASSIGN_PROTO_PROP_READONLY(address);
  JS_ASSIGN_PROTO_PROP_READONLY(socket);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSSocketPort, NSPort);
  // constant values (exports)
JS_INIT_CLASS_END(NSSocketPort, NSPort);

NAN_METHOD(NNSSocketPort::New) {
  JS_RECONSTRUCT(NSSocketPort);
  @autoreleasepool {
    NSSocketPort* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSSocketPort *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSSocketPort alloc] init];
    }
    if (self) {
      NNSSocketPort *wrapper = new NNSSocketPort();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSSocketPort::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSSocketPort::initWithTCPPort) {
  JS_UNWRAP_OR_ALLOC(NSSocketPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint16_t, port);
    JS_SET_RETURN(js_value_instancetype([self initWithTCPPort: port]));
  }
}

NAN_METHOD(NNSSocketPort::initWithProtocolFamilySocketTypeProtocolAddress) {
  JS_UNWRAP_OR_ALLOC(NSSocketPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int, family);
    declare_value(int, type);
    declare_value(int, protocol);
    declare_pointer(NSData, address);
    JS_SET_RETURN(js_value_instancetype([self initWithProtocolFamily: family socketType: type protocol: protocol address: address]));
  }
}

#define js_value_NSSocketNativeHandle js_value_int32_t
#define to_value_NSSocketNativeHandle to_value_int32_t
#define is_value_NSSocketNativeHandle is_value_int32_t

NAN_METHOD(NNSSocketPort::initWithProtocolFamilySocketTypeProtocolSocket) {
  JS_UNWRAP_OR_ALLOC(NSSocketPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int, family);
    declare_value(int, type);
    declare_value(int, protocol);
    declare_value(NSSocketNativeHandle, sock);
    JS_SET_RETURN(js_value_instancetype([self initWithProtocolFamily: family socketType: type protocol: protocol socket: sock]));
  }
}

NAN_METHOD(NNSSocketPort::initRemoteWithTCPPortHost) {
  JS_UNWRAP_OR_ALLOC(NSSocketPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint16_t, port);
    declare_nullable_pointer(NSString, hostName);
    JS_SET_RETURN(js_value_instancetype([self initRemoteWithTCPPort: port host: hostName]));
  }
}

NAN_METHOD(NNSSocketPort::initRemoteWithProtocolFamilySocketTypeProtocolAddress) {
  JS_UNWRAP_OR_ALLOC(NSSocketPort, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int, family);
    declare_value(int, type);
    declare_value(int, protocol);
    declare_pointer(NSData, address);
    JS_SET_RETURN(js_value_instancetype([self initRemoteWithProtocolFamily: family socketType: type protocol: protocol address: address]));
  }
}

NAN_GETTER(NNSSocketPort::protocolFamilyGetter) {
  JS_UNWRAP(NSSocketPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_int([self protocolFamily]));
  }
}

NAN_GETTER(NNSSocketPort::socketTypeGetter) {
  JS_UNWRAP(NSSocketPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_int([self socketType]));
  }
}

NAN_GETTER(NNSSocketPort::protocolGetter) {
  JS_UNWRAP(NSSocketPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_int([self protocol]));
  }
}

NAN_GETTER(NNSSocketPort::addressGetter) {
  JS_UNWRAP(NSSocketPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self address]));
  }
}

NAN_GETTER(NNSSocketPort::socketGetter) {
  JS_UNWRAP(NSSocketPort, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSocketNativeHandle([self socket]));
  }
}

#endif
