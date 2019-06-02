//
//  NUIButton.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIButton.h"
#include "NUIControl.h"
#include "NUILabel.h"
#include "NUIImage.h"

Nan::Persistent<FunctionTemplate> NUIButton::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIButton::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIButton"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "title", Title);
  JS_SET_PROP(proto, "callback", Callback);
  JS_ASSIGN_PROP_READONLY(proto, titleLabel);
  JS_ASSIGN_PROP(proto, titleEdgeInsets);
  JS_ASSIGN_PROP(proto, contentEdgeInsets);
  JS_ASSIGN_PROP(proto, imageEdgeInsets);
  JS_ASSIGN_METHOD(proto, setTitleColorForState);
  JS_ASSIGN_METHOD(proto, setTitleForState);
  JS_ASSIGN_METHOD(proto, setBackgroundImageForState);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIButton::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `UIButton(...)`, turn into construct call.
      JS_SET_RETURN_NEW(UIButton, info);
      return;
    }
    UIButton* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIButton *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UIButton alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIButton alloc] init];
    }
    if (self) {
      NUIButton *wrapper = new NUIButton();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIButton::New: invalid arguments");
    }
  }
}

NUIButton::NUIButton () : _callback(new Nan::Persistent<Function>()) {}
NUIButton::~NUIButton () { delete _callback; }

NAN_GETTER(NUIButton::TitleGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIButton, ui);
  
  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [ui currentTitle];
    });
  }

  if (str != nullptr) {
    auto result = JS_STR([str UTF8String]);
    JS_SET_RETURN(result);
  }
}

NAN_SETTER(NUIButton::TitleSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIButton, ui);

  std::string title;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    title = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setTitle:[NSString stringWithUTF8String:title.c_str()] forState:[ui state]];
    });
  }
}

NAN_GETTER(NUIButton::CallbackGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIButton, ui);

  JS_SET_RETURN(Nan::New(nui->_callback));
}

NAN_SETTER(NUIButton::CallbackSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIButton, ui);
  
  nui->_callback->Reset(Local<Function>::Cast(value));
  
  dispatch_queue_t q = dispatch_queue_create_with_target(DISPATCH_CURRENT_QUEUE_LABEL, nullptr, nullptr);
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui addTargetClosureWithClosure:^(UIButton*){
        dispatch_sync(q, ^ {
          sweetiekit::Resolve(nui->_callback);
        });
      }];
    });
  }
}

NAN_METHOD(NUIButton::setTitleColorForState) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);
  
  @autoreleasepool {
    double r = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("red")));
    double g = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("green")));
    double b = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("blue")));
    double a = JS_HAS(JS_OBJ(info[0]), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("alpha"))) : 1.0;

    UIControlState state = UIControlState(TO_UINT32(info[1]));

    [ui setTitleColor:[[UIColor alloc] initWithRed:r green:g blue:b alpha:a] forState:state];
  }
}

NAN_METHOD(NUIButton::setTitleForState) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);

  @autoreleasepool {
    NSString *title = NJSStringToNSString(info[0]);
    UIControlState state = UIControlState(TO_UINT32(info[1]));

    [ui setTitle:title forState:state];
  }
}

NAN_GETTER(NUIButton::titleLabelGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIButton, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui titleLabel], NUILabel::type));
}

NAN_GETTER(NUIButton::titleEdgeInsetsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("top"), JS_NUM([ui titleEdgeInsets].top));
  result->Set(JS_STR("bottom"), JS_NUM([ui titleEdgeInsets].bottom));
  result->Set(JS_STR("left"), JS_NUM([ui titleEdgeInsets].left));
  result->Set(JS_STR("right"), JS_NUM([ui titleEdgeInsets].right));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NUIButton::titleEdgeInsetsSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);
  
  @autoreleasepool {
    double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("bottom")));
    double t = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("top")));
    double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("right")));
    double l = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("left")));
    [ui setTitleEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
  }
}

NAN_GETTER(NUIButton::contentEdgeInsetsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("top"), JS_NUM([ui contentEdgeInsets].top));
  result->Set(JS_STR("bottom"), JS_NUM([ui contentEdgeInsets].bottom));
  result->Set(JS_STR("left"), JS_NUM([ui contentEdgeInsets].left));
  result->Set(JS_STR("right"), JS_NUM([ui contentEdgeInsets].right));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NUIButton::contentEdgeInsetsSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);
  
  @autoreleasepool {
    double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("bottom")));
    double t = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("top")));
    double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("right")));
    double l = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("left")));
    [ui setContentEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
  }
}

NAN_GETTER(NUIButton::imageEdgeInsetsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("top"), JS_NUM([ui imageEdgeInsets].top));
  result->Set(JS_STR("bottom"), JS_NUM([ui imageEdgeInsets].bottom));
  result->Set(JS_STR("left"), JS_NUM([ui imageEdgeInsets].left));
  result->Set(JS_STR("right"), JS_NUM([ui imageEdgeInsets].right));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NUIButton::imageEdgeInsetsSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);
  
  @autoreleasepool {
    double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("bottom")));
    double t = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("top")));
    double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("right")));
    double l = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("left")));
    [ui setImageEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
  }
}

NAN_METHOD(NUIButton::setBackgroundImageForState) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIButton, ui);

  if (!info[0]->IsNullOrUndefined()) {
    JS_UNWRAPPED(info[0], UIImage, img);
    UIControlState state = UIControlState(TO_UINT32(info[1]));

    @autoreleasepool {
      [ui setBackgroundImage:img forState:state];
    }
  }
}
