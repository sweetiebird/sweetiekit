//
//  NGifManager.mm
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSObject.h"
#include "NGif.h"
#include "NGifManager.h"

NGifManager::NGifManager () {}
NGifManager::~NGifManager () {}

JS_INIT_CLASS(GifManager, NSObject);
  // instance members (proto)
  
  // static members (ctor)
  JS_INIT_CTOR(GifManager, NSObject);

JS_INIT_CLASS_END(GifManager, NSObject);

NAN_METHOD(NGifManager::New) {
  JS_RECONSTRUCT(GifManager);

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
