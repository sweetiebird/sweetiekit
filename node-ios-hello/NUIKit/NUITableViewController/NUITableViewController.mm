//
//  NUITableViewController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/20/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITableViewController.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUITableViewController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITableViewController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITableViewController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITableViewController::New) {
  Nan::HandleScope scope;

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

NUITableViewController::NUITableViewController () {}
NUITableViewController::~NUITableViewController () {}

