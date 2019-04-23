//
//  NUIRefreshControl.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "NUIRefreshControl.h"
#include "ColorHelper.h"

Nan::Persistent<FunctionTemplate> NUIRefreshControl::type;

NUIRefreshControl::NUIRefreshControl () {}
NUIRefreshControl::~NUIRefreshControl () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIRefreshControl::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIRefreshControl"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addTargetFor", AddTargetFor);
  Nan::SetMethod(proto, "endRefreshing", EndRefreshing);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "alloc", Alloc);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIRefreshControl::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIRefreshControl *view = new NUIRefreshControl();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIRefreshControl *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[UIRefreshControl alloc] init]);
      });
    }
  }
  view->Wrap(viewObj);

  JS_SET_RETURN(viewObj);
}

NAN_METHOD(NUIRefreshControl::Alloc) {
  Nan::EscapableHandleScope scope;
  
  Local<Value> argv[] = {
  };
  Local<Object> result = JS_TYPE(NUIRefreshControl)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
  JS_SET_RETURN(result);

  JS_UNWRAPPED(result, UIRefreshControl, ui);
}

#include "NUITableView.h"
NAN_METHOD(NUIRefreshControl::AddTargetFor) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIControl, ui);

  Local<Object> obj = JS_OBJ(info[0]);
  if (obj->InstanceOf(JS_CONTEXT(), JS_TYPE(NUITableView)).FromJust()) {
    JS_UNWRAPPED(obj, UITableView, tv);
    
    __block Nan::Global<Function> cb(TO_FUNC(info[1]));
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        // https://stackoverflow.com/questions/4581782/can-i-pass-a-block-as-a-selector-with-objective-c
  //      [ui addTarget:[^{
  //        sweetiekit::CallAsync(cb, "NUIRefreshControl::AddTargetFor");
  //      } copy]
        [ui addTarget:[NSInvocation invocationWithTarget:tv block:^(id target) {
          sweetiekit::CallAsync(cb, "NUIRefreshControl::AddTargetFor");
              }]
        action:@selector(invoke)
        forControlEvents:UIControlEventAllEvents];
      });
    }
    
  } else {
    Nan::ThrowError("Unknown addTargetFor type");
  }
}

NAN_METHOD(NUIRefreshControl::EndRefreshing) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIRefreshControl, ui);
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui endRefreshing];
    });
  }
}
