//
//  UIPopoverPresentationControllerDelegate.mm
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPopoverPresentationControllerDelegate.h"

NUIPopoverPresentationControllerDelegate::NUIPopoverPresentationControllerDelegate() {}
NUIPopoverPresentationControllerDelegate::~NUIPopoverPresentationControllerDelegate() {}

JS_INIT_CLASS(UIPopoverPresentationControllerDelegate, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, adaptivePresentationStyle);
  // static members (ctor)
  JS_INIT_CTOR(UIPopoverPresentationControllerDelegate, NSObject);
JS_INIT_CLASS_END(UIPopoverPresentationControllerDelegate, NSObject);

NAN_METHOD(NUIPopoverPresentationControllerDelegate::New) {
  JS_RECONSTRUCT(UIPopoverPresentationControllerDelegate);

  Local<Object> obj = info.This();

  NUIPopoverPresentationControllerDelegate *ui = new NUIPopoverPresentationControllerDelegate();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SUIPopoverPresentationControllerDelegate *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SUIPopoverPresentationControllerDelegate alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

#include "NUIPresentationController.h"

NAN_GETTER(NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleGetter) {
  Nan::HandleScope scope;
  
  NUIPopoverPresentationControllerDelegate *del = ObjectWrap::Unwrap<NUIPopoverPresentationControllerDelegate>(info.This());
  
  Nan::ThrowError("NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleGetter not implemented");
}

NAN_SETTER(NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleSetter) {
  Nan::EscapableHandleScope scope;
  
  NUIPopoverPresentationControllerDelegate *del = ObjectWrap::Unwrap<NUIPopoverPresentationControllerDelegate>(info.This());
  SUIPopoverPresentationControllerDelegate *sDel = del->As<SUIPopoverPresentationControllerDelegate>();

  del->_adaptivePresentationStyle.Reset(Local<Function>::Cast(value));

  [sDel setAdaptivePresentationStyle: ^ UIModalPresentationStyle (UIPresentationController * _Nonnull controller) {
    Nan::HandleScope scope;
    
    Local<Value> ctrlObj = sweetiekit::GetWrapperFor(controller, NUIPresentationController::type);
    Local<Value> resultVal = del->_adaptivePresentationStyle("NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleSetter", ctrlObj);
    int res = resultVal->IsNumber() ? TO_UINT32(resultVal) : 0;

    return UIModalPresentationNone;
  }];
}
