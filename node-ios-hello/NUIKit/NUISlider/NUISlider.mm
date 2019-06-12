//
//  NUISlider.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISlider.h"

NUISlider::NUISlider() {}
NUISlider::~NUISlider() {}

JS_INIT_CLASS(UISlider, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, value);
  JS_ASSIGN_METHOD(proto, setValue);
  JS_ASSIGN_METHOD(proto, setThumbImage);
  JS_ASSIGN_PROP_READONLY(proto, currentThumbImage);
  JS_ASSIGN_PROP(proto, thumbTintColor);
  // static members (ctor)
  JS_INIT_CTOR(UISlider, UIControl);
JS_INIT_CLASS_END(UISlider, UIControl);

NAN_METHOD(NUISlider::New) {
  JS_RECONSTRUCT(UISlider);

  Local<Object> obj = info.This();

  NUISlider *ui = new NUISlider();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UISlider *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
      double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
      double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
      CGRect frame = CGRectMake(x, y, width, height);
      ui->SetNSObject([[UISlider alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UISlider alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NUISlider::valueGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UISlider, ui);
  
  JS_SET_RETURN(JS_NUM([ui value]));
}

NAN_SETTER(NUISlider::valueSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UISlider, ui);

  [ui setValue:TO_DOUBLE(value)];
}

NAN_METHOD(NUISlider::setValue) {
  Nan::HandleScope scope;

  JS_UNWRAP(UISlider, ui);

  [ui setValue:TO_FLOAT(info[0]) animated:TO_BOOL(info[1])];
}

#include "NUIImage.h"

NAN_METHOD(NUISlider::setThumbImage) {
  Nan::HandleScope scope;

  JS_UNWRAP(UISlider, ui);
  
  if (!JS_INSTANCEOF(info[0], NUIImage)) {
    Nan::ThrowError("NUISlider::setThumbImage: expected 1st arg to be a UIImage");
    return;
  }
  
  JS_UNWRAPPED(info[0], UIImage, img);
  
  UIControlState state = [ui state];
  if (info[1]->IsUint32()) {
    state = TO_UINT32(info[1]);
  }
  [ui setThumbImage:img forState:state];
}

JS_GETTER(UISlider, ui, currentThumbImage, {
  UIImage* img = [ui currentThumbImage];
  if (img != nullptr) {
    JS_SET_RETURN(sweetiekit::GetWrapperFor(img, NUIImage::type));
  }
});

JS_GETTER(UISlider, ui, thumbTintColor, {
  UIColor* color = [ui thumbTintColor];
  if (color != nullptr) {
    JS_SET_RETURN(sweetiekit::JSObjFromUIColor(color));
  }
});

JS_SETTER(UISlider, ui, thumbTintColor, {
  UIColor* color = sweetiekit::UIColorFromJSColor(value);
  if (color == nullptr) {
    Nan::ThrowError("NUISlider::thumbTintColorSetter: Expected a UIColor");
    return;
  }
  [ui setThumbTintColor:color];
});
