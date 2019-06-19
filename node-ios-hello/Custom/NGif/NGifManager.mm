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
  @autoreleasepool {
    GifManager* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GifManager *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0) {
      declare_args();
      declare_value(NSInteger, limit);
      self = [[GifManager alloc] initWithMemoryLimit:limit];
    }
    if (self) {
      NGifManager *wrapper = new NGifManager();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GifManager::New: invalid arguments");
    }
  }
}
