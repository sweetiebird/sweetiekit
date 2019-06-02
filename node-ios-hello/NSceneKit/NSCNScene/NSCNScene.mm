//
//  NSCNScene.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNScene.h"

NSCNScene::NSCNScene () {}
NSCNScene::~NSCNScene () {}

JS_INIT_CLASS(SCNScene, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, rootNode);
  // static members (ctor)
  JS_INIT_CTOR(SCNScene, NSObject);
JS_INIT_CLASS_END(SCNScene, NSObject);

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

#include "NSCNNode.h"

NAN_GETTER(NSCNScene::rootNodeGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SCNScene, scene);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([scene rootNode], NSCNNode::type));
}

NAN_SETTER(NSCNScene::rootNodeSetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NSCNScene::RootNodeSetter is read-only; use scene.rootNode.addChildNode instead");
}

