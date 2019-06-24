//
//  NMTLHeapDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLHeapDescriptor.h"

#define instancetype MTLHeapDescriptor
#define js_value_instancetype js_value_MTLHeapDescriptor

NMTLHeapDescriptor::NMTLHeapDescriptor() {}
NMTLHeapDescriptor::~NMTLHeapDescriptor() {}

JS_INIT_CLASS(MTLHeapDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(size);
  JS_ASSIGN_PROTO_PROP(storageMode);
  JS_ASSIGN_PROTO_PROP(cpuCacheMode);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLHeapDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLHeapDescriptor, NSObject);

NAN_METHOD(NMTLHeapDescriptor::New) {
  JS_RECONSTRUCT(MTLHeapDescriptor);
  @autoreleasepool {
    MTLHeapDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLHeapDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLHeapDescriptor alloc] init];
    }
    if (self) {
      NMTLHeapDescriptor *wrapper = new NMTLHeapDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLHeapDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLHeapDescriptor::sizeGetter) {
  JS_UNWRAP(MTLHeapDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self size]));
  }
}

NAN_SETTER(NMTLHeapDescriptor::sizeSetter) {
  JS_UNWRAP(MTLHeapDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSize: input];
  }
}

#include "NMTLResource.h"

NAN_GETTER(NMTLHeapDescriptor::storageModeGetter) {
  JS_UNWRAP(MTLHeapDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStorageMode([self storageMode]));
  }
}

NAN_SETTER(NMTLHeapDescriptor::storageModeSetter) {
  JS_UNWRAP(MTLHeapDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStorageMode, input);
    [self setStorageMode: input];
  }
}

NAN_GETTER(NMTLHeapDescriptor::cpuCacheModeGetter) {
  JS_UNWRAP(MTLHeapDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCPUCacheMode([self cpuCacheMode]));
  }
}

NAN_SETTER(NMTLHeapDescriptor::cpuCacheModeSetter) {
  JS_UNWRAP(MTLHeapDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLCPUCacheMode, input);
    [self setCpuCacheMode: input];
  }
}
