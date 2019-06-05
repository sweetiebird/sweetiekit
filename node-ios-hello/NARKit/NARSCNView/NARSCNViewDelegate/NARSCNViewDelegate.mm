//
//  NARSCNViewDelegate.m
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NARSCNViewDelegate.h"
#include "NARSession.h"
#include "NARAnchor.h"
#include "NSCNView.h"
#include "NSCNNode.h"
#import "node_ios_hello-Swift.h"

NARSCNViewDelegate::NARSCNViewDelegate () {}
NARSCNViewDelegate::~NARSCNViewDelegate () {}

JS_INIT_CLASS(ARSCNViewDelegate, NSObject);
  // instance members (proto)
  
  // static members (ctor)
  JS_INIT_CTOR(ARSCNViewDelegate, NSObject);
  
JS_INIT_CLASS_END(ARSCNViewDelegate, NSObject);

NAN_METHOD(NARSCNViewDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARSCNViewDelegate *del = new NARSCNViewDelegate();

  if (info[0]->IsExternal()) {
    del->SetNSObject((__bridge SARSCNViewDelegate *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    del->_nodeForAnchor.Reset(Local<Function>::Cast(info[0]));

    @autoreleasepool {
      del->SetNSObject([[SARSCNViewDelegate alloc] initWithNodeForAnchor: ^ SCNNode * _Nullable (id<SCNSceneRenderer> _Nonnull renderer, ARAnchor * _Nonnull anchor) {
        Nan::HandleScope scope;
        Local<Value> anchorObj = sweetiekit::GetWrapperFor(anchor, NARAnchor::type);
        Local<Value> result = del->_nodeForAnchor("NARSCNViewDelegate::New _nodeForAnchor", Nan::Null(), anchorObj);
        JS_UNWRAPPED(JS_OBJ(result), SCNNode, node);
        return node;
      }]);
    }
  } else {
    @autoreleasepool {
      del->SetNSObject([[SARSCNViewDelegate alloc] init]);
    }
  }
  del->Wrap(obj);

  info.GetReturnValue().Set(obj);
}
