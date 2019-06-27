//
//  NUISwitch.mm
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISwitch.h"

#define instancetype UISwitch
#define js_value_instancetype js_value_UISwitch

NUISwitch::NUISwitch() {}
NUISwitch::~NUISwitch() {}

JS_INIT_CLASS(UISwitch, UIControl);
  JS_ASSIGN_PROTO_METHOD(initWithFrame);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(setOnAnimated);
  JS_ASSIGN_PROTO_PROP(onTintColor);
  JS_ASSIGN_PROTO_PROP(tintColor);
  JS_ASSIGN_PROTO_PROP(thumbTintColor);
  JS_ASSIGN_PROTO_PROP(onImage);
  JS_ASSIGN_PROTO_PROP(offImage);
  JS_ASSIGN_PROTO_PROP(isOn);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UISwitch, UIControl);
JS_INIT_CLASS_END(UISwitch, UIControl);

NAN_METHOD(NUISwitch::New) {
  JS_RECONSTRUCT(UISwitch);
  @autoreleasepool {
    UISwitch* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UISwitch *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UISwitch alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UISwitch alloc] init];
    }
    if (self) {
      NUISwitch *wrapper = new NUISwitch();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISwitch::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUISwitch::initWithFrame) {
  JS_UNWRAP_OR_ALLOC(UISwitch, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    JS_SET_RETURN(js_value_instancetype([self initWithFrame: frame]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUISwitch::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UISwitch, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUISwitch::setOnAnimated) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, on);
    declare_value(BOOL, animated);
    [self setOn: on animated: animated];
  }
}

NAN_GETTER(NUISwitch::onTintColorGetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self onTintColor]));
  }
}

NAN_SETTER(NUISwitch::onTintColorSetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setOnTintColor: input];
  }
}

NAN_GETTER(NUISwitch::tintColorGetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUISwitch::tintColorSetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTintColor: input];
  }
}

NAN_GETTER(NUISwitch::thumbTintColorGetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self thumbTintColor]));
  }
}

NAN_SETTER(NUISwitch::thumbTintColorSetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setThumbTintColor: input];
  }
}

#include "NUIImage.h"

NAN_GETTER(NUISwitch::onImageGetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self onImage]));
  }
}

NAN_SETTER(NUISwitch::onImageSetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setOnImage: input];
  }
}

NAN_GETTER(NUISwitch::offImageGetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self offImage]));
  }
}

NAN_SETTER(NUISwitch::offImageSetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setOffImage: input];
  }
}

NAN_GETTER(NUISwitch::isOnGetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isOn]));
  }
}

NAN_SETTER(NUISwitch::isOnSetter) {
  JS_UNWRAP(UISwitch, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setOn: input];
  }
}


