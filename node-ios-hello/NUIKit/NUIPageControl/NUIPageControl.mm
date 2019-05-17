//
//  UIPageControl.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NUIControl.h"
#include "NUIPageControl.h"

Nan::Persistent<FunctionTemplate> NUIPageControl::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIPageControl::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIPageControl"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, currentPage);
  JS_ASSIGN_PROP(proto, numberOfPages);
  JS_ASSIGN_PROP(proto, pageIndicatorTintColor);
  JS_ASSIGN_PROP(proto, currentPageIndicatorTintColor);
  Nan::SetMethod(proto, "sizeForNumberOfPages", sizeForNumberOfPages);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIPageControl::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIPageControl *ui = new NUIPageControl();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIPageControl *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
      double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
      double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
      ui->SetNSObject([[UIPageControl alloc] initWithFrame:CGRectMake(x, y, width, height)]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIPageControl alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIPageControl::NUIPageControl () {}
NUIPageControl::~NUIPageControl () {}

NAN_GETTER(NUIPageControl::numberOfPagesGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  __block double numPages = 0;
  
  @autoreleasepool {
    numPages = [ui numberOfPages];
  }
  
  JS_SET_RETURN(JS_NUM(numPages));
}

NAN_SETTER(NUIPageControl::numberOfPagesSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  @autoreleasepool {
    uint32_t numPages = TO_INT32(value);
    [ui setNumberOfPages:numPages];
  }
}

NAN_GETTER(NUIPageControl::currentPageGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  __block double currPage = 0;
  
  @autoreleasepool {
    currPage = [ui numberOfPages];
  }
  
  JS_SET_RETURN(JS_NUM(currPage));
}

NAN_SETTER(NUIPageControl::currentPageSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  @autoreleasepool {
    double currPage = TO_DOUBLE(value);
    [ui setCurrentPage:currPage];
  }
}

NAN_GETTER(NUIPageControl::pageIndicatorTintColorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  __block double r = 0;
  __block double g = 0;
  __block double b = 0;
  __block double a = 0;
  
  @autoreleasepool {
    [[ui pageIndicatorTintColor] getRed:&r green:&g blue:&b alpha:&a];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(r));
  result->Set(JS_STR("green"), JS_NUM(g));
  result->Set(JS_STR("blue"), JS_NUM(b));
  result->Set(JS_STR("alpha"), JS_NUM(a));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIPageControl::pageIndicatorTintColorSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  @autoreleasepool {
    double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
    double g = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
    double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
    double a = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
    UIColor *color = [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
    [ui setPageIndicatorTintColor:color];
  }
}

NAN_GETTER(NUIPageControl::currentPageIndicatorTintColorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  __block double r = 0;
  __block double g = 0;
  __block double b = 0;
  __block double a = 0;
  
  @autoreleasepool {
    [[ui currentPageIndicatorTintColor] getRed:&r green:&g blue:&b alpha:&a];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(r));
  result->Set(JS_STR("green"), JS_NUM(g));
  result->Set(JS_STR("blue"), JS_NUM(b));
  result->Set(JS_STR("alpha"), JS_NUM(a));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIPageControl::currentPageIndicatorTintColorSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);
  
  @autoreleasepool {
    double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
    double g = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
    double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
    double a = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
    UIColor *color = [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
    [ui setCurrentPageIndicatorTintColor:color];
  }
}

NAN_METHOD(NUIPageControl::sizeForNumberOfPages) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIPageControl, ui);

  __block CGSize size;

  @autoreleasepool {
    double numPages = TO_DOUBLE(info[0]);
    size = [ui sizeForNumberOfPages:numPages];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_NUM(size.width));
  result->Set(JS_STR("height"), JS_NUM(size.height));
  
  JS_SET_RETURN(result);
}
