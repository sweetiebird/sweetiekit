//
//  UIPopoverPresentationController.mm
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPopoverPresentationController.h"

NUIPopoverPresentationController::NUIPopoverPresentationController() {}
NUIPopoverPresentationController::~NUIPopoverPresentationController() {}

JS_INIT_CLASS(UIPopoverPresentationController, UIPresentationController);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, permittedArrowDirections);
  JS_ASSIGN_PROP(proto, sourceView);
  JS_ASSIGN_PROP(proto, sourceRect);
  // static members (ctor)
  JS_INIT_CTOR(UIPopoverPresentationController, UIPresentationController);
JS_INIT_CLASS_END(UIPopoverPresentationController, UIPresentationController);

#include "NUIViewController.h"

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

#include "NUIView.h"

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
