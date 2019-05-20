//
//  NARSKViewDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NARSKViewDelegate.h"
#include "NARSession.h"
#include "NARAnchor.h"
#include "NSKNode.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARSKViewDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARSKViewDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSKView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARSKViewDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARSKViewDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARSKViewDelegate *del = new NARSKViewDelegate();

  if (info[0]->IsExternal()) {
    del->SetNSObject((__bridge SARSKViewDelegate *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    del->_nodeForAnchor.Reset(Local<Function>::Cast(info[0]));

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          del->SetNSObject([[SARSKViewDelegate alloc] initWithNodeForAnchor: ^ SKNode * _Nullable (ARSKView * _Nonnull view, ARAnchor * _Nonnull anchor) {
            Nan::HandleScope scope;
            Local<Value> viewObj = sweetiekit::GetWrapperFor(view, NSKView::type);
            Local<Value> anchorObj = sweetiekit::GetWrapperFor(anchor, NARAnchor::type);
            Local<Value> result = del->_nodeForAnchor("NARSKViewDelegate::New",
            viewObj, anchorObj);
            if (!result->IsNullOrUndefined()) {
              JS_UNWRAPPED(result, SKNode, node);
              return node;
            } else {
              return nullptr;
            }
          }]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        del->SetNSObject([[SARSKViewDelegate alloc] init]);
      });
    }
  }
  del->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NARSKViewDelegate::NARSKViewDelegate () {}
NARSKViewDelegate::~NARSKViewDelegate () {}
