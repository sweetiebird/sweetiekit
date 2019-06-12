//
//  NUICollectionViewController.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewController.h"

NUICollectionViewController::NUICollectionViewController() {}
NUICollectionViewController::~NUICollectionViewController() {}

JS_INIT_CLASS(UICollectionViewController, UIViewController);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewController, UIViewController);
JS_INIT_CLASS_END(UICollectionViewController, UIViewController);

NAN_METHOD(NUICollectionViewController::New) {
  JS_RECONSTRUCT(UICollectionViewController);

  Local<Object> ctrlObj = info.This();

  NUICollectionViewController *ctrl = new NUICollectionViewController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UICollectionViewController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([UICollectionViewController alloc]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}
