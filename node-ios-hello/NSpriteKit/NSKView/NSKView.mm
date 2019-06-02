//
//  NSKView.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKView.h"

NSKView::NSKView() {}
NSKView::~NSKView() {}

JS_INIT_CLASS(SKView, UIView);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, presentScene);
  // static members (ctor)
  JS_INIT_CTOR(SKView, UIView);
JS_INIT_CLASS_END(SKView, UIView);

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

#include "NSKScene.h"

NAN_METHOD(NSKView::presentScene) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKView, ui);
  
  NSKScene *scene = ObjectWrap::Unwrap<NSKScene>(Local<Object>::Cast(info[0]));
  
  [ui presentScene:scene->As<SKScene>()];
}
