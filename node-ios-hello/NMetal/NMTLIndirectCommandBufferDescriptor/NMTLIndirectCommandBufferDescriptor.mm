//
//  NMTLIndirectCommandBufferDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLIndirectCommandBufferDescriptor.h"

#define instancetype MTLIndirectCommandBufferDescriptor
#define js_value_instancetype js_value_MTLIndirectCommandBufferDescriptor

NMTLIndirectCommandBufferDescriptor::NMTLIndirectCommandBufferDescriptor() {}
NMTLIndirectCommandBufferDescriptor::~NMTLIndirectCommandBufferDescriptor() {}

JS_INIT_CLASS(MTLIndirectCommandBufferDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(commandTypes);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP(inheritPipelineState);
#endif
  JS_ASSIGN_PROTO_PROP(inheritBuffers);
  JS_ASSIGN_PROTO_PROP(maxVertexBufferBindCount);
  JS_ASSIGN_PROTO_PROP(maxFragmentBufferBindCount);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLIndirectCommandBufferDescriptor, NSObject);
  // constant values (exports)

  //typedef NS_OPTIONS(NSUInteger, MTLIndirectCommandType) {
    JS_ASSIGN_ENUM(MTLIndirectCommandTypeDraw, NSUInteger); //                = (1 << 0),
    JS_ASSIGN_ENUM(MTLIndirectCommandTypeDrawIndexed, NSUInteger); //         = (1 << 1),
    JS_ASSIGN_ENUM(MTLIndirectCommandTypeDrawPatches, NSUInteger); //         = (1 << 2),
    JS_ASSIGN_ENUM(MTLIndirectCommandTypeDrawIndexedPatches, NSUInteger); //  = (1 << 3) ,
  //} API_AVAILABLE(macos(10.14), ios(12.0));

JS_INIT_CLASS_END(MTLIndirectCommandBufferDescriptor, NSObject);

NAN_METHOD(NMTLIndirectCommandBufferDescriptor::New) {
  JS_RECONSTRUCT(MTLIndirectCommandBufferDescriptor);
  @autoreleasepool {
    MTLIndirectCommandBufferDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLIndirectCommandBufferDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLIndirectCommandBufferDescriptor alloc] init];
    }
    if (self) {
      NMTLIndirectCommandBufferDescriptor *wrapper = new NMTLIndirectCommandBufferDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLIndirectCommandBufferDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLIndirectCommandBufferDescriptor::commandTypesGetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLIndirectCommandType([self commandTypes]));
  }
}

NAN_SETTER(NMTLIndirectCommandBufferDescriptor::commandTypesSetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLIndirectCommandType, input);
    [self setCommandTypes: input];
  }
}

#if !TARGET_OS_IPHONE
NAN_GETTER(NMTLIndirectCommandBufferDescriptor::inheritPipelineStateGetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self inheritPipelineState]));
  }
}

NAN_SETTER(NMTLIndirectCommandBufferDescriptor::inheritPipelineStateSetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInheritPipelineState: input];
  }
}
#endif

NAN_GETTER(NMTLIndirectCommandBufferDescriptor::inheritBuffersGetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self inheritBuffers]));
  }
}

NAN_SETTER(NMTLIndirectCommandBufferDescriptor::inheritBuffersSetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInheritBuffers: input];
  }
}

NAN_GETTER(NMTLIndirectCommandBufferDescriptor::maxVertexBufferBindCountGetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxVertexBufferBindCount]));
  }
}

NAN_SETTER(NMTLIndirectCommandBufferDescriptor::maxVertexBufferBindCountSetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMaxVertexBufferBindCount: input];
  }
}

NAN_GETTER(NMTLIndirectCommandBufferDescriptor::maxFragmentBufferBindCountGetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxFragmentBufferBindCount]));
  }
}

NAN_SETTER(NMTLIndirectCommandBufferDescriptor::maxFragmentBufferBindCountSetter) {
  JS_UNWRAP(MTLIndirectCommandBufferDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMaxFragmentBufferBindCount: input];
  }
}
