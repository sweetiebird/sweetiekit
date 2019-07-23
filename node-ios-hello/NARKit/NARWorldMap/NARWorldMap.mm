//
//  NARWorldMap.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARWorldMap.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define instancetype ARWorldMap
#define js_value_instancetype js_value_ARWorldMap

NARWorldMap::NARWorldMap() {}
NARWorldMap::~NARWorldMap() {}

JS_INIT_CLASS(ARWorldMap, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(center);
  JS_ASSIGN_PROTO_PROP_READONLY(extent);
  JS_ASSIGN_PROTO_PROP(anchors);
  JS_ASSIGN_PROTO_PROP_READONLY(rawFeaturePoints);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARWorldMap, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(ARWorldMap, NSObject);

NAN_METHOD(NARWorldMap::New) {
  JS_RECONSTRUCT(ARWorldMap);
  @autoreleasepool {
    ARWorldMap* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARWorldMap *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARWorldMap *wrapper = new NARWorldMap();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARWorldMap::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARWorldMap::centerGetter) {
  JS_UNWRAP(ARWorldMap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self center]));
  }
}

NAN_GETTER(NARWorldMap::extentGetter) {
  JS_UNWRAP(ARWorldMap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self extent]));
  }
}

NAN_GETTER(NARWorldMap::anchorsGetter) {
  JS_UNWRAP(ARWorldMap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<ARAnchor*>([self anchors]));
  }
}

NAN_SETTER(NARWorldMap::anchorsSetter) {
  JS_UNWRAP(ARWorldMap, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<ARAnchor*>, input);
    [self setAnchors: input];
  }
}

#include "NARPointCloud.h"

NAN_GETTER(NARWorldMap::rawFeaturePointsGetter) {
  JS_UNWRAP(ARWorldMap, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARPointCloud([self rawFeaturePoints]));
  }
}

#endif
