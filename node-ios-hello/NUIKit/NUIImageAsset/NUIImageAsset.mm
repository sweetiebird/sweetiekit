//
//  NUIImageAsset.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImageAsset.h"

NUIImageAsset::NUIImageAsset() {}
NUIImageAsset::~NUIImageAsset() {}

JS_INIT_CLASS(UIImageAsset, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, initWithCoder);
  JS_ASSIGN_METHOD(proto, imageWithTraitCollection);
  JS_ASSIGN_METHOD(proto, registerImageWithTraitCollection);
  JS_ASSIGN_METHOD(proto, unregisterImageWithTraitCollection);
  // static members (ctor)
  JS_INIT_CTOR(UIImageAsset, NSObject);
  JS_ASSIGN_METHOD(ctor, init);
JS_INIT_CLASS_END(UIImageAsset, NSObject);

NAN_METHOD(NUIImageAsset::New) {
  JS_RECONSTRUCT(UIImageAsset);
  @autoreleasepool {
    UIImageAsset* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIImageAsset *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIImageAsset alloc] init];
    }
    if (self) {
      NUIImageAsset *wrapper = new NUIImageAsset();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIImageAsset::New: invalid arguments");
    }
  }
}

#define instancetype UIImageAsset
#define js_value_instancetype js_value_UIImageAsset

NAN_METHOD(NUIImageAsset::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UIImageAsset alloc] init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIImageAsset::initWithCoder) {
  JS_UNWRAP(UIImageAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

#include "NUITraitCollection.h"
#include "NUIImage.h"

NAN_METHOD(NUIImageAsset::imageWithTraitCollection) {
  JS_UNWRAP(UIImageAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITraitCollection, traitCollection);
    JS_SET_RETURN(js_value_UIImage([self imageWithTraitCollection: traitCollection]));
  }
}

NAN_METHOD(NUIImageAsset::registerImageWithTraitCollection) {
  JS_UNWRAP(UIImageAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIImage, image);
    declare_pointer(UITraitCollection, traitCollection);
    [self registerImage: image withTraitCollection: traitCollection];
  }
}

NAN_METHOD(NUIImageAsset::unregisterImageWithTraitCollection) {
  JS_UNWRAP(UIImageAsset, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITraitCollection, traitCollection);
    [self unregisterImageWithTraitCollection: traitCollection];
  }
}

