//
//  UIPickerView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NUIView.h"
#include "NUIPickerView.h"
#include "NUIPickerViewManager.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIPickerView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIPickerView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIPickerView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, dataSource);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIPickerView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIPickerView *ui = new NUIPickerView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIPickerView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      ui->SetNSObject([[UIPickerView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIPickerView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIPickerView::NUIPickerView () {}
NUIPickerView::~NUIPickerView () {}

NAN_GETTER(NUIPickerView::delegateGetter) {
  Nan::HandleScope scope;
  Nan::ThrowError("NUIPickerView::delegateGetter not yet implemented");
}

NAN_SETTER(NUIPickerView::delegateSetter) {
  Nan::HandleScope scope;

  NUIPickerView *view = ObjectWrap::Unwrap<NUIPickerView>(info.This());
  NUIPickerViewManager *del = ObjectWrap::Unwrap<NUIPickerViewManager>(Local<Object>::Cast(value));

  auto delegate = del->As<SUIPickerViewManager>();
  view->_delegate.Reset(value);

  @autoreleasepool {
    auto ui = view->As<UIPickerView>();
    [ui associateValue:delegate withKey:@"sweetiekit.pickerview.delegate"];
    [ui setDelegate:delegate];
  }
}

NAN_GETTER(NUIPickerView::dataSourceGetter) {
  Nan::HandleScope scope;
  Nan::ThrowError("NUIPickerView::dataSourceGetter not yet implemented");
}

NAN_SETTER(NUIPickerView::dataSourceSetter) {
  Nan::HandleScope scope;

  NUIPickerView *view = ObjectWrap::Unwrap<NUIPickerView>(info.This());
  NUIPickerViewManager *del = ObjectWrap::Unwrap<NUIPickerViewManager>(Local<Object>::Cast(value));

  auto delegate = del->As<SUIPickerViewManager>();
  view->_dataSource.Reset(value);

  @autoreleasepool {
    auto ui = view->As<UIPickerView>();
    [ui associateValue:delegate withKey:@"sweetiekit.pickerview.datasource"];
    [ui setDataSource:delegate];
  }
}