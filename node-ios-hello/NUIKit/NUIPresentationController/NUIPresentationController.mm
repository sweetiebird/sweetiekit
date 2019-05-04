//
//  NUIPresentationController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "NUIPresentationController.h"
#include "NUIViewController.h"
#include "ColorHelper.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIPresentationController::type;

NUIPresentationController::NUIPresentationController ()
: _frameOfPresentedView(new Nan::Persistent<Function>())
, _presentationTransitionWillBegin(new Nan::Persistent<Function>())
, _dismissalTransitionWillBegin(new Nan::Persistent<Function>())
, _containerWillLayoutSubviews(new Nan::Persistent<Function>())
, _sizeForChildContentContainer(new Nan::Persistent<Function>())
{}
NUIPresentationController::~NUIPresentationController () {
  delete _frameOfPresentedView;
  delete _presentationTransitionWillBegin;
  delete _dismissalTransitionWillBegin;
  delete _containerWillLayoutSubviews;
  delete _sizeForChildContentContainer;
}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIPresentationController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;
  
  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIPresentationController"));
  type.Reset(ctor);
  
  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "frameOfPresentedViewInContainerView", FrameOfPresentedViewInContainerView);
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIPresentationController::New) {
  Nan::HandleScope scope;
  
  Local<Object> obj = info.This();
  
  NUIPresentationController *view = new NUIPresentationController();
  
  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIPresentationController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      NUIViewController *presented = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));
      NUIViewController *presenting = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[1]));
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[UIPresentationController alloc] initWithPresentedViewController:presented->As<UIViewController>() presentingViewController:presenting->As<UIViewController>()]);
      });
    }
  }
  view->Wrap(obj);
  
  JS_SET_RETURN(obj);
}

NAN_SETTER(NUIPresentationController::FrameOfPresentedViewInContainerViewSetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  pres->_frameOfPresentedView->Reset(Local<Function>::Cast(value));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      SUIPresentationController* p = pres->As<SUIPresentationController>();
//      [p setFrameOfPresentedViewCallback:^ CGRect (void) {
//        sweetiekit::Resolve(pres->_frameOfPresentedView);
//      }];
    });
  }
}

NAN_GETTER(NUIPresentationController::FrameOfPresentedViewInContainerViewGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  
  info.GetReturnValue().Set(Nan::New(pres->_frameOfPresentedView));
}
