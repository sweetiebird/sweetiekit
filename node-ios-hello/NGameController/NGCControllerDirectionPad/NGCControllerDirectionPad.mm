//
//  NGCControllerDirectionPad.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGCControllerDirectionPad.h"

@import GameController;

#define instancetype GCControllerDirectionPad
#define js_value_instancetype js_value_GCControllerDirectionPad

NGCControllerDirectionPad::NGCControllerDirectionPad() {}
NGCControllerDirectionPad::~NGCControllerDirectionPad() {}

JS_INIT_CLASS(GCControllerDirectionPad, GCControllerElement);
  JS_ASSIGN_PROTO_METHOD(setValueForXAxisYAxis);
  JS_ASSIGN_PROTO_PROP(valueChangedHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(xAxis);
  JS_ASSIGN_PROTO_PROP_READONLY(yAxis);
  JS_ASSIGN_PROTO_PROP_READONLY(up);
  JS_ASSIGN_PROTO_PROP_READONLY(down);
  JS_ASSIGN_PROTO_PROP_READONLY(left);
  JS_ASSIGN_PROTO_PROP_READONLY(right);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GCControllerDirectionPad, GCControllerElement);
  // constant values (exports)
JS_INIT_CLASS_END(GCControllerDirectionPad, GCControllerElement);

NAN_METHOD(NGCControllerDirectionPad::New) {
  JS_RECONSTRUCT(GCControllerDirectionPad);
  @autoreleasepool {
    GCControllerDirectionPad* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GCControllerDirectionPad *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GCControllerDirectionPad alloc] init];
    }
    if (self) {
      NGCControllerDirectionPad *wrapper = new NGCControllerDirectionPad();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GCControllerDirectionPad::New: invalid arguments");
    }
  }
}

NAN_METHOD(NGCControllerDirectionPad::setValueForXAxisYAxis) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, xAxis);
    declare_value(float, yAxis);
    [self setValueForXAxis: xAxis yAxis: yAxis];
  }
}

NAN_GETTER(NGCControllerDirectionPad::valueChangedHandlerGetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    get_persistent_function(self, handler, @"NGCControllerDirectionPad::valueChangedHandler");
    if (handler && [handler jsFunction]) {
      JS_SET_RETURN([handler jsFunction]->Get());
    }
  }
}

#include "NGCControllerElement.h"

NAN_SETTER(NGCControllerDirectionPad::valueChangedHandlerSetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(input, @"NGCControllerDirectionPad::valueChangedHandler");
    [self setValueChangedHandler: ^(GCControllerDirectionPad *dpad, float xValue, float yValue){
      dispatch_main(^{
        get_persistent_function(self, input, @"NGCControllerDirectionPad::valueChangedHandler");
        if (input && [input jsFunction]) {
          [input jsFunction]->Call("NGCControllerDirectionPad::valueChangedHandler",
            js_value_GCControllerDirectionPad(dpad),
            js_value_float(xValue),
            js_value_float(yValue));
        }
      });
    }];
  }
}

#include "NGCControllerAxisInput.h"

NAN_GETTER(NGCControllerDirectionPad::xAxisGetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerAxisInput([self xAxis]));
  }
}

NAN_GETTER(NGCControllerDirectionPad::yAxisGetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerAxisInput([self yAxis]));
  }
}

#include "NGCControllerButtonInput.h"

NAN_GETTER(NGCControllerDirectionPad::upGetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self up]));
  }
}

NAN_GETTER(NGCControllerDirectionPad::downGetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self down]));
  }
}

NAN_GETTER(NGCControllerDirectionPad::leftGetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self left]));
  }
}

NAN_GETTER(NGCControllerDirectionPad::rightGetter) {
  JS_UNWRAP(GCControllerDirectionPad, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerButtonInput([self right]));
  }
}
