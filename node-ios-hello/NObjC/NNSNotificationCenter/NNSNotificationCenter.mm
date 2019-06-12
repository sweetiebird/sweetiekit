//
//  NSNotificationCenter.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSNotificationCenter.h"
#include "NNSNotification.h"

NNSNotificationCenter::NNSNotificationCenter () {}
NNSNotificationCenter::~NNSNotificationCenter () {}

JS_INIT_CLASS(NSNotificationCenter, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, postNotification);
  JS_ASSIGN_METHOD(proto, addObserverForName);
  // static members (ctor)
  JS_INIT_CTOR(NSNotificationCenter, NSObject);
JS_INIT_CLASS_END(NSNotificationCenter, NSObject);

NAN_METHOD(NNSNotificationCenter::New) {
  JS_RECONSTRUCT(NSNotificationCenter);

  Local<Object> obj = info.This();

  NNSNotificationCenter *ui = new NNSNotificationCenter();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge NSNotificationCenter *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([NSNotificationCenter defaultCenter]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NNSNotificationCenter::postNotification) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSNotificationCenter, ns);
  
  NNSNotification *notif = ObjectWrap::Unwrap<NNSNotification>(JS_OBJ(info[0]));

  @autoreleasepool {
    [ns postNotification:notif->As<NSNotification>()];
  }
}

NAN_METHOD(NNSNotificationCenter::addObserverForName) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSNotificationCenter, ns);

  @autoreleasepool {
    NSString *name = NJSStringToNSString(info[0]);
    
    [ns addObserverForName:name object:nil queue:nil usingBlock: ^ (NSNotification * _Nonnull note) {
      
    }];
  }
}
