//
//  NUINavigationControllerDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINavigationControllerDelegate.h"

#define instancetype UINavigationControllerDelegate
#define js_value_instancetype js_value_UINavigationControllerDelegate

NUINavigationControllerDelegate::NUINavigationControllerDelegate() {}
NUINavigationControllerDelegate::~NUINavigationControllerDelegate() {}

JS_INIT_PROTOCOL(UINavigationControllerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(navigationControllerWillShowViewControllerAnimated);
  JS_ASSIGN_PROTO_PROP(navigationControllerDidShowViewControllerAnimated);
  JS_ASSIGN_PROTO_PROP(navigationControllerSupportedInterfaceOrientations);
  JS_ASSIGN_PROTO_PROP(navigationControllerPreferredInterfaceOrientationForPresentation);
  JS_ASSIGN_PROTO_PROP(navigationControllerInteractionControllerForAnimationController);
  JS_ASSIGN_PROTO_PROP(navigationControllerAnimationControllerForOperationFromViewControllerToViewController);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UINavigationControllerDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UINavigationControllerDelegate, NSObject);

NAN_METHOD(NUINavigationControllerDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UINavigationControllerDelegate);
  @autoreleasepool {
    id<UINavigationControllerDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UINavigationControllerDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UINavigationControllerDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UINavigationControllerDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UINavigationControllerDelegateType alloc] init];
    }
    if (self) {
      NUINavigationControllerDelegate *wrapper = new NUINavigationControllerDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UINavigationControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UINavigationControllerDelegate, navigationControllerWillShowViewControllerAnimated);
DELEGATE_PROTOCOL_PROP(UINavigationControllerDelegate, navigationControllerDidShowViewControllerAnimated);
DELEGATE_PROTOCOL_PROP(UINavigationControllerDelegate, navigationControllerSupportedInterfaceOrientations);
DELEGATE_PROTOCOL_PROP(UINavigationControllerDelegate, navigationControllerPreferredInterfaceOrientationForPresentation);
DELEGATE_PROTOCOL_PROP(UINavigationControllerDelegate, navigationControllerInteractionControllerForAnimationController);
DELEGATE_PROTOCOL_PROP(UINavigationControllerDelegate, navigationControllerAnimationControllerForOperationFromViewControllerToViewController);

#include "NUIApplication.h"
#include "NUINavigationController.h"
#include "NUIViewController.h"

@implementation UINavigationControllerDelegateType

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  call_delegate(noop(), navigationControllerWillShowViewControllerAnimated,
    js_value_UINavigationController(navigationController),
    js_value_UIViewController(viewController),
    js_value_BOOL(animated));
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  call_delegate(noop(), navigationControllerDidShowViewControllerAnimated,
    js_value_UINavigationController(navigationController),
    js_value_UIViewController(viewController),
    js_value_BOOL(animated));
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED
{
  __block UIInterfaceOrientationMask result = UIInterfaceOrientationMaskAllButUpsideDown;
  call_delegate(result = is_value_UIInterfaceOrientationMask(JS_RESULT) ? to_value_UIInterfaceOrientationMask(JS_RESULT) : result, navigationControllerSupportedInterfaceOrientations,
    js_value_UINavigationController(navigationController));
  return result;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED
{
  __block UIInterfaceOrientation result = UIInterfaceOrientationPortrait;
  call_delegate(result = is_value_UIInterfaceOrientation(JS_RESULT) ? to_value_UIInterfaceOrientation(JS_RESULT) : result, navigationControllerPreferredInterfaceOrientationForPresentation,
    js_value_UINavigationController(navigationController));
  return result;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0)
{
  __block id <UIViewControllerInteractiveTransitioning> result = nil;
  call_delegate(result = is_value_id/* <UIViewControllerInteractiveTransitioning>*/(JS_RESULT) ? to_value_id/* <UIViewControllerInteractiveTransitioning>*/(JS_RESULT) : result, navigationControllerInteractionControllerForAnimationController,
    js_value_UINavigationController(navigationController),
    js_value_id/* <UIViewControllerAnimatedTransitioning>*/(animationController));
  return result;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
  __block id <UIViewControllerAnimatedTransitioning> result = nil;
  call_delegate(result = is_value_id/* <UIViewControllerAnimatedTransitioning>*/(JS_RESULT) ? to_value_id/* <UIViewControllerAnimatedTransitioning>*/(JS_RESULT) : result, navigationControllerAnimationControllerForOperationFromViewControllerToViewController,
    js_value_UINavigationController(navigationController),
    js_value_UINavigationControllerOperation(operation),
    js_value_UIViewController(fromVC),
    js_value_UIViewController(toVC));
  return result;
}

@end
