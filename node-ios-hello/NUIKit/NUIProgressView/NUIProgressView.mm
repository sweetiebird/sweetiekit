//
//  UIProgressView.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIProgressView.h"

NUIProgressView::NUIProgressView() {}
NUIProgressView::~NUIProgressView() {}

JS_INIT_CLASS(UIProgressView, UIView);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, setProgress);
  JS_ASSIGN_PROP(proto, progress);
  JS_ASSIGN_PROP(proto, progressTintColor);
  JS_ASSIGN_PROP(proto, trackTintColor);
  // static members (ctor)
  JS_INIT_CTOR(UIProgressView, UIView);
JS_INIT_CLASS_END(UIProgressView, UIView);

NAN_METHOD(NUIProgressView::New) {
  JS_RECONSTRUCT(UIProgressView);

  Local<Object> obj = info.This();

  NUIProgressView *ui = new NUIProgressView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIProgressView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0 && info[0]->IsNumber()) {
    @autoreleasepool {
      UIProgressViewStyle style = UIProgressViewStyleDefault;
      auto styleInt = TO_UINT32(info[0]);
      if (styleInt == 1) {
        style = UIProgressViewStyleBar;
      }
      ui->SetNSObject([[UIProgressView alloc] initWithProgressViewStyle:style]);
    }
  } else if (info.Length() > 0 && info[0]->IsObject()) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      ui->SetNSObject([[UIProgressView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIProgressView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIProgressView::setProgress) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIProgressView, ui);

  @autoreleasepool {
    double progress = TO_DOUBLE(info[0]);
    BOOL animated = TO_BOOL(info[1]);
    [ui setProgress:progress animated:animated];
  }
}

NAN_GETTER(NUIProgressView::progressGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIProgressView, ui);
  
  JS_SET_RETURN(JS_NUM([ui progress]));
}

NAN_SETTER(NUIProgressView::progressSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIProgressView, ui);
  
  @autoreleasepool {
    double progress = TO_DOUBLE(value);
    [ui setProgress:progress];
  }
}

NAN_GETTER(NUIProgressView::progressTintColorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIProgressView, ui);
  
  __block double r = 0;
  __block double g = 0;
  __block double b = 0;
  __block double a = 0;
  @autoreleasepool {
    UIColor *tint = [ui progressTintColor];
    [tint getRed:&r green:&g blue:&b alpha:&a];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(r));
  result->Set(JS_STR("green"), JS_NUM(g));
  result->Set(JS_STR("blue"), JS_NUM(b));
  result->Set(JS_STR("alpha"), JS_NUM(a));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NUIProgressView::progressTintColorSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIProgressView, ui);
  
  @autoreleasepool {
    double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
    double g = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
    double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
    double a = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
    [ui setProgressTintColor:[[UIColor alloc] initWithRed:r green:g blue:b alpha:a]];
  }
}

NAN_GETTER(NUIProgressView::trackTintColorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIProgressView, ui);
  
  __block double r = 0;
  __block double g = 0;
  __block double b = 0;
  __block double a = 0;
  @autoreleasepool {
    UIColor *tint = [ui trackTintColor];
    [tint getRed:&r green:&g blue:&b alpha:&a];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(r));
  result->Set(JS_STR("green"), JS_NUM(g));
  result->Set(JS_STR("blue"), JS_NUM(b));
  result->Set(JS_STR("alpha"), JS_NUM(a));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NUIProgressView::trackTintColorSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIProgressView, ui);
  
  @autoreleasepool {
    double r = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
    double g = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
    double b = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
    double a = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
    [ui setTrackTintColor:[[UIColor alloc] initWithRed:r green:g blue:b alpha:a]];
  }
}
