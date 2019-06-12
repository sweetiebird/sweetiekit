//
//  NUIViewControllerTransitioningDelegate.mm
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewControllerTransitioningDelegate.h"

NUIViewControllerTransitioningDelegate::NUIViewControllerTransitioningDelegate() {}
NUIViewControllerTransitioningDelegate::~NUIViewControllerTransitioningDelegate() {}

JS_INIT_CLASS(UIViewControllerTransitioningDelegate, NSObject);
  // instance members (proto)
  JS_SET_PROP(proto, "presentationControllerFor", PresentationControllerFor);
  // static members (ctor)
  JS_INIT_CTOR(UIViewControllerTransitioningDelegate, NSObject);
JS_INIT_CLASS_END(UIViewControllerTransitioningDelegate, NSObject);

NAN_METHOD(NUIViewControllerTransitioningDelegate::New) {
  JS_RECONSTRUCT(UIViewControllerTransitioningDelegate);
  
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
