//
//  NSCNSkinner.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNSkinner.h"

#define instancetype SCNSkinner
#define js_value_instancetype js_value_SCNSkinner

NSCNSkinner::NSCNSkinner() {}
NSCNSkinner::~NSCNSkinner() {}

JS_INIT_CLASS(SCNSkinner, NSObject);
  JS_ASSIGN_STATIC_METHOD(skinnerWithBaseGeometryBonesBoneInverseBindTransformsBoneWeightsBoneIndices);
  JS_ASSIGN_PROTO_PROP(skeleton);
  JS_ASSIGN_PROTO_PROP(baseGeometry);
  JS_ASSIGN_PROTO_PROP(baseGeometryBindTransform);
  JS_ASSIGN_PROTO_PROP_READONLY(boneInverseBindTransforms);
  JS_ASSIGN_PROTO_PROP_READONLY(bones);
  JS_ASSIGN_PROTO_PROP_READONLY(boneWeights);
  JS_ASSIGN_PROTO_PROP_READONLY(boneIndices);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNSkinner, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNSkinner, NSObject);

NAN_METHOD(NSCNSkinner::New) {
  JS_RECONSTRUCT(SCNSkinner);
  @autoreleasepool {
    SCNSkinner* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNSkinner *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNSkinner alloc] init];
    }
    if (self) {
      NSCNSkinner *wrapper = new NSCNSkinner();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNSkinner::New: invalid arguments");
    }
  }
}

#include "NSCNNode.h"
#include "NSCNGeometry.h"

NAN_METHOD(NSCNSkinner::skinnerWithBaseGeometryBonesBoneInverseBindTransformsBoneWeightsBoneIndices) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(SCNGeometry, baseGeometry);
    declare_pointer(NSArray<SCNNode*>, bones);
    declare_nullable_pointer(NSArray/* <NSValue*>*/, boneInverseBindTransforms);
    declare_pointer(SCNGeometrySource, boneWeights);
    declare_pointer(SCNGeometrySource, boneIndices);
    JS_SET_RETURN(js_value_instancetype([SCNSkinner skinnerWithBaseGeometry: baseGeometry bones: bones boneInverseBindTransforms: boneInverseBindTransforms boneWeights: boneWeights boneIndices: boneIndices]));
  }
}

NAN_GETTER(NSCNSkinner::skeletonGetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self skeleton]));
  }
}

NAN_SETTER(NSCNSkinner::skeletonSetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNNode, input);
    [self setSkeleton: input];
  }
}

NAN_GETTER(NSCNSkinner::baseGeometryGetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometry([self baseGeometry]));
  }
}

NAN_SETTER(NSCNSkinner::baseGeometrySetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNGeometry, input);
    [self setBaseGeometry: input];
  }
}

NAN_GETTER(NSCNSkinner::baseGeometryBindTransformGetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMatrix4([self baseGeometryBindTransform]));
  }
}

NAN_SETTER(NSCNSkinner::baseGeometryBindTransformSetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNMatrix4, input);
    [self setBaseGeometryBindTransform: input];
  }
}

NAN_GETTER(NSCNSkinner::boneInverseBindTransformsGetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSValue*>([self boneInverseBindTransforms]));
  }
}

NAN_GETTER(NSCNSkinner::bonesGetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNNode*>([self bones]));
  }
}

NAN_GETTER(NSCNSkinner::boneWeightsGetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometrySource([self boneWeights]));
  }
}

NAN_GETTER(NSCNSkinner::boneIndicesGetter) {
  JS_UNWRAP(SCNSkinner, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometrySource([self boneIndices]));
  }
}

