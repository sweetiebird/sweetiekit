//
//  SKTransformNode.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKTransformNode.h"

NSKTransformNode::NSKTransformNode() {}
NSKTransformNode::~NSKTransformNode() {}

JS_INIT_CLASS(SKTransformNode, SKNode);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, xRotation);
  JS_ASSIGN_PROP(proto, yRotation);
  JS_ASSIGN_PROP(proto, eulerAngles);
  JS_ASSIGN_PROP(proto, rotationMatrix);
  JS_ASSIGN_PROP(proto, quaternion);
  // static members (ctor)
  JS_INIT_CTOR(SKTransformNode, SKNode);
JS_INIT_CLASS_END(SKTransformNode, SKNode);

NAN_METHOD(NSKTransformNode::New) {
  JS_RECONSTRUCT(SKTransformNode);

  Local<Object> obj = info.This();

  NSKTransformNode *ui = new NSKTransformNode();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKTransformNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKTransformNode alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NSKTransformNode::xRotationGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self xRotation]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::xRotationSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setXRotation: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKTransformNode::yRotationGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self yRotation]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::yRotationSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setYRotation: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKTransformNode::eulerAnglesGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_vector_float3([self eulerAngles]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::eulerAnglesSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setEulerAngles: to_value_vector_float3(value)];
  }
}

NAN_GETTER(NSKTransformNode::rotationMatrixGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_matrix_float3x3([self rotationMatrix]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::rotationMatrixSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setRotationMatrix: to_value_matrix_float3x3(value)];
  }
}

NAN_GETTER(NSKTransformNode::quaternionGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_quatf([self quaternion]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::quaternionSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setQuaternion: to_value_simd_quatf(value)];
  }
}
