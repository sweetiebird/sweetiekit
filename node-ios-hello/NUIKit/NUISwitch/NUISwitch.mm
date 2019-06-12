//
//  NUISwitch.mm
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISwitch.h"

NUISwitch::NUISwitch() {}
NUISwitch::~NUISwitch() {}

JS_INIT_CLASS(UISwitch, UIControl);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, setOn);
  JS_ASSIGN_PROP(proto, isOn);
  JS_ASSIGN_PROP(proto, onTintColor);
  // static members (ctor)
  JS_INIT_CTOR(UISwitch, UIControl);
JS_INIT_CLASS_END(UISwitch, UIControl);

NAN_METHOD(NUISwitch::New) {
  JS_RECONSTRUCT(UISwitch);
  
  Local<Object> obj = info.This();
  
  NUISwitch *view = new NUISwitch();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UISwitch *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
      double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
      double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[UISwitch alloc] initWithFrame:frame]);
      });
    }
  }
  view->Wrap(obj);
  
  JS_SET_RETURN(obj);
}

NAN_GETTER(NUISwitch::isOnGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UISwitch, ui);
  
  __block BOOL isOn = false;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      isOn = [ui isOn];
    });
  }
  
  auto result = JS_BOOL(isOn);
  JS_SET_RETURN(result);
}

NAN_SETTER(NUISwitch::isOnSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UISwitch, ui);
  
  bool isOn = value->IsBoolean() ? TO_BOOL(value) : false;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setOn:isOn];
    });
  }
}

NAN_GETTER(NUISwitch::onTintColorGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UISwitch, ui);
  
  // TOOD: Deal with UIColor
//  __block BOOL isOn = false;
//  @autoreleasepool {
//    dispatch_sync(dispatch_get_main_queue(), ^ {
//      isOn = [ui isOn];
//    });
//  }
//
//  auto result = JS_BOOL(isOn);
//  JS_SET_RETURN(result);
}

NAN_SETTER(NUISwitch::onTintColorSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UISwitch, ui);
  
  // TODO: Deal with UIColor
//  bool isOn = value->IsBoolean() ? TO_BOOL(value) : false;
//
//  @autoreleasepool {
//    dispatch_sync(dispatch_get_main_queue(), ^ {
//      [ui setOn:isOn];
//    });
//  }
}

NAN_METHOD(NUISwitch::setOn) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UISwitch, ui);

  bool isOn = info[0]->IsBoolean() ? TO_BOOL(info[0]) : false;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setOn:isOn];
    });
  }
}
