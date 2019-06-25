//
//  UIPickerViewManager.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPickerViewManager.h"

NUIPickerViewManager::NUIPickerViewManager() {}
NUIPickerViewManager::~NUIPickerViewManager() {}

JS_INIT_CLASS(UIPickerViewManager, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, titleForRow);
  JS_ASSIGN_PROP(proto, didSelectRow);
  JS_ASSIGN_PROP(proto, attributedTitleForRow);
  // static members (ctor)
  JS_INIT_CTOR(UIPickerViewManager, NSObject);
JS_INIT_CLASS_END(UIPickerViewManager, NSObject);

#include "NUIPickerView.h"

NAN_METHOD(NUIPickerViewManager::New) {
  JS_RECONSTRUCT(UIPickerViewManager);

  Local<Object> obj = info.This();

  NUIPickerViewManager *mgr = new NUIPickerViewManager();

  if (info[0]->IsExternal()) {
    mgr->SetNSObject((__bridge SUIPickerViewManager *)(info[0].As<External>()->Value()));
  } else if (info.Length() == 2) {
    mgr->_numberComponents.Reset(Local<Function>::Cast(info[0]));
    mgr->_numberRowsInComponent.Reset(Local<Function>::Cast(info[1]));

    @autoreleasepool {
      mgr->SetNSObject([[SUIPickerViewManager alloc] initWithNumberComponents: ^ NSInteger (UIPickerView * _Nonnull pickerView) {
        __block NSInteger result = 1;
        dispatch_main(^{
          Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
          Local<Value> resultVal = mgr->_numberComponents("NUIPickerViewManager::New",
              pickerObj);
          result = resultVal->IsNumber() ? TO_INT32(resultVal) : result;
        });
        return result;
      } numberRows: ^ NSInteger (UIPickerView * _Nonnull pickerView, NSInteger component) {
        __block NSInteger result = 1;
        dispatch_main(^{
          Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
          Local<Value> resultVal = mgr->_numberRowsInComponent("NUIPickerViewManager::New",
              pickerObj, JS_NUM(component));
          result = resultVal->IsNumber() ? TO_INT32(resultVal) : result;
        });
        return result;
      }]);
    }
  } else {
    Nan::ThrowError("UIPickerViewManager has two required callback functions");
  }
  mgr->Wrap(obj);

  JS_SET_RETURN(obj);
}

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
    __block NSString* result = nil;
    dispatch_main(^{
      Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
      Local<Value> resultVal = mgr->_titleForRow("NUIScrollViewDelegate::didScrollSetter", pickerObj, JS_NUM(row), JS_NUM(component));
      result = resultVal->IsString() ? NJSStringToNSString(resultVal) : result;
    });
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
    dispatch_main(^{
      Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
      mgr->_didSelectRow("NUIScrollViewDelegate::didSelectRowSetter", pickerObj, JS_NUM(row), JS_NUM(component));
    });
  }];
}

#include "NNSAttributedString.h"

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
    __block NSAttributedString* result = nil;
    dispatch_main(^{
      Local<Value> pickerObj = sweetiekit::GetWrapperFor(pickerView, NUIPickerView::type);
      Local<Value> resultVal = mgr->_attributedTitleForRow("NUIPickerViewManager::attributedTitleForRowSetter", pickerObj, JS_NUM(row), JS_NUM(component));
      JS_UNWRAPPED(JS_OBJ(resultVal), NSAttributedString, attrString);
      result = attrString;
    });
    return result;
  }];
}
