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

Nan::Persistent<FunctionTemplate> NUIButton::type;

Local<Object> NUIButton::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIButton"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("frame"), FrameGetter, FrameSetter);
  
  Local<Function> ctorFn = JS_FUNC(ctor);

  Nan::SetMethod(ctorFn, "alloc", Alloc);

  
  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIButton::New) {
  Nan::HandleScope scope;

  Local<Object> btnObj = info.This();

  NUIButton *btn = new NUIButton();
  btn->me = nullptr;

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
  
  Nan::Persistent<Function>* cb = new Nan::Persistent<Function>(Local<Function>::Cast(info[5]));
  
  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
      btn->me = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
      [btn->me assignAssociatedWrapperWithPtr:btn forKey:@"sweetiekit.wrapper"];
      [btn->me setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [btn->me setTitle:label forState:UIControlStateNormal];
      [btn->me addTargetClosureWithClosure:^(UIButton*){
        sweetiekit::Resolve(cb);
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

NAN_GETTER(NUIButton::FrameGetter) {
  Nan::HandleScope scope;

  NUIButton *view = ObjectWrap::Unwrap<NUIButton>(info.This());
  Local<Object> result = Object::New(Isolate::GetCurrent());
  auto frame = view->GetFrame();
  result->Set(JS_STR("width"), JS_FLOAT(frame.size.width));
  result->Set(JS_STR("height"), JS_FLOAT(frame.size.height));
  result->Set(JS_STR("x"), JS_FLOAT(frame.origin.x));
  result->Set(JS_STR("y"), JS_FLOAT(frame.origin.y));
  
  info.GetReturnValue().Set(result);
}

NAN_SETTER(NUIButton::FrameSetter) {
  Nan::HandleScope scope;

  NUIButton *btn = ObjectWrap::Unwrap<NUIButton>(info.This());

  double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
  double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [btn->me frame] = CGRectMake(x, y, width, height);
    });
  }
}

const CGRect& NUIButton::GetFrame() {
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      auto frame = [me frame];
      this->_rect.origin.x = frame.origin.x;
      this->_rect.origin.y = frame.origin.y;
      this->_rect.size.width = frame.size.width;
      this->_rect.size.height = frame.size.height;
    });
    return this->_rect;
  }
}

Local<Object> makeUIButton() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIButton::Initialize(isolate));
}

NUIButton::NUIButton () {}
NUIButton::~NUIButton () {}
