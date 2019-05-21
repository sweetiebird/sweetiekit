//
//  UIStackView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NUIView.h"
#include "NUIStackView.h"

Nan::Persistent<FunctionTemplate> NUIStackView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIStackView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIStackView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addArrangedSubview", addArrangedSubview);
  Nan::SetMethod(proto, "insertArrangedSubview", insertArrangedSubview);
  Nan::SetMethod(proto, "removeArrangedSubview", removeArrangedSubview);
  JS_ASSIGN_PROP_READONLY(proto, arrangedSubviews);
  JS_ASSIGN_PROP(proto, axis);
  JS_ASSIGN_PROP(proto, distribution);
  JS_ASSIGN_PROP(proto, alignment);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIStackView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIStackView *ui = new NUIStackView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIStackView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0 && info[0]->IsArray()) {
    Local<Array> array = Local<Array>::Cast(info[0]);
    NSMutableArray *views = [NSMutableArray array];
    for (unsigned int i = 0; i < array->Length(); i++ ) {
      if (Nan::Has(array, i).FromJust()) {
        NUIView *view = ObjectWrap::Unwrap<NUIView>(JS_OBJ(array->Get(i)));
        [views addObject:view->As<UIView>()];
      }
    }
    ui->SetNSObject([[UIStackView alloc] initWithArrangedSubviews:views]);
  } else if (info.Length() > 0 && info[0]->IsObject()) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    ui->SetNSObject([[UIStackView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIStackView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIStackView::NUIStackView () {}
NUIStackView::~NUIStackView () {}

NAN_METHOD(NUIStackView::addArrangedSubview) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  Local<Object> obj = JS_OBJ(info[0]);
  NUIView *subview = ObjectWrap::Unwrap<NUIView>(obj);

  @autoreleasepool {
    [ui addArrangedSubview:subview->As<UIView>()];
  }
}

NAN_METHOD(NUIStackView::insertArrangedSubview) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIStackView, ui);
  
  Local<Object> obj = JS_OBJ(info[0]);
  NUIView *subview = ObjectWrap::Unwrap<NUIView>(obj);
  double idx = TO_DOUBLE(info[1]);

  @autoreleasepool {
    [ui insertArrangedSubview:subview->As<UIView>() atIndex:idx];
  }
}

NAN_METHOD(NUIStackView::removeArrangedSubview) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  Local<Object> obj = JS_OBJ(info[0]);
  NUIView *subview = ObjectWrap::Unwrap<NUIView>(obj);

  @autoreleasepool {
    [ui removeArrangedSubview:subview->As<UIView>()];
  }
}

NAN_GETTER(NUIStackView::arrangedSubviewsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  __block NSArray* subviews = nullptr;
  __block NSInteger count = 0;

  @autoreleasepool {
    subviews = [ui arrangedSubviews];
    count = [subviews count];
  }
  
  auto result = Nan::New<Array>();

  for (NSInteger i = 0; i < count; i++) {
    UIView* subview = [subviews objectAtIndex:i];
    if (subview != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)subview)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(subview, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      Nan::Set(result, static_cast<uint32_t>(i), value);
    }
  }

  JS_SET_RETURN(result);
}

NAN_GETTER(NUIStackView::axisGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  NSInteger axisVal = [ui axis];
  
  JS_SET_RETURN(JS_NUM(axisVal));
}

NAN_SETTER(NUIStackView::axisSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  double axisVal = TO_DOUBLE(value);
  UILayoutConstraintAxis axis = UILayoutConstraintAxis(axisVal);
  
  @autoreleasepool {
    [ui setAxis:axis];
  }
}

NAN_GETTER(NUIStackView::distributionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  NSInteger distVal = [ui distribution];

  JS_SET_RETURN(JS_NUM(distVal));
}

NAN_SETTER(NUIStackView::distributionSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  double distVal = TO_DOUBLE(value);
  UIStackViewDistribution dist = UIStackViewDistribution(distVal);

  @autoreleasepool {
    [ui setDistribution:dist];
  }
}

NAN_GETTER(NUIStackView::alignmentGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  NSInteger align = [ui alignment];

  JS_SET_RETURN(JS_NUM(align));
}

NAN_SETTER(NUIStackView::alignmentSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIStackView, ui);
  
  double alignVal = TO_DOUBLE(value);
  UIStackViewAlignment align = UIStackViewAlignment(alignVal);

  @autoreleasepool {
    [ui setAlignment:align];
  }
}
