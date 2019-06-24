//
//  NMTLIndirectCommandBuffer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLIndirectCommandBuffer.h"

#define instancetype MTLIndirectCommandBuffer
#define js_value_instancetype js_value_MTLIndirectCommandBuffer

NMTLIndirectCommandBuffer::NMTLIndirectCommandBuffer() {}
NMTLIndirectCommandBuffer::~NMTLIndirectCommandBuffer() {}

JS_INIT_PROTOCOL(MTLIndirectCommandBuffer, MTLResource);
  JS_ASSIGN_PROTO_METHOD(resetWithRange);
  JS_ASSIGN_PROTO_METHOD(indirectRenderCommandAtIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(size);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLIndirectCommandBuffer, MTLResource);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLIndirectCommandBuffer, MTLResource);


NAN_METHOD(NMTLIndirectCommandBuffer::New) {
  JS_RECONSTRUCT(MTLIndirectCommandBuffer);
  @autoreleasepool {
    id<MTLIndirectCommandBuffer> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLIndirectCommandBuffer>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLIndirectCommandBuffer> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLIndirectCommandBuffer, value);
      self = value;
    }
    if (self) {
      NMTLIndirectCommandBuffer *wrapper = new NMTLIndirectCommandBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLIndirectCommandBuffer::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLIndirectCommandBuffer::resetWithRange) {
  JS_UNWRAP_PROTOCOL(MTLIndirectCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    [self resetWithRange: range];
  }
}

#include "NMTLIndirectRenderCommand.h"

NAN_METHOD(NMTLIndirectCommandBuffer::indirectRenderCommandAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLIndirectCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, commandIndex);
    JS_SET_RETURN(js_value_MTLIndirectRenderCommand([self indirectRenderCommandAtIndex: commandIndex]));
  }
}

NAN_GETTER(NMTLIndirectCommandBuffer::sizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLIndirectCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self size]));
  }
}
