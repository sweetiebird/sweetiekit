//
//  NMTLCommandEncoder.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLCommandEncoder.h"

#define instancetype MTLCommandEncoder
#define js_value_instancetype js_value_MTLCommandEncoder

NMTLCommandEncoder::NMTLCommandEncoder() {}
NMTLCommandEncoder::~NMTLCommandEncoder() {}

JS_INIT_PROTOCOL(MTLCommandEncoder, NSObject);
  JS_ASSIGN_PROTO_METHOD(endEncoding);
  JS_ASSIGN_PROTO_METHOD(insertDebugSignpost);
  JS_ASSIGN_PROTO_METHOD(pushDebugGroup);
  JS_ASSIGN_PROTO_METHOD(popDebugGroup);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP(label);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLCommandEncoder, NSObject);
  // constant values (exports)

  //typedef NS_OPTIONS(NSUInteger, MTLResourceUsage) {
    JS_ASSIGN_ENUM(MTLResourceUsageRead, NSUInteger); //   = 1 << 0,
    JS_ASSIGN_ENUM(MTLResourceUsageWrite, NSUInteger); //  = 1 << 1,
    JS_ASSIGN_ENUM(MTLResourceUsageSample, NSUInteger); // = 1 << 2
  //} API_AVAILABLE(macos(10.13), ios(11.0));

  //typedef NS_OPTIONS(NSUInteger, MTLBarrierScope) {
    JS_ASSIGN_ENUM(MTLBarrierScopeBuffers, NSUInteger); // = 1 << 0,
    JS_ASSIGN_ENUM(MTLBarrierScopeTextures, NSUInteger); // = 1 << 1,
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLBarrierScopeRenderTargets, NSUInteger); // API_AVAILABLE(macos(10.14)) API_UNAVAILABLE(ios) = 1 << 2,
#endif
  //} API_AVAILABLE(macos(10.14), ios(12.0));

JS_INIT_PROTOCOL_END(MTLCommandEncoder, NSObject);


NAN_METHOD(NMTLCommandEncoder::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLCommandEncoder);
  @autoreleasepool {
    id<MTLCommandEncoder> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLCommandEncoder>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLCommandEncoder> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLCommandEncoder, value);
      self = value;
    }
    if (self) {
      NMTLCommandEncoder *wrapper = new NMTLCommandEncoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLCommandEncoder::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLCommandEncoder::endEncoding) {
  JS_UNWRAP_PROTOCOL(MTLCommandEncoder, self);
  declare_autoreleasepool {
    [self endEncoding];
  }
}

NAN_METHOD(NMTLCommandEncoder::insertDebugSignpost) {
  JS_UNWRAP_PROTOCOL(MTLCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    [self insertDebugSignpost: string];
  }
}

NAN_METHOD(NMTLCommandEncoder::pushDebugGroup) {
  JS_UNWRAP_PROTOCOL(MTLCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    [self pushDebugGroup: string];
  }
}

NAN_METHOD(NMTLCommandEncoder::popDebugGroup) {
  JS_UNWRAP_PROTOCOL(MTLCommandEncoder, self);
  declare_autoreleasepool {
    [self popDebugGroup];
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLCommandEncoder::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandEncoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

NAN_GETTER(NMTLCommandEncoder::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandEncoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLCommandEncoder::labelSetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandEncoder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}

