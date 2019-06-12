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

  Local<Object> obj = info.This();

  NGif *ui = new NGif();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge Gif *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      std::string imageName;
      if (info[0]->IsString()) {
        Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
        imageName = *utf8Value;
      } else {
        // throw
      }
      NSString* result = [NSString stringWithUTF8String:imageName.c_str()];
      double integrity = TO_DOUBLE(info[1]);
      ui->SetNSObject([[Gif alloc] initWithGifName:result levelOfIntegrity:integrity error:nullptr]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}
