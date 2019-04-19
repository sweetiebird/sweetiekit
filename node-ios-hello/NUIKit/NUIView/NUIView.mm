//
//  NUIView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIView.h"
#include "NUIButton.h"
#include "NUIResponder.h"

Nan::Persistent<FunctionTemplate> NUIView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIView::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIResponder::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("frame"), FrameGetter, FrameSetter);
  Nan::SetAccessor(proto, JS_STR("x"), XGetter, XSetter);
  Nan::SetAccessor(proto, JS_STR("y"), YGetter, YSetter);
  Nan::SetMethod(proto, "addSubview", AddSubview);
  Nan::SetMethod(proto, "setBackgroundColor", SetBackgroundColor);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIView::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIView *view = new NUIView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIView *)(info[0].As<External>()->Value()));
  } else {
      double x = TO_DOUBLE(info[0]);
      double y = TO_DOUBLE(info[1]);
      double width = TO_DOUBLE(info[2]);
      double height = TO_DOUBLE(info[3]);

      @autoreleasepool {
        dispatch_sync(dispatch_get_main_queue(), ^ {
            view->SetNSObject([[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
        });
      }
  }
  view->Wrap(viewObj);
  
  info.GetReturnValue().Set(viewObj);
}

NAN_GETTER(NUIView::FrameGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
   Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT(view->GetFrame().size.width));
  result->Set(JS_STR("height"), JS_FLOAT(view->GetFrame().size.height));
  result->Set(JS_STR("x"), JS_FLOAT(view->GetFrame().origin.x));
  result->Set(JS_STR("y"), JS_FLOAT(view->GetFrame().origin.y));

  info.GetReturnValue().Set(result);
}

NAN_SETTER(NUIView::FrameSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
  double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:CGRectMake(x, y, width, height)];
    });
  }
}

NAN_GETTER(NUIView::XGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  info.GetReturnValue().Set(JS_NUM(view->GetFrame().origin.x));
}

NAN_SETTER(NUIView::XSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.origin.x = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::YGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  info.GetReturnValue().Set(JS_NUM(view->GetFrame().origin.y));
}

NAN_SETTER(NUIView::YSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.origin.y = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}


CGRect NUIView::GetFrame() {
  if (As<UIView>()) {
   return [As<UIView>() frame];
  } else {
    return CGRectMake(0, 0, 0, 0);
  }
}

NAN_METHOD(NUIView::SetBackgroundColor) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));

  double red = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("blue")));
  double alpha = JS_OBJ(info[0])->Has(JS_CONTEXT(), JS_STR("alpha")).FromJust() ? TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("alpha"))) : 1.0;
  
  UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setBackgroundColor:color];
    });
  }
}
NAN_METHOD(NUIView::AddSubview) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));
  Local<Object> obj = JS_OBJ(info[0]);
  if (obj->InstanceOf(JS_CONTEXT(), JS_TYPE(NUIView)).FromJust()) {
    NUIView *subview = ObjectWrap::Unwrap<NUIView>(obj);

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [view->As<UIView>() addSubview:subview->As<UIView>()];
      });
    }
  } else {
    Nan::ThrowError("Unknown addSubview type");
  }
}

NUIView::NUIView () {}
NUIView::~NUIView () {}

