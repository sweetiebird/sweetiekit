//
//  UINavigationBar.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINavigationBar.h"

NUINavigationBar::NUINavigationBar() {}
NUINavigationBar::~NUINavigationBar() {}

JS_INIT_CLASS(UINavigationBar, UIView);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, setBackgroundImageForBarMetrics);
  JS_ASSIGN_PROP(proto, barStyle);
  JS_ASSIGN_PROP_READONLY(proto, backItem);
  JS_ASSIGN_PROP(proto, barTintColor);
  JS_ASSIGN_PROP(proto, tintColor);
  JS_ASSIGN_PROP(proto, shadowImage);
//  JS_ASSIGN_PROP(proto, isTranslucent);
  // static members (ctor)
  JS_INIT_CTOR(UINavigationBar, UIView);
JS_INIT_CLASS_END(UINavigationBar, UIView);

NAN_METHOD(NUINavigationBar::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUINavigationBar *ui = new NUINavigationBar();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UINavigationBar *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UINavigationBar alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

#include "NUIImage.h"

NAN_METHOD(NUINavigationBar::setBackgroundImageForBarMetrics) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationBar, ui);
  
  NUIImage *imgObj = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[0]));

  UIBarMetrics metrics = UIBarMetricsDefault;
  double metricNum = TO_UINT32(info[1]);
  if (metricNum == 1) {
    metrics = UIBarMetricsCompact;
  } else if (metricNum == 2) {
    metrics = UIBarMetricsDefaultPrompt;
  } else if (metricNum == 3) {
    metrics = UIBarMetricsCompactPrompt;
  }

  @autoreleasepool {
    [ui setBackgroundImage:imgObj->As<UIImage>() forBarMetrics:metrics];
  }
}

NAN_GETTER(NUINavigationBar::barStyleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  JS_SET_RETURN(JS_NUM([ui barStyle]));
}

NAN_SETTER(NUINavigationBar::barStyleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  @autoreleasepool {
    [ui setBarStyle:UIBarStyle(TO_UINT32(value))];
  }
}

NAN_GETTER(NUINavigationBar::barTintColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  CGFloat red = 0;
  CGFloat green = 0;
  CGFloat blue = 0;
  CGFloat alpha = 1;
  @autoreleasepool {
    UIColor* color = [ui barTintColor];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUINavigationBar::barTintColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [ui setBarTintColor:color];
  }
}

NAN_GETTER(NUINavigationBar::tintColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  CGFloat red = 0;
  CGFloat green = 0;
  CGFloat blue = 0;
  CGFloat alpha = 1;
  @autoreleasepool {
    UIColor* color = [ui tintColor];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUINavigationBar::tintColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [ui setTintColor:color];
  }
}

#include "NUINavigationItem.h"

NAN_GETTER(NUINavigationBar::backItemGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationBar, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui backItem], NUINavigationItem::type)));
}

NAN_GETTER(NUINavigationBar::shadowImageGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationBar, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui shadowImage], NUIImage::type)));
}

NAN_SETTER(NUINavigationBar::shadowImageSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UINavigationBar, ui);
  
  NUIImage *imgObj = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setShadowImage:imgObj->As<UIImage>()];
  }
}
//
//NAN_GETTER(NUINavigationBar::isTranslucentGetter) {
//  Nan::HandleScope scope;
//  
//  JS_UNWRAP(UINavigationBar, ui);
//  
//  JS_SET_RETURN(JS_BOOL([ui isTranslucent]));
//}
//
//NAN_SETTER(NUINavigationBar::isTranslucentSetter) {
//  Nan::HandleScope scope;
//  
//  JS_UNWRAP(UINavigationBar, ui);
//
//  @autoreleasepool {
//    [ui setTranslucent:TO_BOOL(value)];
//  }
//}

