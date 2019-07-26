//
//  NGCExtendedGamepad.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGCExtendedGamepad.h"

@import GameController;

#define instancetype GCExtendedGamepad
#define js_value_instancetype js_value_GCExtendedGamepad

NGCExtendedGamepad::NGCExtendedGamepad() {}
NGCExtendedGamepad::~NGCExtendedGamepad() {}

JS_INIT_CLASS(GCExtendedGamepad, NSObject);
#if DEPRECATED
  JS_ASSIGN_PROTO_METHOD(saveSnapshot);
#endif
  JS_ASSIGN_PROTO_METHOD(setStateFromExtendedGamepad);
  JS_ASSIGN_PROTO_PROP_READONLY(controller);
  JS_ASSIGN_PROTO_PROP(valueChangedHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(dpad);
  JS_ASSIGN_PROTO_PROP_READONLY(buttonA);
  JS_ASSIGN_PROTO_PROP_READONLY(buttonB);
  JS_ASSIGN_PROTO_PROP_READONLY(buttonX);
  JS_ASSIGN_PROTO_PROP_READONLY(buttonY);
  JS_ASSIGN_PROTO_PROP_READONLY(buttonMenu);
  JS_ASSIGN_PROTO_PROP_READONLY(buttonOptions);
  JS_ASSIGN_PROTO_PROP_READONLY(leftThumbstick);
  JS_ASSIGN_PROTO_PROP_READONLY(rightThumbstick);
  JS_ASSIGN_PROTO_PROP_READONLY(leftShoulder);
  JS_ASSIGN_PROTO_PROP_READONLY(rightShoulder);
  JS_ASSIGN_PROTO_PROP_READONLY(leftTrigger);
  JS_ASSIGN_PROTO_PROP_READONLY(rightTrigger);
  JS_ASSIGN_PROTO_PROP_READONLY(leftThumbstickButton);
  JS_ASSIGN_PROTO_PROP_READONLY(rightThumbstickButton);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GCExtendedGamepad, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(GCExtendedGamepad, NSObject);

NAN_METHOD(NGCExtendedGamepad::New) {
  JS_RECONSTRUCT(GCExtendedGamepad);
  @autoreleasepool {
    GCExtendedGamepad* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GCExtendedGamepad *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GCExtendedGamepad alloc] init];
    }
    if (self) {
      NGCExtendedGamepad *wrapper = new NGCExtendedGamepad();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GCExtendedGamepad::New: invalid arguments");
    }
  }
}

#if DEPRECATED
NAN_METHOD(NGCExtendedGamepad::saveSnapshot) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCExtendedGamepadSnapshot([self saveSnapshot]));
  }
}
#endif

NAN_METHOD(NGCExtendedGamepad::setStateFromExtendedGamepad) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(GCExtendedGamepad, extendedGamepad);
    [self setStateFromExtendedGamepad: extendedGamepad];
  }
}

#include "NGCController.h"

NAN_GETTER(NGCExtendedGamepad::controllerGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCController([self controller]));
  }
}

NAN_GETTER(NGCExtendedGamepad::valueChangedHandlerGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    get_persistent_function(self, handler, @"NGCExtendedGamepad::valueChangedHandler");
    if (handler && [handler jsFunction]) {
      JS_SET_RETURN([handler jsFunction]->Get());
    }
  }
}

#include "NGCControllerElement.h"

NAN_SETTER(NGCExtendedGamepad::valueChangedHandlerSetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(input, @"NGCExtendedGamepad::valueChangedHandler");
    [self setValueChangedHandler: ^(GCExtendedGamepad *gamepad, GCControllerElement *element){
      dispatch_main(^{
        get_persistent_function(self, input, @"NGCExtendedGamepad::valueChangedHandler");
        if (input && [input jsFunction]) {
          [input jsFunction]->Call("NGCExtendedGamepad::valueChangedHandler",
            js_value_GCExtendedGamepad(gamepad),
            js_value_GCControllerElement(element));
        }
      });
    }];
  }
}

#include "NGCControllerDirectionPad.h"

NAN_GETTER(NGCExtendedGamepad::dpadGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerDirectionPad([self dpad]));
  }
}

#include "NGCControllerButtonInput.h"

NAN_GETTER(NGCExtendedGamepad::buttonAGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self buttonA]));
  }
}

NAN_GETTER(NGCExtendedGamepad::buttonBGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self buttonB]));
  }
}

NAN_GETTER(NGCExtendedGamepad::buttonXGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self buttonX]));
  }
}

NAN_GETTER(NGCExtendedGamepad::buttonYGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self buttonY]));
  }
}

NAN_GETTER(NGCExtendedGamepad::buttonMenuGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self buttonMenu]));
  }
}

NAN_GETTER(NGCExtendedGamepad::buttonOptionsGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self buttonOptions]));
  }
}

NAN_GETTER(NGCExtendedGamepad::leftThumbstickGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerDirectionPad([self leftThumbstick]));
  }
}

NAN_GETTER(NGCExtendedGamepad::rightThumbstickGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerDirectionPad([self rightThumbstick]));
  }
}

NAN_GETTER(NGCExtendedGamepad::leftShoulderGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self leftShoulder]));
  }
}

NAN_GETTER(NGCExtendedGamepad::rightShoulderGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self rightShoulder]));
  }
}

NAN_GETTER(NGCExtendedGamepad::leftTriggerGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self leftTrigger]));
  }
}

NAN_GETTER(NGCExtendedGamepad::rightTriggerGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self rightTrigger]));
  }
}

NAN_GETTER(NGCExtendedGamepad::leftThumbstickButtonGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self leftThumbstickButton]));
  }
}

NAN_GETTER(NGCExtendedGamepad::rightThumbstickButtonGetter) {
  JS_UNWRAP(GCExtendedGamepad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self rightThumbstickButton]));
  }
}
