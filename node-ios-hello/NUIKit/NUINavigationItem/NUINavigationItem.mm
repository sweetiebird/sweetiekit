//
//  UINavigationItem.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NUIView.h"
#include "NUINavigationItem.h"
#include "NUIBarButtonItem.h"

Nan::Persistent<FunctionTemplate> NUINavigationItem::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUINavigationItem::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UINavigationItem"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "initWithTitle", initWithTitle);
  JS_ASSIGN_PROP(proto, title);
  JS_ASSIGN_PROP(proto, backBarButtonItem);
  JS_ASSIGN_PROP(proto, titleView);
  JS_ASSIGN_PROP(proto, prompt);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUINavigationItem::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUINavigationItem *ui = new NUINavigationItem();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UINavigationItem *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UINavigationItem alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUINavigationItem::NUINavigationItem () {}
NUINavigationItem::~NUINavigationItem () {}

NAN_METHOD(NUINavigationItem::initWithTitle) {
  Nan::EscapableHandleScope scope;
  
  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUINavigationItem)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUINavigationItem *ui = ObjectWrap::Unwrap<NUINavigationItem>(obj);

  @autoreleasepool {
    NSString *title = NJSStringToNSString(info[0]);
    ui->SetNSObject([[UINavigationItem alloc] initWithTitle:title]);
  }

  JS_SET_RETURN(obj);
}

NAN_GETTER(NUINavigationItem::titleGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  auto result = JS_STR([[ui title] UTF8String]);
  JS_SET_RETURN(result);
}

NAN_SETTER(NUINavigationItem::titleSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  std::string title;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    title = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  @autoreleasepool {
    [ui setTitle:[NSString stringWithUTF8String:title.c_str()]];
  }
}

NAN_GETTER(NUINavigationItem::backBarButtonItemGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui backBarButtonItem], NUIBarButtonItem::type)));
}

NAN_SETTER(NUINavigationItem::backBarButtonItemSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  NUIBarButtonItem *itemObj = ObjectWrap::Unwrap<NUIBarButtonItem>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setBackBarButtonItem:itemObj->As<UIBarButtonItem>()];
  }
}

NAN_GETTER(NUINavigationItem::titleViewGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui titleView], NUIView::type)));
}

NAN_SETTER(NUINavigationItem::titleViewSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  NUIView *itemObj = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setTitleView:itemObj->As<UIView>()];
  }
}

NAN_GETTER(NUINavigationItem::promptGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  auto result = JS_STR([[ui prompt] UTF8String]);
  JS_SET_RETURN(result);
}

NAN_SETTER(NUINavigationItem::promptSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationItem, ui);
  
  std::string prompt;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    prompt = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  @autoreleasepool {
    [ui setTitle:[NSString stringWithUTF8String:prompt.c_str()]];
  }
}
