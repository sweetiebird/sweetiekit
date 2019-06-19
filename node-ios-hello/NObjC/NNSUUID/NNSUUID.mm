//
//  NNSUUID.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSUUID.h"

#define instancetype NSUUID
#define js_value_instancetype js_value_NSUUID

NNSUUID::NNSUUID() {}
NNSUUID::~NNSUUID() {}

JS_INIT_CLASS(NSUUID, NSObject);
  JS_ASSIGN_STATIC_METHOD(UUID);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithUUIDString);
  JS_ASSIGN_PROTO_METHOD(initWithUUIDBytes);
  JS_ASSIGN_PROTO_METHOD(getUUIDBytes);
  JS_ASSIGN_PROTO_PROP_READONLY(UUIDString);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSUUID, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSUUID, NSObject);

NAN_METHOD(NNSUUID::New) {
  JS_RECONSTRUCT(NSUUID);
  @autoreleasepool {
    NSUUID* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSUUID *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSUUID alloc] init];
    }
    if (self) {
      NNSUUID *wrapper = new NNSUUID();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSUUID::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSUUID::UUID) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([NSUUID UUID]));
  }
}

NAN_METHOD(NNSUUID::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[NSUUID alloc] init]));
  }
}

NAN_METHOD(NNSUUID::initWithUUIDString) {
  JS_UNWRAP_OR_ALLOC(NSUUID, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_instancetype([self initWithUUIDString: string]));
  }
}

NAN_METHOD(NNSUUID::initWithUUIDBytes) {
  JS_UNWRAP_OR_ALLOC(NSUUID, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, bytesData);
    const void* bytes = [bytesData bytes];
    NSUInteger length = [bytesData length];
    if (length < sizeof(uuid_t)) {
      js_panic_noreturn("UUIDBytes must be >= sizeof(uuid_t)");
      return;
    }
    uuid_t uuid;
    memcpy(uuid, bytes, sizeof(uuid_t));
    JS_SET_RETURN(js_value_instancetype([self initWithUUIDBytes: uuid]));
  }
}

NAN_METHOD(NNSUUID::getUUIDBytes) {
  JS_UNWRAP(NSUUID, self);
  declare_autoreleasepool {
    declare_args();
    uuid_t uuid;
    [self getUUIDBytes: uuid];
    JS_SET_RETURN(sweetiekit::CreateArrayBufferFromPointerLength(uuid, sizeof(uuid_t)));
  }
}

NAN_GETTER(NNSUUID::UUIDStringGetter) {
  JS_UNWRAP(NSUUID, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self UUIDString]));
  }
}
