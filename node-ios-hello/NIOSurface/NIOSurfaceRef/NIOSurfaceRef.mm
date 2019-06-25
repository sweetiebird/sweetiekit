//
//  NIOSurfaceRef.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NIOSurfaceRef.h"

#if !TARGET_OS_SIMULATOR

#define instancetype IOSurfaceRef
#define js_value_instancetype js_value_IOSurfaceRef

Local<Value> js_value_IOSurfaceRef(IOSurfaceRef _Nullable value)
{
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

IOSurfaceRef _Nullable to_value_IOSurfaceRef(const Local<Value>& value, bool * _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  if (!is_value_IOSurfaceRef(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("to_value_IOSurfaceRef: expected an IOSurfaceRef");
    }
    return nil;
  }
  return (__bridge IOSurfaceRef)sweetiekit::GetValueFor(value, failed);
}

bool is_value_IOSurfaceRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}


#if 0
NIOSurfaceRef::NIOSurfaceRef() {}
NIOSurfaceRef::~NIOSurfaceRef() {}

JS_INIT_CLASS(IOSurfaceRef, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(IOSurfaceRef, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(IOSurfaceRef, NSObject);

NAN_METHOD(NIOSurfaceRef::New) {
  JS_RECONSTRUCT(IOSurfaceRef);
  @autoreleasepool {
    IOSurfaceRef* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge IOSurfaceRef *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[IOSurfaceRef alloc] init];
    }
    if (self) {
      NIOSurfaceRef *wrapper = new NIOSurfaceRef();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("IOSurfaceRef::New: invalid arguments");
    }
  }
}
#endif

#endif
