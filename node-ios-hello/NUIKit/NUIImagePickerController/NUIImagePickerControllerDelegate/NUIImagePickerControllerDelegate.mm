//
//  NUIImagePickerControllerDelegate.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImagePickerControllerDelegate.h"

NUIImagePickerControllerDelegate::NUIImagePickerControllerDelegate()
: _onInfo(new Nan::Persistent<Function>())
, _onCancel(new Nan::Persistent<Function>())
{
}

NUIImagePickerControllerDelegate::~NUIImagePickerControllerDelegate()
{
  delete _onInfo;
  delete _onCancel;
}

JS_INIT_CLASS(UIImagePickerControllerDelegate, NSObject);
  // instance members (proto)
  JS_SET_PROP_READONLY(proto, "result", Result);
  JS_SET_PROP(proto, "onInfo", OnInfo);
  JS_SET_PROP(proto, "onCancel", OnCancel);
  // static members (ctor)
  JS_INIT_CTOR(UIImagePickerControllerDelegate, NSObject);
JS_INIT_CLASS_END(UIImagePickerControllerDelegate, NSObject);

NAN_METHOD(NUIImagePickerControllerDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUIImagePickerControllerDelegate *ctrl = new NUIImagePickerControllerDelegate();

  @autoreleasepool {
    ctrl->SetNSObject([[SUIImagePickerControllerDelegate alloc] init]);
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NAN_SETTER(NUIImagePickerControllerDelegate::OnInfoSetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *del = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());
  del->_onInfo->Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    SUIImagePickerControllerDelegate* d = del->As<SUIImagePickerControllerDelegate>();
    [d setOnInfoClosureWithClosure:^(UIImagePickerController * _Nonnull, NSDictionary<UIImagePickerControllerInfoKey, id> * _Nonnull) {
      Nan::HandleScope scope;
      sweetiekit::Resolve(del->_onInfo);
      return true;
    }];
  }
}


NAN_GETTER(NUIImagePickerControllerDelegate::ResultGetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *view = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());
  auto obj = [view->As<SUIImagePickerControllerDelegate>() infoResult];
  if (obj != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)obj)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(obj, NNSObject::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      info.GetReturnValue().Set(value);
  }
  

  //info.GetReturnValue().Set(Nan::New(view->_onInfo));
}

NAN_GETTER(NUIImagePickerControllerDelegate::OnInfoGetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *view = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_onInfo));
}

NAN_SETTER(NUIImagePickerControllerDelegate::OnCancelSetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *del = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());
  del->_onCancel->Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    SUIImagePickerControllerDelegate* d = del->As<SUIImagePickerControllerDelegate>();
    [d setOnCancelClosureWithClosure:^(UIImagePickerController * _Nonnull) {
      Nan::HandleScope scope;
      sweetiekit::Resolve(del->_onCancel);
      return true;
    }];
  }
}

NAN_GETTER(NUIImagePickerControllerDelegate::OnCancelGetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *view = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_onCancel));
}
