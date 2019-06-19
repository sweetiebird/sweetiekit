//
//  NAVAudioConnectionPoint.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioConnectionPoint.h"

#define instancetype AVAudioConnectionPoint
#define js_value_instancetype js_value_AVAudioConnectionPoint

NAVAudioConnectionPoint::NAVAudioConnectionPoint() {}
NAVAudioConnectionPoint::~NAVAudioConnectionPoint() {}

JS_INIT_CLASS(AVAudioConnectionPoint, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(node);
  JS_ASSIGN_PROTO_PROP_READONLY(bus);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioConnectionPoint, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithNodeBus);
JS_INIT_CLASS_END(AVAudioConnectionPoint, NSObject);

NAN_METHOD(NAVAudioConnectionPoint::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioConnectionPoint(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioConnectionPoint, info);
      return;
    }

    AVAudioConnectionPoint* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioConnectionPoint *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioConnectionPoint *wrapper = new NAVAudioConnectionPoint();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioConnectionPoint::New: invalid arguments");
    }
  }
}

#include "NAVAudioNode.h"

NAN_METHOD(NAVAudioConnectionPoint::initWithNodeBus) {
  JS_UNWRAP_OR_ALLOC(AVAudioConnectionPoint, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    declare_value(AVAudioNodeBus, bus);
    JS_SET_RETURN(js_value_instancetype([self initWithNode: node bus: bus]));
  }
}

NAN_GETTER(NAVAudioConnectionPoint::nodeGetter) {
  JS_UNWRAP(AVAudioConnectionPoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioNode([self node]));
  }
}

NAN_GETTER(NAVAudioConnectionPoint::busGetter) {
  JS_UNWRAP(AVAudioConnectionPoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioNodeBus([self bus]));
  }
}

