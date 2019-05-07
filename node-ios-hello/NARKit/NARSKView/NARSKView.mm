//
//  NARSKView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARSKView.h"
#include "NSKView.h"
#include "NARSession.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARSKView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARSKView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSKView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARSKView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "session", Session);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARSKView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARSKView *view = new NARSKView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge ARSKView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
          view->SetNSObject([[ARSKView alloc] initWithFrame:frame]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[ARSKView alloc] init]);
      });
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NARSKView::SessionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSKView, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui session], NARSession::type)));
}

NARSKView::NARSKView () {}
NARSKView::~NARSKView () {}
