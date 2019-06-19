//
//  NUIVisualEffectView.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIVisualEffectView.h"

#define instancetype UIVisualEffectView
#define js_value_instancetype js_value_UIVisualEffectView

NUIVisualEffectView::NUIVisualEffectView() {}
NUIVisualEffectView::~NUIVisualEffectView() {}

JS_INIT_CLASS(UIVisualEffectView, UIView);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(initWithEffect);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_PROP_READONLY(contentView);
  JS_ASSIGN_PROTO_PROP(effect);
  // static members (ctor)
  JS_INIT_CTOR(UIVisualEffectView, UIView);
  // constant values (exports)
JS_INIT_CLASS_END(UIVisualEffectView, UIView);

NAN_METHOD(NUIVisualEffectView::New) {
  JS_RECONSTRUCT(UIVisualEffectView);
  @autoreleasepool {
    UIVisualEffectView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIVisualEffectView *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIVisualEffectView alloc] init];
    }
    if (self) {
      NUIVisualEffectView *wrapper = new NUIVisualEffectView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIVisualEffectView::New: invalid arguments");
    }
  }
}

#include "NUIVisualEffect.h"

NAN_METHOD(NUIVisualEffectView::initWithEffect) {
  JS_UNWRAP_OR_ALLOC(UIVisualEffectView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIVisualEffect, effect);
    JS_SET_RETURN(js_value_instancetype([self initWithEffect: effect]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIVisualEffectView::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UIVisualEffectView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_GETTER(NUIVisualEffectView::contentViewGetter) {
  JS_UNWRAP(UIVisualEffectView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self contentView]));
  }
}

NAN_GETTER(NUIVisualEffectView::effectGetter) {
  JS_UNWRAP(UIVisualEffectView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIVisualEffect([self effect]));
  }
}

NAN_SETTER(NUIVisualEffectView::effectSetter) {
  JS_UNWRAP(UIVisualEffectView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIVisualEffect, input);
    [self setEffect: input];
  }
}
