//
//  NSKView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NSKView.h"
#include "NUIView.h"
#include "NSKScene.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "presentScene", presentScene);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKView *view = new NSKView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge SKView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      view->SetNSObject([[SKView alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      view->SetNSObject([[SKView alloc] init]);
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSKView::NSKView () {}
NSKView::~NSKView () {}

NAN_METHOD(NSKView::presentScene) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKView, ui);
  
  NSKScene *scene = ObjectWrap::Unwrap<NSKScene>(Local<Object>::Cast(info[0]));
  
  [ui presentScene:scene->As<SKScene>()];
}
