//
//  NGCControllerAxisInput.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGCControllerAxisInput.h"

@import GameController;

#define instancetype GCControllerAxisInput
#define js_value_instancetype js_value_GCControllerAxisInput

NGCControllerAxisInput::NGCControllerAxisInput() {}
NGCControllerAxisInput::~NGCControllerAxisInput() {}

JS_INIT_CLASS(GCControllerAxisInput, GCControllerElement);
  JS_ASSIGN_PROTO_METHOD(setValue);
  JS_ASSIGN_PROTO_PROP(valueChangedHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(value);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GCControllerAxisInput, GCControllerElement);
  // constant values (exports)
JS_INIT_CLASS_END(GCControllerAxisInput, GCControllerElement);

NAN_METHOD(NGCControllerAxisInput::New) {
  JS_RECONSTRUCT(GCControllerAxisInput);
  @autoreleasepool {
    GCControllerAxisInput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GCControllerAxisInput *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GCControllerAxisInput alloc] init];
    }
    if (self) {
      NGCControllerAxisInput *wrapper = new NGCControllerAxisInput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GCControllerAxisInput::New: invalid arguments");
    }
  }
}

NAN_METHOD(NGCControllerAxisInput::setValue) {
  JS_UNWRAP(GCControllerAxisInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, value);
    [self setValue: value];
  }
}

NAN_GETTER(NGCControllerAxisInput::valueChangedHandlerGetter) {
  JS_UNWRAP(GCControllerAxisInput, self);
  declare_autoreleasepool {
    get_persistent_function(self, handler, @"NGCControllerAxisInput::valueChangedHandler");
    if (handler && [handler jsFunction]) {
      JS_SET_RETURN([handler jsFunction]->Get());
    }
  }
}

NAN_SETTER(NGCControllerAxisInput::valueChangedHandlerSetter) {
  JS_UNWRAP(GCControllerAxisInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(input, @"NGCControllerAxisInput::valueChangedHandler");
    [self setValueChangedHandler: ^(GCControllerAxisInput *axis, float value){
      dispatch_main(^{
        get_persistent_function(self, input, @"NGCControllerAxisInput::valueChangedHandler");
        if (input && [input jsFunction]) {
          [input jsFunction]->Call("NGCControllerAxisInput::valueChangedHandler",
            js_value_GCControllerAxisInput(axis),
            js_value_float(value));
        }
      });
    }];
  }
}

NAN_GETTER(NGCControllerAxisInput::valueGetter) {
  JS_UNWRAP(GCControllerAxisInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self value]));
  }
}
