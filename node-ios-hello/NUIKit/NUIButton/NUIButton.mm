//
//  NUIButton.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIButton.h"
#include "NUIControl.h"
#include "NUILabel.h"

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
  Nan::SetMethod(proto, "setTitleColorForState", setTitleColorForState);
  Nan::SetMethod(proto, "setTitleForState", setTitleForState);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "alloc", Alloc);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIButton::New) {
  Nan::HandleScope scope;

  Local<Object> btnObj = info.This();

  NUIButton *btn = new NUIButton();
  
  if (info[0]->IsExternal()) {
    btn->SetNSObject((__bridge UIButton *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      btn->SetNSObject([[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)]);
    }
  } else {
    @autoreleasepool {
      btn->SetNSObject([[UIButton alloc] init]);
    }
  }
  
  btn->Wrap(btnObj);

  JS_SET_RETURN(btnObj);
}

NUIButton::NUIButton () : _callback(new Nan::Persistent<Function>()) {}
NUIButton::~NUIButton () { delete _callback; }

NAN_METHOD(NUIButton::Alloc) {
  Nan::EscapableHandleScope scope;
  auto resolver = Promise::Resolver::New(JS_CONTEXT()).ToLocalChecked();
  
  Local<Value> argv[] = {
  };
  Local<Object> btnObj = JS_TYPE(NUIButton)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIButton *btn = ObjectWrap::Unwrap<NUIButton>(btnObj);

  NSString* label = nullptr;
  {
    std::string str;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      str = *utf8Value;
    } else {
      Nan::ThrowError("info[0] isn't a string");
      return;
    }
    label = [NSString stringWithUTF8String:str.c_str()];
  }
  
  double x = TO_DOUBLE(info[1]);
  double y = TO_DOUBLE(info[2]);
  double width = TO_DOUBLE(info[3]);
  double height = TO_DOUBLE(info[4]);

  if (info[5]->IsFunction()) {
    btn->_callback->Reset(Local<Function>::Cast(info[5]));
  }
  
#if SYNC
  Nan::Persistent<Promise::Resolver>* pResolver = new Nan::Persistent<Promise::Resolver>(resolver);
  Nan::Persistent<Object>* pBtnObj = new Nan::Persistent<Object>(btnObj);
  
  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
      btn->SetNSObject([[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)]);
      [btn->As<UIButton>() setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [btn->As<UIButton>() setTitle:label forState:UIControlStateNormal];
      [btn->As<UIButton>() addTargetClosureWithClosure:^(UIButton*){
        Nan::HandleScope scope;
        sweetiekit::Resolve(btn->_callback);
      }];
     {
        std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([pResolver, pBtnObj]() -> void {
          Local<Promise::Resolver> res = Nan::New(*pResolver);
          Local<Object> obj = Nan::New(*pBtnObj);
          res->Resolve(JS_CONTEXT(), obj);
          sweetiekit::Kick();
          delete pBtnObj;
          delete pResolver;
      });
    }
    uv_async_send(&sweetiekit::resAsync);

    });
  }
  JS_SET_RETURN(scope.Escape(resolver->GetPromise()));
#else
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      btn->SetNSObject([[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)]);
      [btn->As<UIButton>() setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [btn->As<UIButton>() setTitle:label forState:UIControlStateNormal];
      btn->Ref();
      [btn->As<UIButton>() addTargetClosureWithClosure:^(UIButton*){
        Nan::HandleScope scope;
        sweetiekit::Resolve(btn->_callback);
      }];
    });
  }
  JS_SET_RETURN(btnObj);
#endif
}

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
