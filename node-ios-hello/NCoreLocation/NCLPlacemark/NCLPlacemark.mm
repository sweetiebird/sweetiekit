//
//  CLPlacemark.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLPlacemark.h"
#include "NCLLocation.h"

NCLPlacemark::NCLPlacemark () {}
NCLPlacemark::~NCLPlacemark () {}

JS_INIT_CLASS(CLPlacemark, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, location);
  // static members (ctor)
  JS_INIT_CTOR(CLPlacemark, NSObject);
JS_INIT_CLASS_END(CLPlacemark, NSObject);

NAN_METHOD(NCLPlacemark::New) {
  JS_RECONSTRUCT(CLPlacemark);

  Local<Object> obj = info.This();

  NCLPlacemark *ui = new NCLPlacemark();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CLPlacemark *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CLPlacemark alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NCLPlacemark::locationGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLPlacemark, cl);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([cl location], NCLLocation::type));
}
