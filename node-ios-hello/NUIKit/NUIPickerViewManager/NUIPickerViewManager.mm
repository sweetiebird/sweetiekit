//
//  UIPickerViewManager.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUIPickerViewManager.h"
#include "NUIPickerView.h"
#include "NNSAttributedString.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIPickerViewManager::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIPickerViewManager::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIPickerViewManager"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, titleForRow);
  JS_ASSIGN_PROP(proto, didSelectRow);
  JS_ASSIGN_PROP(proto, attributedTitleForRow);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIPickerViewManager::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIPickerViewManager *mgr = new NUIPickerViewManager();

  if (info[0]->IsExternal()) {
    mgr->SetNSObject((__bridge SUIPickerViewManager *)(info[0].As<External>()->Value()));
  } else if (info.Length() == 2) {
    mgr->_numberComponents.Reset(Local<Function>::Cast(info[0]));
    mgr->_numberRowsInComponent.Reset(Local<Function>::Cast(info[1]));

    @autoreleasepool {
      mgr->SetNSObject([[SUIPickerViewManager alloc] initWithNumberComponents: ^ NSInteger (UIPickerView * _Nonnull pickerView) {
        Nan::HandleScope scope;
        Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
        Local<Value> resultVal = mgr->_numberComponents("NUIPickerViewManager::New",
            pickerObj);
        int result = resultVal->IsNumber() ? TO_INT32(resultVal) : 1;
        return result;
      } numberRows: ^ NSInteger (UIPickerView * _Nonnull pickerView, NSInteger component) {
        Nan::HandleScope scope;
        Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
        Local<Value> resultVal = mgr->_numberRowsInComponent("NUIPickerViewManager::New",
            pickerObj, JS_NUM(component));
        int result = resultVal->IsNumber() ? TO_INT32(resultVal) : 1;
        return result;
      }]);
    }
  } else {
    Nan::ThrowError("UIPickerViewManager has two required callback functions");
  }
  mgr->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIPickerViewManager::NUIPickerViewManager () {}
NUIPickerViewManager::~NUIPickerViewManager () {}

NAN_GETTER(NUIPickerViewManager::titleForRowGetter) {
  Nan::HandleScope scope;
  Nan::ThrowError("NUIPickerViewManager::titleForRowGetter not yet implemented");
}

NAN_SETTER(NUIPickerViewManager::titleForRowSetter) {
  Nan::HandleScope scope;
  
  NUIPickerViewManager *mgr = ObjectWrap::Unwrap<NUIPickerViewManager>(info.This());
  SUIPickerViewManager* sMgr = mgr->As<SUIPickerViewManager>();

  mgr->_titleForRow.Reset(Local<Function>::Cast(value));
  
  [sMgr setTitleForRow: ^ NSString * _Nullable (UIPickerView * _Nonnull pickerView, NSInteger row, NSInteger component) {
    Nan::HandleScope scope;
    Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
    Local<Value> resultVal = mgr->_titleForRow("NUIScrollViewDelegate::didScrollSetter", pickerObj, JS_NUM(row), JS_NUM(component));
    NSString *result = resultVal->IsString() ? NJSStringToNSString(resultVal) : nullptr;
    return result;
  }];
}

NAN_GETTER(NUIPickerViewManager::didSelectRowGetter) {
  Nan::HandleScope scope;
  Nan::ThrowError("NUIPickerViewManager::didSelectRowGetter not yet implemented");
}

NAN_SETTER(NUIPickerViewManager::didSelectRowSetter) {
  Nan::HandleScope scope;
  
  NUIPickerViewManager *mgr = ObjectWrap::Unwrap<NUIPickerViewManager>(info.This());
  SUIPickerViewManager* sMgr = mgr->As<SUIPickerViewManager>();

  mgr->_didSelectRow.Reset(Local<Function>::Cast(value));
  
  [sMgr setDidSelectRow: ^ (UIPickerView * _Nonnull pickerView, NSInteger row, NSInteger component) {
    Nan::HandleScope scope;
    Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
    mgr->_didSelectRow("NUIScrollViewDelegate::didSelectRowSetter", pickerObj, JS_NUM(row), JS_NUM(component));
  }];
}

NAN_GETTER(NUIPickerViewManager::attributedTitleForRowGetter) {
  Nan::HandleScope scope;
  Nan::ThrowError("NUIPickerViewManager::attributedTitleForRowGetter not yet implemented");
}

NAN_SETTER(NUIPickerViewManager::attributedTitleForRowSetter) {
  Nan::HandleScope scope;
  
  NUIPickerViewManager *mgr = ObjectWrap::Unwrap<NUIPickerViewManager>(info.This());
  SUIPickerViewManager* sMgr = mgr->As<SUIPickerViewManager>();

  mgr->_titleForRow.Reset(Local<Function>::Cast(value));
  
  [sMgr setAttributedTitleForRow: ^ NSAttributedString * _Nullable (UIPickerView * _Nonnull pickerView, NSInteger row, NSInteger component) {
    Nan::HandleScope scope;
    Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
    Local<Value> result = mgr->_attributedTitleForRow("NUIPickerViewManager::attributedTitleForRowSetter", pickerObj, JS_NUM(row), JS_NUM(component));
    JS_UNWRAPPED(JS_OBJ(result), NSAttributedString, attrString);
    return attrString;
  }];
}
