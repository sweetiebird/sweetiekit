//
//  NGCControllerButtonInput.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGCControllerButtonInput.h"

@import GameController;

#define instancetype GCControllerButtonInput
#define js_value_instancetype js_value_GCControllerButtonInput

NGCControllerButtonInput::NGCControllerButtonInput() {}
NGCControllerButtonInput::~NGCControllerButtonInput() {}

JS_INIT_CLASS(GCControllerButtonInput, GCControllerElement);
  JS_ASSIGN_PROTO_METHOD(setValue);
  JS_ASSIGN_PROTO_PROP(valueChangedHandler);
  JS_ASSIGN_PROTO_PROP(pressedChangedHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(value);
  JS_ASSIGN_PROTO_PROP_READONLY(isPressed);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GCControllerButtonInput, GCControllerElement);
  // constant values (exports)
JS_INIT_CLASS_END(GCControllerButtonInput, GCControllerElement);

NAN_METHOD(NGCControllerButtonInput::New) {
  JS_RECONSTRUCT(GCControllerButtonInput);
  @autoreleasepool {
    GCControllerButtonInput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GCControllerButtonInput *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GCControllerButtonInput alloc] init];
    }
    if (self) {
      NGCControllerButtonInput *wrapper = new NGCControllerButtonInput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GCControllerButtonInput::New: invalid arguments");
    }
  }
}

NAN_METHOD(NGCControllerButtonInput::setValue) {
  JS_UNWRAP(GCControllerButtonInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, value);
    [self setValue: value];
  }
}

NAN_GETTER(NGCControllerButtonInput::valueChangedHandlerGetter) {
  JS_UNWRAP(GCControllerButtonInput, self);
  declare_autoreleasepool {
    get_persistent_function(self, handler, @"NGCControllerButtonInput::valueChangedHandler");
    if (handler && [handler jsFunction]) {
      JS_SET_RETURN([handler jsFunction]->Get());
    }
  }
}

NAN_SETTER(NGCControllerButtonInput::valueChangedHandlerSetter) {
  JS_UNWRAP(GCControllerButtonInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(input, @"NGCControllerButtonInput::valueChangedHandler");
    [self setValueChangedHandler: ^(GCControllerButtonInput *button, float value, BOOL pressed){
      dispatch_main(^{
        get_persistent_function(self, input, @"NGCControllerButtonInput::valueChangedHandler");
        if (input && [input jsFunction]) {
          [input jsFunction]->Call("NGCControllerButtonInput::valueChangedHandler",
            js_value_GCControllerButtonInput(button),
            js_value_float(value),
            js_value_BOOL(pressed));
        }
      });
    }];
  }
}

NAN_GETTER(NGCControllerButtonInput::pressedChangedHandlerGetter) {
  JS_UNWRAP(GCControllerButtonInput, self);
  declare_autoreleasepool {
    get_persistent_function(self, handler, @"NGCControllerButtonInput::pressedChangedHandler");
    if (handler && [handler jsFunction]) {
      JS_SET_RETURN([handler jsFunction]->Get());
    }
  }
}

NAN_SETTER(NGCControllerButtonInput::pressedChangedHandlerSetter) {
  JS_UNWRAP(GCControllerButtonInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(input, @"NGCControllerButtonInput::pressedChangedHandler");
    [self setPressedChangedHandler: ^(GCControllerButtonInput *button, float value, BOOL pressed){
      dispatch_main(^{
        get_persistent_function(self, input, @"NGCControllerButtonInput::pressedChangedHandler");
        if (input && [input jsFunction]) {
          [input jsFunction]->Call("NGCControllerButtonInput::pressedChangedHandler",
            js_value_GCControllerButtonInput(button),
            js_value_float(value),
            js_value_BOOL(pressed));
        }
      });
    }];
  }
}

NAN_GETTER(NGCControllerButtonInput::valueGetter) {
  JS_UNWRAP(GCControllerButtonInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self value]));
  }
}

NAN_GETTER(NGCControllerButtonInput::isPressedGetter) {
  JS_UNWRAP(GCControllerButtonInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPressed]));
  }
}
