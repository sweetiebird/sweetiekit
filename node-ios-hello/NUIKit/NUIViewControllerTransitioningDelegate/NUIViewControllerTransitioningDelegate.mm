//
//  NUIViewControllerTransitioningDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIViewControllerTransitioningDelegate.h"

Nan::Persistent<FunctionTemplate> NUIViewControllerTransitioningDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIViewControllerTransitioningDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;
  
  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIViewControllerTransitioningDelegate"));
  type.Reset(ctor);
  
  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "presentationControllerFor", PresentationControllerFor);
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIViewControllerTransitioningDelegate::New) {
  Nan::HandleScope scope;
  
  Local<Object> ctrlObj = info.This();
  
  NUIViewControllerTransitioningDelegate *ctrl = new NUIViewControllerTransitioningDelegate();
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      ctrl->SetNSObject([[SUIViewControllerTransitioningDelegate alloc] init]);
    });
  }
  ctrl->Wrap(ctrlObj);
  
  info.GetReturnValue().Set(ctrlObj);
}

#include "NUIViewController.h"
#include "NUIPresentationController.h"

NAN_SETTER(NUIViewControllerTransitioningDelegate::PresentationControllerForSetter) {
  Nan::HandleScope scope;
  
  NUIViewControllerTransitioningDelegate *del = ObjectWrap::Unwrap<NUIViewControllerTransitioningDelegate>(info.This());
  del->_presentationControllerFor.Reset(Local<Function>::Cast(value));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      SUIViewControllerTransitioningDelegate* d = del->As<SUIViewControllerTransitioningDelegate>();
      [d setPresentationControllerForCallback: ^ SUIPresentationController * _Nullable (UIViewController * _Nonnull presented, UIViewController * _Nullable presenting, UIViewController * _Nonnull source) {
        
        Local<Value> presentedObj = sweetiekit::GetWrapperFor(presented, NUIViewController::type);
        Local<Value> presentingObj = sweetiekit::GetWrapperFor(presenting, NUIViewController::type);
        Local<Value> sourceObj = sweetiekit::GetWrapperFor(source, NUIViewController::type);
        
        Local<Value> resultObj = del->_presentationControllerFor(
          "NUIViewControllerTransitioningDelegate::PresentationControllerForSetter",
          presentedObj, presentingObj, sourceObj);
        auto result = ObjectWrap::Unwrap<NUIPresentationController>(JS_OBJ(resultObj))->As<SUIPresentationController>();
        return result;
      }];
    });
  }
}

NAN_GETTER(NUIViewControllerTransitioningDelegate::PresentationControllerForGetter) {
  Nan::HandleScope scope;
  
  NUIViewControllerTransitioningDelegate *del = ObjectWrap::Unwrap<NUIViewControllerTransitioningDelegate>(info.This());
  
  info.GetReturnValue().Set(del->_presentationControllerFor.GetValue());
}

NUIViewControllerTransitioningDelegate::NUIViewControllerTransitioningDelegate () {}
NUIViewControllerTransitioningDelegate::~NUIViewControllerTransitioningDelegate () {}
