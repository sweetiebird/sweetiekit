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
      NSString *filePath = [documents stringByAppendingPathComponent:fileName];
      NSURL *url = [[NSURL alloc] initFileURLWithPath:filePath];
      MDLAsset *asset = [[MDLAsset alloc] initWithURL:url];
      MDLObject *object = [asset objectAtIndex:0];
      SCNNode *scene = [SCNNode nodeWithMDLObject:object];
      node->SetNSObject(scene);
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
