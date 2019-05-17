//
//  UIScrollViewDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUIScrollViewDelegate.h"
#include "NUIScrollView.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIScrollViewDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIScrollViewDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIScrollViewDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, didScroll);
  JS_ASSIGN_PROP(proto, willBeginDecelerating);
  JS_ASSIGN_PROP(proto, didEndDecelerating);
  JS_ASSIGN_PROP(proto, didScrollToTop);
  JS_ASSIGN_PROP(proto, shouldScrollToTop);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIScrollViewDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIScrollViewDelegate *ui = new NUIScrollViewDelegate();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SUIScrollViewDelegate *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SUIScrollViewDelegate alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIScrollViewDelegate::NUIScrollViewDelegate () {}
NUIScrollViewDelegate::~NUIScrollViewDelegate () {}

NAN_GETTER(NUIScrollViewDelegate::didScrollGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NUIScrollViewDelegate::didScrollGetter not yet implemented");
}

NAN_SETTER(NUIScrollViewDelegate::didScrollSetter) {
  Nan::EscapableHandleScope scope;

  NUIScrollViewDelegate *del = ObjectWrap::Unwrap<NUIScrollViewDelegate>(info.This());
  SUIScrollViewDelegate* sDel = del->As<SUIScrollViewDelegate>();

  del->_didScroll.Reset(Local<Function>::Cast(value));
  
  [sDel setDidScroll: ^ (UIScrollView * _Nonnull scrollView) {
    Nan::HandleScope scope;
    Local<Value> scrollViewObj = sweetiekit::GetWrapperFor(scrollView, NUIScrollView::type);
    del->_didScroll("NUIScrollViewDelegate::didScrollSetter", scrollViewObj);
  }];
}

NAN_GETTER(NUIScrollViewDelegate::didEndDeceleratingGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NUIScrollViewDelegate::didScrollGetter not yet implemented");
}

NAN_SETTER(NUIScrollViewDelegate::didEndDeceleratingSetter) {
  Nan::EscapableHandleScope scope;

  NUIScrollViewDelegate *del = ObjectWrap::Unwrap<NUIScrollViewDelegate>(info.This());
  SUIScrollViewDelegate* sDel = del->As<SUIScrollViewDelegate>();

  del->_didEndDecelerating.Reset(Local<Function>::Cast(value));
  
  [sDel setDidEndDecelerating: ^ (UIScrollView * _Nonnull scrollView) {
    Nan::HandleScope scope;
    Local<Value> scrollViewObj = sweetiekit::GetWrapperFor(scrollView, NUIScrollView::type);
    del->_didEndDecelerating("NUIScrollViewDelegate::didEndDeceleratingSetter", scrollViewObj);
  }];
}

NAN_GETTER(NUIScrollViewDelegate::didScrollToTopGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NUIScrollViewDelegate::didScrollToTopGetter not yet implemented");
}

NAN_SETTER(NUIScrollViewDelegate::didScrollToTopSetter) {
  Nan::EscapableHandleScope scope;

  NUIScrollViewDelegate *del = ObjectWrap::Unwrap<NUIScrollViewDelegate>(info.This());
  SUIScrollViewDelegate* sDel = del->As<SUIScrollViewDelegate>();

  del->_didScrollToTop.Reset(Local<Function>::Cast(value));
  
  [sDel setDidScrollToTop: ^ (UIScrollView * _Nonnull scrollView) {
    Nan::HandleScope scope;
    Local<Value> scrollViewObj = sweetiekit::GetWrapperFor(scrollView, NUIScrollView::type);
    del->_didScrollToTop("NUIScrollViewDelegate::didScrollToTopSetter", scrollViewObj);
  }];
}

NAN_GETTER(NUIScrollViewDelegate::shouldScrollToTopGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NUIScrollViewDelegate::shouldScrollToTopGetter not yet implemented");
}

NAN_SETTER(NUIScrollViewDelegate::shouldScrollToTopSetter) {
  Nan::EscapableHandleScope scope;

  NUIScrollViewDelegate *del = ObjectWrap::Unwrap<NUIScrollViewDelegate>(info.This());
  SUIScrollViewDelegate* sDel = del->As<SUIScrollViewDelegate>();

  del->_didScrollToTop.Reset(Local<Function>::Cast(value));
  
  [sDel setShouldScrollToTop: ^ BOOL (UIScrollView * _Nonnull scrollView) {
    Nan::HandleScope scope;
    Local<Value> scrollViewObj = sweetiekit::GetWrapperFor(scrollView, NUIScrollView::type);
    Local<Value> resultVal = del->_didScrollToTop("NUIScrollViewDelegate::shouldScrollToTopSetter", scrollViewObj);
    int result = resultVal->IsBoolean() ? TO_BOOL(resultVal) : true;
    return result;
  }];
}

NAN_GETTER(NUIScrollViewDelegate::willBeginDeceleratingGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NUIScrollViewDelegate::willBeginDeceleratingGetter not yet implemented");
}

NAN_SETTER(NUIScrollViewDelegate::willBeginDeceleratingSetter) {
  Nan::EscapableHandleScope scope;

  NUIScrollViewDelegate *del = ObjectWrap::Unwrap<NUIScrollViewDelegate>(info.This());
  SUIScrollViewDelegate* sDel = del->As<SUIScrollViewDelegate>();

  del->_willBeginDecelerating.Reset(Local<Function>::Cast(value));

  [sDel setWillBeginDecelerating: ^ (UIScrollView * _Nonnull scrollView) {
    Nan::HandleScope scope;
    Local<Value> scrollViewObj = sweetiekit::GetWrapperFor(scrollView, NUIScrollView::type);
    del->_willBeginDecelerating("NUIScrollViewDelegate::willBeginDeceleratingSetter", scrollViewObj);
  }];
}
