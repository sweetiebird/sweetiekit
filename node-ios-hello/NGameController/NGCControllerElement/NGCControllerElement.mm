//
//  NGCControllerElement.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGCControllerElement.h"

@import GameController;

#define instancetype GCControllerElement
#define js_value_instancetype js_value_GCControllerElement

NGCControllerElement::NGCControllerElement() {}
NGCControllerElement::~NGCControllerElement() {}

JS_INIT_CLASS(GCControllerElement, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(collection);
  JS_ASSIGN_PROTO_PROP_READONLY(isAnalog);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GCControllerElement, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(GCControllerElement, NSObject);

NAN_METHOD(NGCControllerElement::New) {
  JS_RECONSTRUCT(GCControllerElement);
  @autoreleasepool {
    GCControllerElement* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GCControllerElement *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GCControllerElement alloc] init];
    }
    if (self) {
      NGCControllerElement *wrapper = new NGCControllerElement();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GCControllerElement::New: invalid arguments");
    }
  }
}

NAN_GETTER(NGCControllerElement::collectionGetter) {
  JS_UNWRAP(GCControllerElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerElement([self collection]));
  }
}

NAN_GETTER(NGCControllerElement::isAnalogGetter) {
  JS_UNWRAP(GCControllerElement, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAnalog]));
  }
}
