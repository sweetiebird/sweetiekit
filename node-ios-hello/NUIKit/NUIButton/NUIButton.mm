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
  Nan::SetAccessor(proto, JS_STR("title"), TitleGetter, TitleSetter);
  Nan::SetAccessor(proto, JS_STR("callback"), CallbackGetter, CallbackSetter);

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
  }
  
  btn->Wrap(btnObj);

  info.GetReturnValue().Set(btnObj);
}

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
    }
    label = [NSString stringWithUTF8String:str.c_str()];
  }
  
  double x = TO_DOUBLE(info[1]);
  double y = TO_DOUBLE(info[2]);
  double width = TO_DOUBLE(info[3]);
  double height = TO_DOUBLE(info[4]);

  Nan::Persistent<Promise::Resolver>* pResolver = new Nan::Persistent<Promise::Resolver>(resolver);
  Nan::Persistent<Object>* pBtnObj = new Nan::Persistent<Object>(btnObj);
  
  if (info[5]->IsFunction()) {
    btn->_callback->Reset(Local<Function>::Cast(info[5]));
  }
  
  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
      btn->SetNSObject([[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)]);
      [btn->As<UIButton>() setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [btn->As<UIButton>() setTitle:label forState:UIControlStateNormal];
      [btn->As<UIButton>() addTargetClosureWithClosure:^(UIButton*){
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

  info.GetReturnValue().Set(scope.Escape(resolver->GetPromise()));
}

NAN_GETTER(NUIButton::TitleGetter) {
  Nan::HandleScope scope;

  NUIButton *view = ObjectWrap::Unwrap<NUIButton>(info.This());
  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [view->As<UIButton>() currentTitle];
    });
  }

  if (str != nullptr) {
    auto result = JS_STR([str UTF8String]);
    info.GetReturnValue().Set(result);
  }
  
}

NAN_SETTER(NUIButton::TitleSetter) {
  Nan::HandleScope scope;

  NUIButton *btn = ObjectWrap::Unwrap<NUIButton>(info.This());

  std::string title;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    title = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [btn->As<UIButton>() setTitle:[NSString stringWithUTF8String:title.c_str()] forState:[btn->As<UIButton>() state]];
    });
  }
}

const CGRect& NUIButton::GetFrame() {
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      auto frame = [As<UIButton>() frame];
      this->_rect.origin.x = frame.origin.x;
      this->_rect.origin.y = frame.origin.y;
      this->_rect.size.width = frame.size.width;
      this->_rect.size.height = frame.size.height;
    });
    return this->_rect;
  }
}

NAN_GETTER(NUIButton::CallbackGetter) {
  Nan::HandleScope scope;

  NUIButton *view = ObjectWrap::Unwrap<NUIButton>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_callback));
}

NAN_SETTER(NUIButton::CallbackSetter) {
  Nan::HandleScope scope;

  NUIButton *field = ObjectWrap::Unwrap<NUIButton>(info.This());
  field->_callback->Reset(Local<Function>::Cast(value));
  
  dispatch_queue_t q = dispatch_queue_create_with_target(DISPATCH_CURRENT_QUEUE_LABEL, nullptr, nullptr);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIButton* txt = field->As<UIButton>();
      [txt addTargetClosureWithClosure:^(UIButton*){
        dispatch_sync(q, ^ {
          sweetiekit::Resolve(field->_callback);
        });
      }];
    });
  }
}

NUIButton::NUIButton () : _callback(new Nan::Persistent<Function>()) {}
NUIButton::~NUIButton () { delete _callback; }
