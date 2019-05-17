//
//  NUISwitch.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//


#include "NUISwitch.h"
#include "ColorHelper.h"

Nan::Persistent<FunctionTemplate> NUISwitch::type;

NUISwitch::NUISwitch () {}
NUISwitch::~NUISwitch () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUISwitch::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;
  
  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UISwitch"));
  type.Reset(ctor);
  
  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "setOn", SetOn);
  JS_SET_PROP(proto, "isOn", IsOn);
  JS_SET_PROP(proto, "onTintColor", OnTintColor);
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUISwitch::New) {
  Nan::HandleScope scope;
  
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

NAN_GETTER(NUISwitch::IsOnGetter) {
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

NAN_SETTER(NUISwitch::IsOnSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UISwitch, ui);
  
  bool isOn = value->IsBoolean() ? TO_BOOL(value) : false;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setOn:isOn];
    });
  }
}

NAN_GETTER(NUISwitch::OnTintColorGetter) {
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

NAN_SETTER(NUISwitch::OnTintColorSetter) {
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

NAN_METHOD(NUISwitch::SetOn) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UISwitch, ui);

  bool isOn = info[0]->IsBoolean() ? TO_BOOL(info[0]) : false;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setOn:isOn];
    });
  }
}
