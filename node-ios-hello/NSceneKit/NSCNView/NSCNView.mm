//
//  NSCNView.mk
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNView.h"

NSCNView::NSCNView () {}
NSCNView::~NSCNView () {}

JS_INIT_CLASS(SCNView, UIView);
  // instance members (proto)
  JS_SET_PROP(proto, "autoenablesDefaultLighting", AutoenablesDefaultLighting);
  JS_SET_PROP(proto, "playing", Playing);
  // static members (ctor)
  JS_INIT_CTOR(SCNView, UIView);
JS_INIT_CLASS_END(SCNView, UIView);

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

NAN_GETTER(NSCNView::PlayingGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNView, ui);

  JS_SET_RETURN(JS_BOOL([ui isPlaying]));
}

NAN_SETTER(NSCNView::PlayingSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNView, ui);
  
  [ui setPlaying:TO_BOOL(value)];
}
