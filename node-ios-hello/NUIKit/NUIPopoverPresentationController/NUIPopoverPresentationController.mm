//
//  UIPopoverPresentationController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>
#include "defines.h"
#include "NUIPopoverPresentationController.h"
#include "NUIViewController.h"
#include "NUIPopoverPresentationControllerDelegate.h"
#include "NUIView.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIPopoverPresentationController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIPopoverPresentationController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIPopoverPresentationController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, permittedArrowDirections);
  JS_ASSIGN_PROP(proto, sourceView);
  JS_ASSIGN_PROP(proto, sourceRect);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIPopoverPresentationController::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIPopoverPresentationController *ui = new NUIPopoverPresentationController();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIPopoverPresentationController *)(info[0].As<External>()->Value()));
  } else if (info.Length() == 2) {
    @autoreleasepool {
      UIViewController *presented = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]))->As<UIViewController>();
      UIViewController *presenting = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[1]))->As<UIViewController>();

      ui->SetNSObject([[UIPopoverPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting]);
    }
  } else {
    @autoreleasepool {
      UIViewController *presented = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]))->As<UIViewController>();

      ui->SetNSObject([[UIPopoverPresentationController alloc] initWithPresentedViewController:presented presentingViewController:nil]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIPopoverPresentationController::NUIPopoverPresentationController () {}
NUIPopoverPresentationController::~NUIPopoverPresentationController () {}

NAN_GETTER(NUIPopoverPresentationController::permittedArrowDirectionsGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NUIPopoverPresentationController::permittedArrowDirectionsGetter not implemented");
}

NAN_SETTER(NUIPopoverPresentationController::permittedArrowDirectionsSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPopoverPresentationController, ui);
  
  @autoreleasepool {
    int dir = TO_UINT32(value);

    UIPopoverArrowDirection arrowDir = UIPopoverArrowDirectionAny;

    if (dir == 0) {
      arrowDir = UIPopoverArrowDirectionUp;
    } else if (dir == 1) {
      arrowDir = UIPopoverArrowDirectionDown;
    } else if (dir == 2) {
      arrowDir = UIPopoverArrowDirectionLeft;
    } else if (dir == 3) {
      arrowDir = UIPopoverArrowDirectionRight;
    } else if (dir == -1) {
      arrowDir = UIPopoverArrowDirectionUnknown;
    }
    
    [ui setPermittedArrowDirections:arrowDir];
  }
}

NAN_GETTER(NUIPopoverPresentationController::sourceViewGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NUIPopoverPresentationController::sourceViewGetter not implemented");
}

NAN_SETTER(NUIPopoverPresentationController::sourceViewSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPopoverPresentationController, ui);
  
  Local<Object> obj = JS_OBJ(value);
  NUIView *view = ObjectWrap::Unwrap<NUIView>(obj);
  
  @autoreleasepool {
    [ui setSourceView:view->As<UIView>()];
  }
}

NAN_GETTER(NUIPopoverPresentationController::sourceRectGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPopoverPresentationController, ui);

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT([ui sourceRect].size.width));
  result->Set(JS_STR("height"), JS_FLOAT([ui sourceRect].size.width));
  result->Set(JS_STR("x"), JS_FLOAT([ui sourceRect].origin.x));
  result->Set(JS_STR("y"), JS_FLOAT([ui sourceRect].origin.y));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIPopoverPresentationController::sourceRectSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPopoverPresentationController, ui);
  
  @autoreleasepool {
    double w = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
    double h = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
    [ui setSourceRect:CGRectMake(x, y, w, h)];
  }
}
