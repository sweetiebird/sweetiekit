//
//  NUIView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIView.h"

Local<Object> NUIView::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIView"));

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  //Nan::SetMethod(proto, "init", InitMethod);

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIView::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIView *view = new NUIView();

//  UIViewController* vc = info[0]->IsExternal() ? (__bridge UIViewController *)(info[0].As<External>()->Value())  : [UIViewController alloc];

  if (info[0]->IsExternal()) {
    view->me = (__bridge UIView *)(info[0].As<External>()->Value());
  } else {
      double width = TO_DOUBLE(info[0]);
      double height = TO_DOUBLE(info[1]);
      double x = TO_DOUBLE(info[2]);
      double y = TO_DOUBLE(info[3]);

      @autoreleasepool {
        dispatch_async(dispatch_get_main_queue(), ^ {
            view->me = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        });
      }
  }
  view->Wrap(viewObj);

  Nan::SetAccessor(viewObj, JS_STR("frame"), FrameGetter, FrameSetter);

  info.GetReturnValue().Set(viewObj);
}

NAN_GETTER(NUIView::FrameGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
   Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT(view->GetFrame().size.width));
  result->Set(JS_STR("height"), JS_FLOAT(view->GetFrame().size.height));
  result->Set(JS_STR("x"), JS_FLOAT(view->GetFrame().origin.x));
  result->Set(JS_STR("y"), JS_FLOAT(view->GetFrame().origin.y));

  info.GetReturnValue().Set(result);
}

NAN_SETTER(NUIView::FrameSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
  double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));

  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
      [view->me frame] = CGRectMake(x, y, width, height);
    });
  }
}

CGRect NUIView::GetFrame() {
  if (me) {
   return [me frame];
  } else {
    return CGRectMake(0, 0, 0, 0);
  }
}

Local<Object> makeUIView() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIView::Initialize(isolate));
}

NUIView::NUIView () {}
NUIView::~NUIView () {}

