//
//  NMTLHeap.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLHeap.h"

#define instancetype MTLHeap
#define js_value_instancetype js_value_MTLHeap

NMTLHeap::NMTLHeap() {}
NMTLHeap::~NMTLHeap() {}

JS_INIT_PROTOCOL(MTLHeap, NSObject);
  JS_ASSIGN_PROTO_METHOD(maxAvailableSizeWithAlignment);
  JS_ASSIGN_PROTO_METHOD(newBufferWithLengthOptions);
  JS_ASSIGN_PROTO_METHOD(newTextureWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(setPurgeableState);
  JS_ASSIGN_PROTO_PROP(label);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP_READONLY(storageMode);
  JS_ASSIGN_PROTO_PROP_READONLY(cpuCacheMode);
  JS_ASSIGN_PROTO_PROP_READONLY(size);
  JS_ASSIGN_PROTO_PROP_READONLY(usedSize);
  JS_ASSIGN_PROTO_PROP_READONLY(currentAllocatedSize);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLHeap, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLHeap, NSObject);

NAN_METHOD(NMTLHeap::New) {
  JS_RECONSTRUCT(MTLHeap);
  @autoreleasepool {
    id<MTLHeap> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLHeap>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLHeap> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLHeap, value);
      self = value;
    }
    if (self) {
      NMTLHeap *wrapper = new NMTLHeap();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLHeap::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLHeap::maxAvailableSizeWithAlignment) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, alignment);
    JS_SET_RETURN(js_value_NSUInteger([self maxAvailableSizeWithAlignment: alignment]));
  }
}

#include "NMTLBuffer.h"

NAN_METHOD(NMTLHeap::newBufferWithLengthOptions) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, length);
    declare_value(MTLResourceOptions, options);
    JS_SET_RETURN(js_value_MTLBuffer([self newBufferWithLength: length options: options]));
  }
}

#include "NMTLTexture.h"
#include "NMTLTextureDescriptor.h"

NAN_METHOD(NMTLHeap::newTextureWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLTextureDescriptor, desc);
    JS_SET_RETURN(js_value_MTLTexture([self newTextureWithDescriptor: desc]));
  }
}

NAN_METHOD(NMTLHeap::setPurgeableState) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPurgeableState, state);
    JS_SET_RETURN(js_value_MTLPurgeableState([self setPurgeableState: state]));
  }
}

NAN_GETTER(NMTLHeap::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLHeap::labelSetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLHeap::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

NAN_GETTER(NMTLHeap::storageModeGetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStorageMode([self storageMode]));
  }
}

NAN_GETTER(NMTLHeap::cpuCacheModeGetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCPUCacheMode([self cpuCacheMode]));
  }
}

NAN_GETTER(NMTLHeap::sizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self size]));
  }
}

NAN_GETTER(NMTLHeap::usedSizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self usedSize]));
  }
}

NAN_GETTER(NMTLHeap::currentAllocatedSizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLHeap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self currentAllocatedSize]));
  }
}
