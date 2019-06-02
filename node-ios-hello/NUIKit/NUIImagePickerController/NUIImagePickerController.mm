//
//  NUIImagePickerController.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImagePickerController.h"

NUIImagePickerController::NUIImagePickerController() {}
NUIImagePickerController::~NUIImagePickerController() {}

JS_INIT_CLASS(UIImagePickerController, UINavigationController);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, delegate);
  // static members (ctor)
  JS_INIT_CTOR(UIImagePickerController, UINavigationController);
JS_INIT_CLASS_END(UIImagePickerController, UINavigationController);

NAN_METHOD(NUIImagePickerController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUIImagePickerController *ctrl = new NUIImagePickerController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UIImagePickerController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        ctrl->SetNSObject([[UIImagePickerController alloc] init]);
        [ctrl->As<UIImagePickerController>() setAllowsEditing:YES];
        [ctrl->As<UIImagePickerController>() setSourceType:UIImagePickerControllerSourceTypeCamera];
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

#include "NUIImagePickerControllerDelegate.h"

NAN_GETTER(NUIImagePickerController::delegateGetter) {
  JS_UNWRAP(UIImagePickerController, ui);
  NUIImagePickerController *view = ObjectWrap::Unwrap<NUIImagePickerController>(info.This());
  Nan::ThrowError("NUIImagePickerController::DelegateGetter not yet implemented");
}

NAN_SETTER(NUIImagePickerController::delegateSetter) {
  Nan::HandleScope scope;

  NUIImagePickerController *ctrl = ObjectWrap::Unwrap<NUIImagePickerController>(info.This());
  NUIImagePickerControllerDelegate *d = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(Local<Object>::Cast(value));
  auto delegate = d->As<SUIImagePickerControllerDelegate>();

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ctrl->As<UIImagePickerController>() setDelegate:delegate];
    });
  }
}
