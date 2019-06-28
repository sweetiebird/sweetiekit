//
//  NARPointCloud.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARPointCloud.h"

#define instancetype ARPointCloud
#define js_value_instancetype js_value_ARPointCloud

NARPointCloud::NARPointCloud() {}
NARPointCloud::~NARPointCloud() {}

JS_INIT_CLASS(ARPointCloud, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(count);
  JS_ASSIGN_PROTO_PROP_READONLY(points);
  JS_ASSIGN_PROTO_PROP_READONLY(identifiers);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARPointCloud, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(ARPointCloud, NSObject);

NAN_METHOD(NARPointCloud::New) {
  JS_RECONSTRUCT(ARPointCloud);
  @autoreleasepool {
    ARPointCloud* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARPointCloud *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARPointCloud *wrapper = new NARPointCloud();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARPointCloud::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARPointCloud::countGetter) {
  JS_UNWRAP(ARPointCloud, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self count]));
  }
}

NAN_GETTER(NARPointCloud::pointsGetter) {
  JS_UNWRAP(ARPointCloud, self);
  declare_autoreleasepool {
    // TODO: Think of a better way.
    NSUInteger count = [self count];
    const simd_float3* points = [self points];
    JS_SET_RETURN(createTypedArray<Float32Array>(3*count, reinterpret_cast<const float*>(points)));
  }
}

NAN_GETTER(NARPointCloud::identifiersGetter) {
  JS_UNWRAP(ARPointCloud, self);
  declare_autoreleasepool {
    // TODO: Think of a better way.
    NSUInteger count = [self count];
    const uint64_t* identifiers = [self identifiers];
    Local<Array> result(Nan::New<Array>(count));
    for (NSUInteger i = 0; i < count; i++) {
      result->Set(static_cast<uint32_t>(i), js_value_uint64_t(identifiers[i]));
    }
    JS_SET_RETURN(result);
  }
}
