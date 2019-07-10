//
//  NUIAdaptivePresentationControllerDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIAdaptivePresentationControllerDelegate.h"

#define instancetype UIAdaptivePresentationControllerDelegate
#define js_value_instancetype js_value_UIAdaptivePresentationControllerDelegate

NUIAdaptivePresentationControllerDelegate::NUIAdaptivePresentationControllerDelegate() {}
NUIAdaptivePresentationControllerDelegate::~NUIAdaptivePresentationControllerDelegate() {}

JS_INIT_PROTOCOL(UIAdaptivePresentationControllerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(adaptivePresentationStyleForPresentationController);
  JS_ASSIGN_PROTO_PROP(adaptivePresentationStyleForPresentationControllerTraitCollection);
  JS_ASSIGN_PROTO_PROP(presentationControllerViewControllerForAdaptivePresentationStyle);
  JS_ASSIGN_PROTO_PROP(presentationControllerWillPresentWithAdaptiveStyleTransitionCoordinator);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIAdaptivePresentationControllerDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIAdaptivePresentationControllerDelegate, NSObject);

NAN_METHOD(NUIAdaptivePresentationControllerDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UIAdaptivePresentationControllerDelegate);
  @autoreleasepool {
    id<UIAdaptivePresentationControllerDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIAdaptivePresentationControllerDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIAdaptivePresentationControllerDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIAdaptivePresentationControllerDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIAdaptivePresentationControllerDelegateType alloc] init];
    }
    if (self) {
      NUIAdaptivePresentationControllerDelegate *wrapper = new NUIAdaptivePresentationControllerDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIAdaptivePresentationControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UIAdaptivePresentationControllerDelegate, adaptivePresentationStyleForPresentationController);
DELEGATE_PROTOCOL_PROP(UIAdaptivePresentationControllerDelegate, adaptivePresentationStyleForPresentationControllerTraitCollection);
DELEGATE_PROTOCOL_PROP(UIAdaptivePresentationControllerDelegate, presentationControllerViewControllerForAdaptivePresentationStyle);
DELEGATE_PROTOCOL_PROP(UIAdaptivePresentationControllerDelegate, presentationControllerWillPresentWithAdaptiveStyleTransitionCoordinator);

#include "NUIPresentationController.h"
#include "NUIViewController.h"
#include "NUIViewControllerTransitionCoordinator.h"
#include "NUITraitCollection.h"

@implementation UIAdaptivePresentationControllerDelegateType

/* For iOS8.0, the only supported adaptive presentation styles are UIModalPresentationFullScreen and UIModalPresentationOverFullScreen. */
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
  __block UIModalPresentationStyle result = UIModalPresentationFullScreen; // TODO: unsure about this default value.
  call_delegate(result = is_value_UIModalPresentationStyle(JS_RESULT) ? to_value_UIModalPresentationStyle(JS_RESULT) : result, adaptivePresentationStyleForPresentationController,
    js_value_UIPresentationController(controller));
  return result;
}

// Returning UIModalPresentationNone will indicate that an adaptation should not happen.
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection NS_AVAILABLE_IOS(8_3)
{
  __block UIModalPresentationStyle result = UIModalPresentationFullScreen; // TODO: unsure about this default value.
  call_delegate(result = is_value_UIModalPresentationStyle(JS_RESULT) ? to_value_UIModalPresentationStyle(JS_RESULT) : result, adaptivePresentationStyleForPresentationController,
    js_value_UIPresentationController(controller));
  call_delegate(result = is_value_UIModalPresentationStyle(JS_RESULT) ? to_value_UIModalPresentationStyle(JS_RESULT) : result, adaptivePresentationStyleForPresentationControllerTraitCollection,
    js_value_UIPresentationController(controller),
    js_value_UITraitCollection(traitCollection));
  return result;
}

/* If this method is not implemented, or returns nil, then the originally presented view controller is used. */
- (nullable UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style
{
  __block UIViewController* result = nil;
  call_delegate(result = is_value_UIViewController(JS_RESULT) ? to_value_UIViewController(JS_RESULT) : result, presentationControllerViewControllerForAdaptivePresentationStyle,
    js_value_UIPresentationController(controller),
    js_value_UIModalPresentationStyle(style));
  return result;
}

// If there is no adaptation happening and an original style is used UIModalPresentationNone will be passed as an argument.
- (void)presentationController:(UIPresentationController *)presentationController willPresentWithAdaptiveStyle:(UIModalPresentationStyle)style transitionCoordinator:(nullable id <UIViewControllerTransitionCoordinator>)transitionCoordinator NS_AVAILABLE_IOS(8_3)
{
  call_delegate_async(noop(), presentationControllerWillPresentWithAdaptiveStyleTransitionCoordinator,
    js_value_UIPresentationController(presentationController),
    js_value_UIModalPresentationStyle(style),
    js_value_UIViewControllerTransitionCoordinator(transitionCoordinator));
}

@end
