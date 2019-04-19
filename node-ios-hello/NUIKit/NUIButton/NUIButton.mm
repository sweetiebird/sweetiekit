//
//  NUIButton.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIButton.h"

Local<Object> NUIButton::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIButton"));

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIButton::New) {
  Nan::HandleScope scope;

  Local<Object> btnObj = info.This();

  NUIButton *btn = new NUIButton();

  double x = TO_DOUBLE(info[0]);
  double y = TO_DOUBLE(info[1]);
  double width = TO_DOUBLE(info[2]);
  double height = TO_DOUBLE(info[3]);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      btn->button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
      
      // return to background queue and finish method
    });
  }

  btn->Wrap(btnObj);

  Nan::SetAccessor(btnObj, JS_STR("frame"), FrameGetter, FrameSetter);
  Nan::SetAccessor(btnObj, JS_STR("title"), CurrentTitleGetter);

  info.GetReturnValue().Set(btnObj);
}

NAN_GETTER(NUIButton::FrameGetter) {
  Nan::HandleScope scope;

  NUIButton *view = ObjectWrap::Unwrap<NUIButton>(info.This());
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT(view->GetFrame().size.width));
  result->Set(JS_STR("height"), JS_FLOAT(view->GetFrame().size.height));
  result->Set(JS_STR("x"), JS_FLOAT(view->GetFrame().origin.x));
  result->Set(JS_STR("y"), JS_FLOAT(view->GetFrame().origin.y));

  info.GetReturnValue().Set(result);
}

NAN_SETTER(NUIButton::FrameSetter) {
  Nan::HandleScope scope;

  NUIButton *btn = ObjectWrap::Unwrap<NUIButton>(info.This());

  double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
  double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [btn->button frame] = CGRectMake(x, y, width, height);
    });
  }
}

CGRect NUIButton::GetFrame() {
  if (button) {
   return [button frame];
  } else {
    return CGRectMake(0, 0, 0, 0);
  }
}

NAN_METHOD(NUIButton::SetTitle) {
  NUIButton *btn = ObjectWrap::Unwrap<NUIButton>(Local<Object>::Cast(info.This()));

  std::string type;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    type = *utf8Value;
  } else {
    type = "";
  }
  NSString* result = [NSString stringWithUTF8String:type.c_str()];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [btn->button setTitle:result forState:UIControlStateNormal];
    });
  }
}

//NAN_GETTER(NUIView::CurrentTitleGetter) {
//  Nan::HandleScope scope;
//
//  NUIButton *btn = ObjectWrap::Unwrap<NUIButton>(info.This());
//  Local<Object> result = Object::New(Isolate::GetCurrent());
//  result->Set(JS_STR("title"), JS_FLOAT(view->GetFrame().size.width));
//
//  info.GetReturnValue().Set(result);
//}

NSString* NUIButton::GetCurrentTitle() {
  if (button) {
   return [button currentTitle];
  } else {
    return @"";
  }
}

Local<Object> makeUIView() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIButton::Initialize(isolate));
}

Local<Object> makeUIButton() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIButton::Initialize(isolate));
}

NUIButton::NUIButton () {}
NUIButton::~NUIButton () {}
