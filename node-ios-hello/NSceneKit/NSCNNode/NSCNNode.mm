//
//  NSCNNode.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#import <SceneKit/ModelIO.h>
#include "defines.h"
#include "NSCNNode.h"
#include "NNSObject.h"
#include "NSCNLight.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSCNNode::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addChildNode", AddChildNode);
  Nan::SetMethod(proto, "clone", Clone);
  JS_SET_PROP(proto, "simdTransform", SimdTransform);
  JS_SET_PROP(proto, "simdWorldTransform", SimdWorldTransform);
  JS_SET_PROP(proto, "light", Light);
  JS_SET_PROP(proto, "position", Position);
  JS_SET_PROP(proto, "eulerAngles", EulerAngles);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNNode *node = new NSCNNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SCNNode *)(info[0].As<External>()->Value()));
  } else if (info[0]->IsString()) {
    @autoreleasepool {
      NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
      NSString *fileName = NJSStringToNSString(info[0]);
      if (strcmp([fileName UTF8String], "box") == 0) {
        SCNBox* box = [SCNBox boxWithWidth:0.1 height:0.1 length:0.1 chamferRadius:0];
        SCNNode* scnNode = [SCNNode nodeWithGeometry:box];
        SCNMaterial *mat = [[SCNMaterial alloc] init];
        [[mat diffuse] setContents: [SCNColor whiteColor]];
        mat.diffuse.intensity = 60;
        [box setMaterials:@[mat]];
        node->SetNSObject(scnNode);
      } else {
        NSString *filePath = [documents stringByAppendingPathComponent:fileName];
        NSURL *url = [[NSURL alloc] initFileURLWithPath:filePath];
        MDLAsset *asset = [[MDLAsset alloc] initWithURL:url];
        MDLObject *object = [asset objectAtIndex:0];
        SCNNode *scnNode = [SCNNode nodeWithMDLObject:object];
        SCNMaterial *mat = [[SCNMaterial alloc] init];
        [[mat diffuse] setContents: [SCNColor whiteColor]];
        mat.diffuse.intensity = 60;
        [[scnNode geometry] setMaterials:@[mat]];
        node->SetNSObject(scnNode);
      }
    }
  } else {
    @autoreleasepool {
      node->SetNSObject([[SCNNode alloc] init]);
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSCNNode::NSCNNode () {}
NSCNNode::~NSCNNode () {}

NAN_METHOD(NSCNNode::AddChildNode) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  NSCNNode *child = ObjectWrap::Unwrap<NSCNNode>(Local<Object>::Cast(info[0]));
  
  [node addChildNode:child->As<SCNNode>()];
}

NAN_METHOD(NSCNNode::Clone) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);
  JS_SET_RETURN(sweetiekit::GetWrapperFor([node clone], NSCNNode::type));
}

NAN_GETTER(NSCNNode::SimdTransformGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  auto xform = node.simdTransform;
  const float* matrix = (const float*)&xform;
  JS_SET_RETURN(createTypedArray<Float32Array>(16, matrix));
}

NAN_SETTER(NSCNNode::SimdTransformSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  auto xform = node.simdWorldTransform;
  if (!sweetiekit::SetTransform(xform, value)) {
    Nan::ThrowError("SCNNode:setSimdTransform: invalid transform type");
  } else {
    [node setSimdTransform:xform];
  }
}

NAN_GETTER(NSCNNode::SimdWorldTransformGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  auto xform = node.simdWorldTransform;
  const float* matrix = (const float*)&xform;
  JS_SET_RETURN(createTypedArray<Float32Array>(16, matrix));
}

NAN_SETTER(NSCNNode::SimdWorldTransformSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  auto xform = node.simdWorldTransform;
  if (!sweetiekit::SetTransform(xform, value)) {
    Nan::ThrowError("SCNNode:setSimdWorldTransform: invalid transform type");
  } else {
    [node setSimdWorldTransform:xform];
  }
}


NAN_GETTER(NSCNNode::LightGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([node light], NSCNLight::type)));
}

NAN_SETTER(NSCNNode::LightSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  NSCNLight *light = ObjectWrap::Unwrap<NSCNLight>(Local<Object>::Cast(value));

  @autoreleasepool {
    [node setLight:light->As<SCNLight>()];
  }
}

NAN_GETTER(NSCNNode::PositionGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  __block float x = 0;
  __block float y = 0;
  __block float z = 0;
  @autoreleasepool {
    SCNVector3 v = [node position];
    x = v.x;
    y = v.y;
    z = v.z;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(x));
  result->Set(JS_STR("y"), JS_FLOAT(y));
  result->Set(JS_STR("z"), JS_FLOAT(z));

  JS_SET_RETURN(result);
}

NAN_SETTER(NSCNNode::PositionSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  float x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
  float y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
  float z = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("z")));

  @autoreleasepool {
    [node setPosition:SCNVector3Make(x, y, z)];
  }
}

NAN_GETTER(NSCNNode::EulerAnglesGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  __block float x = 0;
  __block float y = 0;
  __block float z = 0;
  @autoreleasepool {
    SCNVector3 v = [node eulerAngles];
    x = v.x;
    y = v.y;
    z = v.z;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(x));
  result->Set(JS_STR("y"), JS_FLOAT(y));
  result->Set(JS_STR("z"), JS_FLOAT(z));

  JS_SET_RETURN(result);
}

NAN_SETTER(NSCNNode::EulerAnglesSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);

  float x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
  float y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
  float z = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("z")));

  @autoreleasepool {
    [node setEulerAngles:SCNVector3Make(x, y, z)];
  }
}
