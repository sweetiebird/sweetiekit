//
//  NUITabBarControllerDelegate.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBarControllerDelegate.h"

#define instancetype UITabBarControllerDelegate
#define js_value_instancetype js_value_UITabBarControllerDelegate

NUITabBarControllerDelegate::NUITabBarControllerDelegate() {}
NUITabBarControllerDelegate::~NUITabBarControllerDelegate() {}

JS_INIT_CLASS(UITabBarControllerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(tabBarControllerShouldSelectViewController);
  JS_ASSIGN_PROTO_PROP(tabBarControllerDidSelectViewController);
  JS_ASSIGN_PROTO_PROP(tabBarControllerWillBeginCustomizingViewControllers);
  JS_ASSIGN_PROTO_PROP(tabBarControllerWillEndCustomizingViewControllersChanged);
  JS_ASSIGN_PROTO_PROP(tabBarControllerDidEndCustomizingViewControllersChanged);
  JS_ASSIGN_PROTO_PROP(tabBarControllerSupportedInterfaceOrientations);
  JS_ASSIGN_PROTO_PROP(tabBarControllerPreferredInterfaceOrientationForPresentation);
  JS_ASSIGN_PROTO_PROP(tabBarControllerInteractionControllerForAnimationController);
  JS_ASSIGN_PROTO_PROP(tabBarControllerAnimationControllerForTransitionFromViewControllerToViewController);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITabBarControllerDelegate, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITabBarControllerDelegate, NSObject);

NAN_METHOD(NUITabBarControllerDelegate::New) {
  JS_RECONSTRUCT(UITabBarControllerDelegate);
  @autoreleasepool {
    UITabBarControllerDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITabBarControllerDelegate *)(info[0].As<External>()->Value());
    } else if (info[0]->IsObject()) {
      Local<Value> that(JS_NEW(NUITabBarControllerDelegate, 0, nullptr));
      sweetiekit::JSFunction objectAssign(JS_OBJ(JS_GLOBAL()->Get(JS_STR("Object")))->Get(JS_STR("assign")));
      objectAssign("NUITabBarControllerDelegate::New", that, info[0]);
      JS_SET_RETURN(that);
      return;
    } else if (info.Length() <= 0) {
      self = [[UITabBarControllerDelegate alloc] init];
    }
    if (self) {
      NUITabBarControllerDelegate *wrapper = new NUITabBarControllerDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITabBarControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerShouldSelectViewController);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerDidSelectViewController);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerWillBeginCustomizingViewControllers);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerWillEndCustomizingViewControllersChanged);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerDidEndCustomizingViewControllersChanged);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerSupportedInterfaceOrientations);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerPreferredInterfaceOrientationForPresentation);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerInteractionControllerForAnimationController);
DELEGATE_PROP(UITabBarControllerDelegate, tabBarControllerAnimationControllerForTransitionFromViewControllerToViewController);

#include "NUITabBarController.h"
#include "NUIApplication.h" // for UIInterfaceOrientationMask

@implementation UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0)
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), tabBarControllerShouldSelectViewController,
    js_value_UITabBarController(tabBarController),
    js_value_UIViewController(viewController));
  return result;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
  call_delegate(noop(), tabBarControllerDidSelectViewController,
    js_value_UITabBarController(tabBarController),
    js_value_UIViewController(viewController));
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED
{
  call_delegate(noop(), tabBarControllerWillBeginCustomizingViewControllers,
    js_value_UITabBarController(tabBarController),
    js_value_NSArray<UIViewController*>(viewControllers));
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED
{
  call_delegate(noop(), tabBarControllerWillEndCustomizingViewControllersChanged,
    js_value_UITabBarController(tabBarController),
    js_value_NSArray<UIViewController*>(viewControllers),
    js_value_BOOL(changed));
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed __TVOS_PROHIBITED
{
  call_delegate(noop(), tabBarControllerDidEndCustomizingViewControllersChanged,
    js_value_UITabBarController(tabBarController),
    js_value_NSArray<UIViewController*>(viewControllers),
    js_value_BOOL(changed));
}

- (UIInterfaceOrientationMask)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED
{
  __block UIInterfaceOrientationMask result(UIInterfaceOrientationMaskAll);
  call_delegate(result = is_value_UIInterfaceOrientationMask(JS_RESULT) ? to_value_UIInterfaceOrientationMask(JS_RESULT) : result, tabBarControllerSupportedInterfaceOrientations,
    js_value_UITabBarController(tabBarController));
  return result;
}

- (UIInterfaceOrientation)tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)tabBarController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED
{
  __block UIInterfaceOrientation result(UIInterfaceOrientationPortrait);
  call_delegate(result = is_value_UIInterfaceOrientation(JS_RESULT) ? to_value_UIInterfaceOrientation(JS_RESULT) : result, tabBarControllerPreferredInterfaceOrientationForPresentation,
    js_value_UITabBarController(tabBarController));
  return result;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                      interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController NS_AVAILABLE_IOS(7_0)
{
  __block id <UIViewControllerInteractiveTransitioning> result = nil;
  call_delegate(result = is_value_id(JS_RESULT) ? to_value_id(JS_RESULT) : result, tabBarControllerInteractionControllerForAnimationController,
    js_value_UITabBarController(tabBarController),
    js_value_id/* <UIViewControllerAnimatedTransitioning>*/(animationController));
  return result;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
  __block id <UIViewControllerAnimatedTransitioning> result = nil;
  call_delegate(result = is_value_id(JS_RESULT) ? to_value_id(JS_RESULT) : result, tabBarControllerAnimationControllerForTransitionFromViewControllerToViewController,
    js_value_UITabBarController(tabBarController),
    js_value_UIViewController(fromVC),
    js_value_UIViewController(toVC));
  return result;
}

@end
