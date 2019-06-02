//
//  UIScrollViewDelegate.mm
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIScrollViewDelegate.h"

NUIScrollViewDelegate::NUIScrollViewDelegate() {}
NUIScrollViewDelegate::~NUIScrollViewDelegate() {}

JS_INIT_CLASS(UIScrollViewDelegate, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, didScroll);
  JS_ASSIGN_PROP(proto, willBeginDecelerating);
  JS_ASSIGN_PROP(proto, didEndDecelerating);
  JS_ASSIGN_PROP(proto, didScrollToTop);
  JS_ASSIGN_PROP(proto, shouldScrollToTop);
  JS_ASSIGN_PROP(proto, didEndDragging);
  // static members (ctor)
  JS_INIT_CTOR(UIScrollViewDelegate, NSObject);
JS_INIT_CLASS_END(UIScrollViewDelegate, NSObject);

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

#include "NUIScrollView.h"

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

NAN_GETTER(NUIScrollViewDelegate::didEndDraggingGetter) {
  Nan::HandleScope scope;

  Nan::ThrowError("NUIScrollViewDelegate::didEndDraggingGetter not yet implemented");
}

NAN_SETTER(NUIScrollViewDelegate::didEndDraggingSetter) {
  Nan::EscapableHandleScope scope;

  NUIScrollViewDelegate *del = ObjectWrap::Unwrap<NUIScrollViewDelegate>(info.This());
  SUIScrollViewDelegate* sDel = del->As<SUIScrollViewDelegate>();

  del->_didEndDragging.Reset(Local<Function>::Cast(value));

  [sDel setDidEndDragging: ^ (UIScrollView * _Nonnull scrollView, BOOL decelerate) {
    Nan::HandleScope scope;
    Local<Value> scrollViewObj = sweetiekit::GetWrapperFor(scrollView, NUIScrollView::type);
    del->_didEndDragging("NUIScrollViewDelegate::didEndDraggingSetter", scrollViewObj);
  }];
}
