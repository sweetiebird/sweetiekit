//
//  NUIBlurEffect.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIBlurEffect.h"

#define instancetype UIBlurEffect
#define js_value_instancetype js_value_UIBlurEffect

NUIBlurEffect::NUIBlurEffect() {}
NUIBlurEffect::~NUIBlurEffect() {}

JS_INIT_CLASS(UIBlurEffect, UIVisualEffect);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(effectWithStyle);
  // static members (ctor)
  JS_INIT_CTOR(UIBlurEffect, UIVisualEffect);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UIBlurEffectStyle) {
    JS_ASSIGN_ENUM(UIBlurEffectStyleExtraLight, NSInteger);
    JS_ASSIGN_ENUM(UIBlurEffectStyleLight, NSInteger);
    JS_ASSIGN_ENUM(UIBlurEffectStyleDark, NSInteger);
#if __TVOS__
    JS_ASSIGN_ENUM(UIBlurEffectStyleExtraDark, NSInteger); //  __TVOS_AVAILABLE(10_0) __IOS_PROHIBITED __WATCHOS_PROHIBITED,
#endif
    JS_ASSIGN_ENUM(UIBlurEffectStyleRegular, NSInteger); //  NS_ENUM_AVAILABLE_IOS(10_0), 
    JS_ASSIGN_ENUM(UIBlurEffectStyleProminent, NSInteger); //  NS_ENUM_AVAILABLE_IOS(10_0), 
  //} NS_ENUM_AVAILABLE_IOS(8_0);

JS_INIT_CLASS_END(UIBlurEffect, UIVisualEffect);

NAN_METHOD(NUIBlurEffect::New) {
  JS_RECONSTRUCT(UIBlurEffect);
  @autoreleasepool {
    UIBlurEffect* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIBlurEffect *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIBlurEffect alloc] init];
    }
    if (self) {
      NUIBlurEffect *wrapper = new NUIBlurEffect();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIBlurEffect::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIBlurEffect::effectWithStyle) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIBlurEffectStyle, style);
    JS_SET_RETURN(js_value_UIBlurEffect([UIBlurEffect effectWithStyle: style]));
  }
}
