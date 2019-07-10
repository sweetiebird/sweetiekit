//
//  UIPopoverPresentationControllerDelegate.mm
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPopoverPresentationControllerDelegate.h"

NUIPopoverPresentationControllerDelegate::NUIPopoverPresentationControllerDelegate() {}
NUIPopoverPresentationControllerDelegate::~NUIPopoverPresentationControllerDelegate() {}

JS_INIT_PROTOCOL(UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate);
  JS_ASSIGN_PROTO_PROP(prepareForPopoverPresentation);
  JS_ASSIGN_PROTO_PROP(popoverPresentationControllerShouldDismissPopover);
  JS_ASSIGN_PROTO_PROP(popoverPresentationControllerDidDismissPopover);
  JS_ASSIGN_PROTO_PROP(popoverPresentationControllerWillRepositionPopoverToRectInView);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate);
JS_INIT_PROTOCOL_END(UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate);

NAN_METHOD(NUIPopoverPresentationControllerDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UIPopoverPresentationControllerDelegate);
  @autoreleasepool {
    id<UIPopoverPresentationControllerDelegate> self = nil;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIPopoverPresentationControllerDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIPopoverPresentationControllerDelegateType alloc] init];
    }
    if (self) {
      NUIPopoverPresentationControllerDelegate *wrapper = new NUIPopoverPresentationControllerDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPopoverPresentationControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UIPopoverPresentationControllerDelegate, prepareForPopoverPresentation);
DELEGATE_PROTOCOL_PROP(UIPopoverPresentationControllerDelegate, popoverPresentationControllerShouldDismissPopover);
DELEGATE_PROTOCOL_PROP(UIPopoverPresentationControllerDelegate, popoverPresentationControllerDidDismissPopover);
DELEGATE_PROTOCOL_PROP(UIPopoverPresentationControllerDelegate, popoverPresentationControllerWillRepositionPopoverToRectInView);

#include "NUIPopoverPresentationController.h"
#include "NUIView.h"

@implementation UIPopoverPresentationControllerDelegateType

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController
{
  call_delegate_async(noop(), prepareForPopoverPresentation,
    js_value_UIPopoverPresentationController(popoverPresentationController));
}

// Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent the
// dismissal of the view.
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), popoverPresentationControllerShouldDismissPopover,
    js_value_UIPopoverPresentationController(popoverPresentationController));
  return result;
}

// Called on the delegate when the user has taken action to dismiss the popover. This is not called when the popover is dimissed programatically.
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
  call_delegate_async(noop(), popoverPresentationControllerDidDismissPopover,
    js_value_UIPopoverPresentationController(popoverPresentationController));
}

// -popoverPresentationController:willRepositionPopoverToRect:inView: is called on your delegate when the
// popover may require a different view or rectangle.
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view
{
  // TODO: Refactor how inout params work for delegate callbacks.
  CGRect* inoutRect(rect);
  UIView* inView(view ? *view : nil);
  UIView* __strong * inoutView(&inView);
  dispatch_main(^{
    auto jsRect(js_value_boxed(rect ? js_value_CGRect(*inoutRect) : js_value_id(nil)));
    auto jsView(js_value_boxed(inoutView ? js_value_UIView(*inoutView) : js_value_id(nil)));
    call_delegate_async(noop(), popoverPresentationControllerWillRepositionPopoverToRectInView,
      js_value_UIPopoverPresentationController(popoverPresentationController),
      jsRect,
      jsView);
    auto jsOutRect(to_value_boxed_value(jsRect));
    auto jsOutView(to_value_boxed_value(jsView));
    if (is_value_CGRect(jsOutRect)) {
      if (inoutRect) {
        *inoutRect = to_value_CGRect(jsOutRect);
      }
    }
    if (is_value_UIView(jsOutView)) {
      if (inoutView) {
        *inoutView = to_value_UIView(jsOutView);
      }
    }
  });
  if (rect && inoutRect) {
    *rect = *inoutRect;
  }
  if (view && inoutView) {
    *view = *inoutView;
  }
}

@end
