//
//  NRPPreviewViewControllerDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NRPPreviewViewControllerDelegate.h"

#define instancetype RPPreviewViewControllerDelegate
#define js_value_instancetype js_value_RPPreviewViewControllerDelegate

NRPPreviewViewControllerDelegate::NRPPreviewViewControllerDelegate() {}
NRPPreviewViewControllerDelegate::~NRPPreviewViewControllerDelegate() {}

JS_INIT_PROTOCOL(RPPreviewViewControllerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(previewControllerDidFinish);
  JS_ASSIGN_PROTO_PROP(previewControllerDidFinishWithActivityTypes);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(RPPreviewViewControllerDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(RPPreviewViewControllerDelegate, NSObject);

NAN_METHOD(NRPPreviewViewControllerDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(RPPreviewViewControllerDelegate);
  @autoreleasepool {
    id<RPPreviewViewControllerDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<RPPreviewViewControllerDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<RPPreviewViewControllerDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], RPPreviewViewControllerDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[RPPreviewViewControllerDelegateType alloc] init];
    }
    if (self) {
      NRPPreviewViewControllerDelegate *wrapper = new NRPPreviewViewControllerDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("RPPreviewViewControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(RPPreviewViewControllerDelegate, previewControllerDidFinish);
DELEGATE_PROTOCOL_PROP(RPPreviewViewControllerDelegate, previewControllerDidFinishWithActivityTypes);

#include "NRPPreviewViewController.h"

@implementation RPPreviewViewControllerDelegateType

/* @abstract Called when the view controller is finished. */
- (void)previewControllerDidFinish:(RPPreviewViewController *)previewController
{
  call_delegate_async(noop(), previewControllerDidFinish,
    js_value_RPPreviewViewController(previewController));
}

/* @abstract Called when the view controller is finished and returns a set of activity types that the user has completed on the recording. The built in activity types are listed in UIActivity.h. */
- (void)previewController:(RPPreviewViewController *)previewController didFinishWithActivityTypes:(NSSet <NSString *> *)activityTypes __TVOS_PROHIBITED
{
  call_delegate_async(noop(), previewControllerDidFinishWithActivityTypes,
    js_value_RPPreviewViewController(previewController),
    js_value_NSSet/* <NSString *>*/(activityTypes));
}

@end
