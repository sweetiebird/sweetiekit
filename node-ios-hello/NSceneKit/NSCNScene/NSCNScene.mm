//
//  NSCNScene.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NSCNScene.h"
#include "NARSession.h"
#include "NSCNNode.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSCNScene::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNScene::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNScene"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "rootNode", RootNode);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNScene::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNScene *scene = new NSCNScene();

  if (info[0]->IsExternal()) {
    scene->SetNSObject((__bridge SCNScene *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    std::string file;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      file = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
      NSString *fileName = [NSString stringWithUTF8String:file.c_str()];
      NSString *filePath = [documents stringByAppendingPathComponent:fileName];
      NSURL *url = [[NSURL alloc] initFileURLWithPath:filePath];
      scene->SetNSObject([SCNScene sceneWithURL:url options:nullptr error:nullptr]);
    }
  } else {
    scene->SetNSObject([[SCNScene alloc] init]);
  }
  scene->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSCNScene::NSCNScene () {}
NSCNScene::~NSCNScene () {}

NAN_GETTER(NSCNScene::RootNodeGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SCNScene, scene);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([scene rootNode], NSCNNode::type)));
}

NAN_SETTER(NSCNScene::RootNodeSetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NSCNScene::RootNodeSetter is read-only; use scene.rootNode.addChildNode instead");
}

