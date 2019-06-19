//
//  UIPopoverPresentationControllerDelegate.mm
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPopoverPresentationControllerDelegate.h"

NUIPopoverPresentationControllerDelegate::NUIPopoverPresentationControllerDelegate() {}
NUIPopoverPresentationControllerDelegate::~NUIPopoverPresentationControllerDelegate() {}

JS_INIT_CLASS(UIPopoverPresentationControllerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(prepareForPopoverPresentation);
  JS_ASSIGN_PROTO_PROP(popoverPresentationControllerShouldDismissPopover);
  JS_ASSIGN_PROTO_PROP(popoverPresentationControllerDidDismissPopover);
  JS_ASSIGN_PROTO_PROP(popoverPresentationControllerWillRepositionPopoverToRectInView);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIPopoverPresentationControllerDelegate, NSObject);
JS_INIT_CLASS_END(UIPopoverPresentationControllerDelegate, NSObject);

NAN_METHOD(NUIPopoverPresentationControllerDelegate::New) {
  JS_RECONSTRUCT(UIPopoverPresentationControllerDelegate);
  @autoreleasepool {
    UIPopoverPresentationControllerDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIPopoverPresentationControllerDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIPopoverPresentationControllerDelegate alloc] init];
    }
    if (self) {
      NUIPopoverPresentationControllerDelegate *wrapper = new NUIPopoverPresentationControllerDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPopoverPresentationControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(UIPopoverPresentationControllerDelegate, prepareForPopoverPresentation);
DELEGATE_PROP(UIPopoverPresentationControllerDelegate, popoverPresentationControllerShouldDismissPopover);
DELEGATE_PROP(UIPopoverPresentationControllerDelegate, popoverPresentationControllerDidDismissPopover);
DELEGATE_PROP(UIPopoverPresentationControllerDelegate, popoverPresentationControllerWillRepositionPopoverToRectInView);

#include "NUIPopoverPresentationController.h"
#include "NUIView.h"

Local<Object>
js_box(const Local<Value>& value)
{
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("value"), value);
  return result;
}

@implementation UIPopoverPresentationControllerDelegate

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController
{
  call_delegate(noop(), prepareForPopoverPresentation,
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
  call_delegate(noop(), popoverPresentationControllerDidDismissPopover,
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
    auto jsRect(js_box(rect ? js_value_CGRect(*inoutRect) : js_value_id(nil)));
    auto jsView(js_box(inoutView ? js_value_UIView(*inoutView) : js_value_id(nil)));
    call_delegate(noop(), popoverPresentationControllerWillRepositionPopoverToRectInView,
      js_value_UIPopoverPresentationController(popoverPresentationController),
      jsRect,
      jsView);
    auto jsOutRect(jsRect->Get(JS_STR("value")));
    auto jsOutView(jsView->Get(JS_STR("value")));
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
