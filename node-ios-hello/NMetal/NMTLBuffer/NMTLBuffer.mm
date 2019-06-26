//
//  NMTLBuffer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLBuffer.h"

#define instancetype MTLBuffer
#define js_value_instancetype js_value_MTLBuffer

NMTLBuffer::NMTLBuffer() {}
NMTLBuffer::~NMTLBuffer() {}

JS_INIT_PROTOCOL(MTLBuffer, MTLResource);
  JS_ASSIGN_PROTO_METHOD(contents);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(didModifyRange);
#endif
  JS_ASSIGN_PROTO_METHOD(newTextureWithDescriptorOffsetBytesPerRow);
  JS_ASSIGN_PROTO_METHOD(addDebugMarkerRange);
  JS_ASSIGN_PROTO_METHOD(removeAllDebugMarkers);
  JS_ASSIGN_PROTO_PROP_READONLY(length);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLBuffer, MTLResource);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLBuffer, MTLResource);

NAN_METHOD(NMTLBuffer::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLBuffer);
  @autoreleasepool {
    id<MTLBuffer> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLBuffer>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLBuffer> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLBuffer, value);
      self = value;
    }
    if (self) {
      NMTLBuffer *wrapper = new NMTLBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLBuffer::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLBuffer::contents) {
  JS_UNWRAP_PROTOCOL(MTLBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_void_pointer([self contents]));
  }
}

#if !TARGET_OS_IPHONE
NAN_METHOD(NMTLBuffer::didModifyRange) {
  JS_UNWRAP_PROTOCOL(MTLBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    [self didModifyRange: range];
  }
}
#endif

#include "NMTLTexture.h"
#include "NMTLTextureDescriptor.h"

NAN_METHOD(NMTLBuffer::newTextureWithDescriptorOffsetBytesPerRow) {
  JS_UNWRAP_PROTOCOL(MTLBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLTextureDescriptor, descriptor);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, bytesPerRow);
    JS_SET_RETURN(js_value_MTLTexture([self newTextureWithDescriptor: descriptor offset: offset bytesPerRow: bytesPerRow]));
  }
}

NAN_METHOD(NMTLBuffer::addDebugMarkerRange) {
  JS_UNWRAP_PROTOCOL(MTLBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, marker);
    declare_value(NSRange, range);
    [self addDebugMarker: marker range: range];
  }
}

NAN_METHOD(NMTLBuffer::removeAllDebugMarkers) {
  JS_UNWRAP_PROTOCOL(MTLBuffer, self);
  declare_autoreleasepool {
    [self removeAllDebugMarkers];
  }
}

NAN_GETTER(NMTLBuffer::lengthGetter) {
  JS_UNWRAP_PROTOCOL(MTLBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self length]));
  }
}
