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
  JS_ASSIGN_PROTO_PROP(animationControllerForPresentedControllerPresentingControllerSourceController);
  JS_ASSIGN_PROTO_PROP(animationControllerForDismissedController);
  JS_ASSIGN_PROTO_PROP(interactionControllerForPresentation);
  JS_ASSIGN_PROTO_PROP(interactionControllerForDismissal);
  JS_ASSIGN_PROTO_PROP(presentationControllerForPresentedViewControllerPresentingViewControllerSourceViewController);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIViewControllerTransitioningDelegate, NSObject);
JS_INIT_CLASS_END(UIViewControllerTransitioningDelegate, NSObject);

NAN_METHOD(NUIViewControllerTransitioningDelegate::New) {
  JS_RECONSTRUCT(UIViewControllerTransitioningDelegate);
  @autoreleasepool {
    UIViewControllerTransitioningDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIViewControllerTransitioningDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIViewControllerTransitioningDelegate alloc] init];
    }
    if (self) {
      NUIViewControllerTransitioningDelegate *wrapper = new NUIViewControllerTransitioningDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewControllerTransitioningDelegate::New: invalid arguments");
    }
  }
}

#include "NUIViewController.h"
#include "NUIPresentationController.h"

DELEGATE_PROTOCOL_PROP(UIViewControllerTransitioningDelegate, animationControllerForPresentedControllerPresentingControllerSourceController);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitioningDelegate, animationControllerForDismissedController);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitioningDelegate, interactionControllerForPresentation);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitioningDelegate, interactionControllerForDismissal);
DELEGATE_PROTOCOL_PROP(UIViewControllerTransitioningDelegate, presentationControllerForPresentedViewControllerPresentingViewControllerSourceViewController);

@implementation UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
  id <UIViewControllerAnimatedTransitioning> result = nil;
  // TODO
  return result;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
  id <UIViewControllerAnimatedTransitioning> result = nil;
  // TODO
  return result;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
  id <UIViewControllerInteractiveTransitioning> result = nil;
  // TODO
  return result;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
  id <UIViewControllerInteractiveTransitioning> result = nil;
  // TODO
  return result;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0)
{
  UIPresentationController* result = nil;
  // TODO
  return result;
}

@end
