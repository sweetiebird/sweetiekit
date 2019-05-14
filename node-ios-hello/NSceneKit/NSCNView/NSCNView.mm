//
//  NSCNView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#include "defines.h"
#include "NSCNView.h"
#include "NUIView.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSCNView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "autoenablesDefaultLighting", AutoenablesDefaultLighting);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNView *view = new NSCNView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge SCNView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      view->SetNSObject([[SCNView alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      view->SetNSObject([[SCNView alloc] init]);
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSCNView::NSCNView () {}
NSCNView::~NSCNView () {}

NAN_GETTER(NSCNView::AutoenablesDefaultLightingGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNView, view);
  
  JS_SET_RETURN(JS_BOOL([view autoenablesDefaultLighting]));
}

NAN_SETTER(NSCNView::AutoenablesDefaultLightingSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNView, view);

  [view setAutoenablesDefaultLighting:TO_BOOL(value)];
}
