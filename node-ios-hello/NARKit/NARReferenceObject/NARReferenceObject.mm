//
//  NARReferenceObject.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARReferenceObject.h"

#define instancetype ARReferenceObject
#define js_value_instancetype js_value_ARReferenceObject

NARReferenceObject::NARReferenceObject() {}
NARReferenceObject::~NARReferenceObject() {}

JS_INIT_CLASS(ARReferenceObject, NSObject);
  JS_ASSIGN_STATIC_METHOD(referenceObjectsInGroupNamedBundle);
  JS_ASSIGN_PROTO_METHOD(initWithArchiveURLError);
  JS_ASSIGN_PROTO_METHOD(exportObjectToURLPreviewImageError);
  JS_ASSIGN_PROTO_METHOD(referenceObjectByApplyingTransform);
  JS_ASSIGN_PROTO_METHOD(referenceObjectByMergingObjectError);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP_READONLY(center);
  JS_ASSIGN_PROTO_PROP_READONLY(extent);
  JS_ASSIGN_PROTO_PROP_READONLY(scale);
  JS_ASSIGN_PROTO_PROP_READONLY(rawFeaturePoints);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARReferenceObject, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(ARReferenceObject, NSObject);

NAN_METHOD(NARReferenceObject::New) {
  JS_RECONSTRUCT(ARReferenceObject);
  @autoreleasepool {
    ARReferenceObject* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARReferenceObject *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARReferenceObject *wrapper = new NARReferenceObject();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARReferenceObject::New: invalid arguments");
    }
  }
}

#include "NNSBundle.h"

NAN_METHOD(NARReferenceObject::referenceObjectsInGroupNamedBundle) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSBundle, bundle);
    JS_SET_RETURN(js_value_NSSet/* <ARReferenceObject*>*/([ARReferenceObject referenceObjectsInGroupNamed: name bundle: bundle]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NARReferenceObject::initWithArchiveURLError) {
  JS_UNWRAP_OR_ALLOC(ARReferenceObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([self initWithArchiveURL: url error: &error]));
    js_panic_NSError(error);
  }
}

#include "NUIImage.h"

NAN_METHOD(NARReferenceObject::exportObjectToURLPreviewImageError) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(UIImage, previewImage);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self exportObjectToURL: url previewImage: previewImage error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NARReferenceObject::referenceObjectByApplyingTransform) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float4x4, transform);
    JS_SET_RETURN(js_value_ARReferenceObject([self referenceObjectByApplyingTransform: transform]));
  }
}

NAN_METHOD(NARReferenceObject::referenceObjectByMergingObjectError) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARReferenceObject, object);
    declare_error();
    JS_SET_RETURN(js_value_ARReferenceObject([self referenceObjectByMergingObject: object error: &error]));
    js_panic_NSError(error);
  }
}

NAN_GETTER(NARReferenceObject::nameGetter) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NARReferenceObject::nameSetter) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NARReferenceObject::centerGetter) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self center]));
  }
}

NAN_GETTER(NARReferenceObject::extentGetter) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self extent]));
  }
}

NAN_GETTER(NARReferenceObject::scaleGetter) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self scale]));
  }
}

#include "NARPointCloud.h"

NAN_GETTER(NARReferenceObject::rawFeaturePointsGetter) {
  JS_UNWRAP(ARReferenceObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARPointCloud([self rawFeaturePoints]));
  }
}

