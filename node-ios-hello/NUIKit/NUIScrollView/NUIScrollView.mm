//
//  NUIScrollView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITableView.h"
#include "NUIView.h"
#include "NUIScrollView.h"
#include "NUIScrollViewDelegate.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIScrollView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIScrollView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIScrollView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, contentSize);
  JS_ASSIGN_PROP_READONLY(proto, contentOffset);
  Nan::SetMethod(proto, "setContentOffset", setContentOffset);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NUIScrollView::NUIScrollView () {}
NUIScrollView::~NUIScrollView () {}

NAN_METHOD(NUIScrollView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIScrollView *scrollView = new NUIScrollView();

  if (info[0]->IsExternal()) {
    scrollView->SetNSObject((__bridge UIScrollView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
      double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
      double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
      CGRect frame = CGRectMake(x, y, width, height);
      scrollView->SetNSObject([[UIScrollView alloc] initWithFrame:frame]);
    }
  } else {
    scrollView->SetNSObject([[UIScrollView alloc] init]);
  }

  scrollView->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NUIScrollView::setContentOffset) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIScrollView, ui);
  
  @autoreleasepool {
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    BOOL animated = TO_BOOL(info[1]);
    [ui setContentOffset:CGPointMake(x, y) animated:animated];
  }
}

NAN_GETTER(NUIScrollView::delegateGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NUIScrollView::delegateGetter not yet implemented");
}

NAN_SETTER(NUIScrollView::delegateSetter) {
  Nan::HandleScope scope;
  
  NUIScrollView *view = ObjectWrap::Unwrap<NUIScrollView>(info.This());
  NUIScrollViewDelegate *del = ObjectWrap::Unwrap<NUIScrollViewDelegate>(Local<Object>::Cast(value));

  auto delegate = del->As<SUIScrollViewDelegate>();
  view->_delegate.Reset(value);

  @autoreleasepool {
    auto ui = view->As<UIScrollView>();
    [ui associateValue:delegate withKey:@"sweetiekit.delegate"];
    [ui setDelegate:delegate];
  }
}

NAN_GETTER(NUIScrollView::contentOffsetGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIScrollView, ui);

  __block CGPoint offset;

  @autoreleasepool {
    offset = [ui contentOffset];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(offset.x));
  result->Set(JS_STR("y"), JS_NUM(offset.y));
  
  JS_SET_RETURN(result);
}

NAN_GETTER(NUIScrollView::contentSizeGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIScrollView, ui);

  __block CGSize size;

  @autoreleasepool {
    size = [ui contentSize];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_NUM(size.width));
  result->Set(JS_STR("height"), JS_NUM(size.height));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NUIScrollView::contentSizeSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIScrollView, ui);

  @autoreleasepool {
    double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
    [ui setContentSize:CGSizeMake(width, height)];
  }
}
