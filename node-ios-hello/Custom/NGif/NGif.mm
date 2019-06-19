//
//  Gif.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGif.h"

NGif::NGif () {}
NGif::~NGif () {}

JS_INIT_CLASS(Gif, UIImage);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(Gif, UIImage);
JS_INIT_CLASS_END(Gif, UIImage);

NAN_METHOD(NGif::New) {
  JS_RECONSTRUCT(Gif);
  @autoreleasepool {
    Gif* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge Gif *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[Gif alloc] init];
    } else if (is_value_NSString(info[0])) {
      declare_args();
      declare_pointer(NSString, name);
      declare_value(double, integrity);
      declare_error();
      self = [[Gif alloc] initWithGifName:name levelOfIntegrity:integrity error:&error];
      js_panic_NSError(error);
    }
    if (self) {
      NGif *wrapper = new NGif();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("Gif::New: invalid arguments");
    }
  }
}
