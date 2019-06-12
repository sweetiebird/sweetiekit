//
//  NUIImageView.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImageView.h"

NUIImageView::NUIImageView() {}
NUIImageView::~NUIImageView() {}

JS_INIT_CLASS(UIImageView, UIView);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, image);
  // static members (ctor)
  JS_INIT_CTOR(UIImageView, UIView);
JS_INIT_CLASS_END(UIImageView, UIView);

#include "NUIImage.h"

NAN_METHOD(NUIImageView::New) {
  JS_RECONSTRUCT(UIImageView);
  @autoreleasepool {
    UIImageView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIImageView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UIImageView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (is_value_UIImage(info[0]) && is_value_UIImage(info[1])) {
      self = [[UIImageView alloc] initWithImage:to_value_UIImage(info[0]) highlightedImage:to_value_UIImage(info[1])];
    } else if (is_value_UIImage(info[0])) {
      self = [[UIImageView alloc] initWithImage:to_value_UIImage(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIImageView alloc] init];
    }
    if (self) {
      NUIImageView *wrapper = new NUIImageView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIImageView::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIImageView::imageGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIImageView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui image], NUIImage::type));
}

NAN_SETTER(NUIImageView::imageSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIImageView, ui);
  
  UIImage *img = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(value))->As<UIImage>();

  @autoreleasepool {
    [ui setImage:img];
  }
}
