//
//  NCLFloor.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLFloor.h"

#define instancetype CLFloor
#define js_value_instancetype js_value_CLFloor

NCLFloor::NCLFloor() {}
NCLFloor::~NCLFloor() {}

JS_INIT_CLASS(CLFloor, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(level);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLFloor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CLFloor, NSObject);

NAN_METHOD(NCLFloor::New) {
  JS_RECONSTRUCT(CLFloor);
  @autoreleasepool {
    CLFloor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLFloor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLFloor alloc] init];
    }
    if (self) {
      NCLFloor *wrapper = new NCLFloor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLFloor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NCLFloor::levelGetter) {
  JS_UNWRAP(CLFloor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self level]));
  }
}
