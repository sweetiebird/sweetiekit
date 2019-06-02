//
//  UITabBar.mm
//
//  Created by Emily Kolar on 2019-5-20.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBar.h"

NUITabBar::NUITabBar() {}
NUITabBar::~NUITabBar() {}

JS_INIT_CLASS(UITabBar, UIView);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, barTintColor);
  JS_ASSIGN_PROP(proto, tintColor);
  JS_ASSIGN_PROP(proto, unselectedItemTintColor);
  // static members (ctor)
  JS_INIT_CTOR(UITabBar, UIView);
JS_INIT_CLASS_END(UITabBar, UIView);

NAN_METHOD(NUITabBar::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITabBar *ui = new NUITabBar();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITabBar *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UITabBar alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NUITabBar::barTintColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITabBar, ui);

  CGFloat red = 0;
  CGFloat green = 0;
  CGFloat blue = 0;
  CGFloat alpha = 1;
  @autoreleasepool {
    UIColor* color = [ui barTintColor];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUITabBar::barTintColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITabBar, ui);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [ui setBarTintColor:color];
  }
}

NAN_GETTER(NUITabBar::tintColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITabBar, ui);

  CGFloat red = 0;
  CGFloat green = 0;
  CGFloat blue = 0;
  CGFloat alpha = 1;
  @autoreleasepool {
    UIColor* color = [ui tintColor];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUITabBar::tintColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITabBar, ui);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [ui setTintColor:color];
  }
}

NAN_GETTER(NUITabBar::unselectedItemTintColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITabBar, ui);

  CGFloat red = 0;
  CGFloat green = 0;
  CGFloat blue = 0;
  CGFloat alpha = 1;
  @autoreleasepool {
    UIColor* color = [ui unselectedItemTintColor];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUITabBar::unselectedItemTintColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITabBar, ui);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [ui setUnselectedItemTintColor:color];
  }
}

