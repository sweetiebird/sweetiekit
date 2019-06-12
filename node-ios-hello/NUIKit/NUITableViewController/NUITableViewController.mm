//
//  NUITableViewController.mm
//
//  Created by Emily Kolar on 4/20/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewController.h"

NUITableViewController::NUITableViewController() {}
NUITableViewController::~NUITableViewController() {}

JS_INIT_CLASS(UITableViewController, UIViewController);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewController, UIViewController);
JS_INIT_CLASS_END(UITableViewController, UIViewController);

NAN_METHOD(NUITableViewController::New) {
  JS_RECONSTRUCT(UITableViewController);

  Local<Object> ctrlObj = info.This();

  NUITableViewController *ctrl = new NUITableViewController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UITableViewController *)(info[0].As<External>()->Value()));
  } else {
    std::string style;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      style = *utf8Value;
      if (style != "grouped" && style != "plain") {
        Nan::ThrowError("invalid argument: style must be 'plain' or 'grouped'");
      }
    } else {
      style = "plain";
    }
    UITableViewStyle s = style == "plain" ? UITableViewStylePlain : UITableViewStyleGrouped;
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        ctrl->SetNSObject([[UITableViewController alloc] initWithStyle:s]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

