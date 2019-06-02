//
//  NGifManager.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NGif.h"
#include "NGifManager.h"
#import "node_ios_hello-Swift.h"

NGifManager::NGifManager () {}
NGifManager::~NGifManager () {}

JS_INIT_CLASS(GifManager, NSObject);
  // instance members (proto)
  
  // static members (ctor)
  JS_INIT_CTOR(GifManager, NSObject);

JS_INIT_CLASS_END(GifManager, NSObject);

NAN_METHOD(NGifManager::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NGifManager *ui = new NGifManager();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge GifManager *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      double limit = TO_DOUBLE(info[0]);
      ui->SetNSObject([[GifManager alloc] initWithMemoryLimit:limit]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}
