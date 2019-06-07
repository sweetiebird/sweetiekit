//
//  NUINib.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINib.h"

#define instancetype UINib
#define js_value_instancetype js_value_UINib

NUINib::NUINib() {}
NUINib::~NUINib() {}

JS_INIT_CLASS(UINib, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(instantiateWithOwnerOptions);
  // static members (ctor)
  JS_INIT_CTOR(UINib, NSObject);
  JS_ASSIGN_STATIC_METHOD(nibWithNibNameBundle);
  JS_ASSIGN_STATIC_METHOD(nibWithDataBundle);
JS_INIT_CLASS_END(UINib, NSObject);

NAN_METHOD(NUINib::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUINib *nib = new NUINib();

  if (info[0]->IsExternal()) {
    nib->SetNSObject((__bridge UINib *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    std::string name;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      name = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *nibName = [NSString stringWithUTF8String:name.c_str()];
      nib->SetNSObject([UINib nibWithNibName:nibName bundle:nullptr]);
    }
  } else {
    @autoreleasepool {
      nib->SetNSObject([[UINib alloc] init]);
    }
  }
  nib->Wrap(obj);

  JS_SET_RETURN(obj);
}

#include "NNSBundle.h"

NAN_METHOD(NUINib::nibWithNibNameBundle) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSBundle, bundleOrNil);
    JS_SET_RETURN(js_value_UINib([UINib nibWithNibName: name bundle: bundleOrNil]));
  }
}

NAN_METHOD(NUINib::nibWithDataBundle) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSBundle, bundleOrNil);
    JS_SET_RETURN(js_value_UINib([UINib nibWithData: data bundle: bundleOrNil]));
  }
}

NAN_METHOD(NUINib::instantiateWithOwnerOptions) {
  JS_UNWRAP(UINib, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, ownerOrNil);
    declare_nullable_pointer(NSDictionary/* <UINibOptionsKey, id>*/, optionsOrNil);
    JS_SET_RETURN(js_value_NSArray([self instantiateWithOwner: ownerOrNil options: optionsOrNil]));
  }
}
