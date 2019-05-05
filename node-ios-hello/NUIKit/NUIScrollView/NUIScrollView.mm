//
//  NUIScrollView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITableView.h"
#include "NUIView.h"
#include "NUIScrollView.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIScrollView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIScrollView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIScrollView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NUIScrollView::NUIScrollView () {}
NUIScrollView::~NUIScrollView () {}

NAN_METHOD(NUIScrollView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIScrollView *scrollView = new NUIScrollView();

  if (info[0]->IsExternal()) {
    scrollView->SetNSObject((__bridge UIScrollView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double x = TO_DOUBLE(info[0]);
      double y = TO_DOUBLE(info[1]);
      double width = TO_DOUBLE(info[2]);
      double height = TO_DOUBLE(info[3]);
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
        scrollView->SetNSObject([[UIScrollView alloc] initWithFrame:frame]);
      });
    }
  } else {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      scrollView->SetNSObject([[UIScrollView alloc] init]);
    });
  }

  scrollView->Wrap(obj);

  info.GetReturnValue().Set(obj);
}
