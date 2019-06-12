//
//  NCAGradientLayer.mm
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAGradientLayer.h"

#define instancetype CAGradientLayer
#define js_value_instancetype js_value_CAGradientLayer

NCAGradientLayer::NCAGradientLayer() {}
NCAGradientLayer::~NCAGradientLayer() {}

JS_INIT_CLASS(CAGradientLayer, CALayer);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(colors);
  JS_ASSIGN_PROTO_PROP(locations);
  JS_ASSIGN_PROTO_PROP(startPoint);
  JS_ASSIGN_PROTO_PROP(endPoint);
  JS_ASSIGN_PROTO_PROP(type);
  // static members (ctor)
  JS_INIT_CTOR(CAGradientLayer, CALayer);
  // constant values (exports)
  JS_ASSIGN_VALUE(kCAGradientLayerAxial);
  JS_ASSIGN_VALUE(kCAGradientLayerRadial);
  JS_ASSIGN_VALUE(kCAGradientLayerConic);
JS_INIT_CLASS_END(CAGradientLayer, CALayer);

NAN_METHOD(NCAGradientLayer::New) {
  JS_RECONSTRUCT(CAGradientLayer);
  @autoreleasepool {
    CAGradientLayer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAGradientLayer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAGradientLayer alloc] init];
    }
    if (self) {
      NCAGradientLayer *wrapper = new NCAGradientLayer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAGradientLayer::New: invalid arguments");
    }
  }
}


NAN_GETTER(NCAGradientLayer::colorsGetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArrayOfCGColors([self colors]));
  }
}

typedef NSArray NSArrayOfCGColors;

NAN_SETTER(NCAGradientLayer::colorsSetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArrayOfCGColors, input);
    [self setColors: input];
  }
}

NAN_GETTER(NCAGradientLayer::locationsGetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self locations]));
  }
}

NAN_SETTER(NCAGradientLayer::locationsSetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSNumber*>, input);
    [self setLocations: input];
  }
}

NAN_GETTER(NCAGradientLayer::startPointGetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self startPoint]));
  }
}

NAN_SETTER(NCAGradientLayer::startPointSetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setStartPoint: input];
  }
}

NAN_GETTER(NCAGradientLayer::endPointGetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self endPoint]));
  }
}

NAN_SETTER(NCAGradientLayer::endPointSetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setEndPoint: input];
  }
}

NAN_GETTER(NCAGradientLayer::typeGetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAGradientLayerType([self type]));
  }
}

NAN_SETTER(NCAGradientLayer::typeSetter) {
  JS_UNWRAP(CAGradientLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CAGradientLayerType, input);
    [self setType: input];
  }
}

