//
//  NUIAlertAction.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIAlertAction.h"

NUIAlertAction::NUIAlertAction() {}
NUIAlertAction::~NUIAlertAction() {}

JS_INIT_CLASS(UIAlertAction, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIAlertAction, NSObject);
JS_INIT_CLASS_END(UIAlertAction, NSObject);

NAN_METHOD(NUIAlertAction::New) {
  JS_RECONSTRUCT(UIAlertAction);

  Local<Object> obj = info.This();

  NUIAlertAction *action = new NUIAlertAction();

  if (info[0]->IsExternal()) {
    action->SetNSObject((__bridge UIAlertAction *)(info[0].As<External>()->Value()));
  } else {
    std::string str;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      str = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *title = [NSString stringWithUTF8String:str.c_str()];
      UIAlertAction* ui = action->SetNSObject([UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler: ^ (UIAlertAction * _Nonnull act) {
        dispatch_main(^{
          Local<Value> actionObj = sweetiekit::GetWrapperFor(act, NUIAlertAction::type);
          JS_GET_FUNCTION(fn, act, @"sweetiekit_UIAlertAction_callback");
          fn("NUITableViewManager::New", actionObj);
        });
      }]);
      JS_ATTACH_FUNCTION(info[1], ui, @"sweetiekit_UIAlertAction_callback");
    }
  }
  action->Wrap(obj);

  JS_SET_RETURN(obj);
}
