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
  JS_ASSIGN_PROTO_METHOD_AS(instantiateWithOwnerOptions, "instantiate");
  // static members (ctor)
  JS_INIT_CTOR(UINib, NSObject);
  JS_ASSIGN_STATIC_METHOD(nibWithNibNameBundle);
  JS_ASSIGN_STATIC_METHOD(nibWithDataBundle);
JS_INIT_CLASS_END(UINib, NSObject);

#include "NNSBundle.h"

NAN_METHOD(NUINib::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      JS_SET_RETURN_NEW(UINib, info);
      return;
    }
    UINib* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UINib *)(info[0].As<External>()->Value());
    } else if (is_value_NSString(info[0])) {
      declare_args();
      declare_pointer(NSString, name);
      declare_nullable_pointer(NSBundle, bundle);
      self = [UINib nibWithNibName:name bundle:bundle];
    } else if (info.Length() <= 0) {
      self = [[UINib alloc] init];
    }
    if (self) {
      NUINib *wrapper = new NUINib();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NUINib::New: invalid arguments");
    }
  }
}

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
