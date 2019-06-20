//
//  NUIInputView.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIInputView.h"

#define instancetype UIInputView
#define js_value_instancetype js_value_UIInputView

NUIInputView::NUIInputView() {}
NUIInputView::~NUIInputView() {}

JS_INIT_CLASS(UIInputView, UIView);
  JS_ASSIGN_PROTO_METHOD(initWithFrameInputViewStyle);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_PROP_READONLY(inputViewStyle);
  JS_ASSIGN_PROTO_PROP(allowsSelfSizing);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIInputView, UIView);
  // constant values (exports)
  
  //typedef NS_ENUM(NSInteger, UIInputViewStyle) {
    JS_ASSIGN_ENUM(UIInputViewStyleDefault, NSInteger);
    JS_ASSIGN_ENUM(UIInputViewStyleKeyboard, NSInteger);       // mimics the keyboard background
  //} NS_ENUM_AVAILABLE_IOS(7_0);

JS_INIT_CLASS_END(UIInputView, UIView);

NAN_METHOD(NUIInputView::New) {
  JS_RECONSTRUCT(UIInputView);
  @autoreleasepool {
    UIInputView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIInputView *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIInputView alloc] init];
    }
    if (self) {
      NUIInputView *wrapper = new NUIInputView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIInputView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIInputView::initWithFrameInputViewStyle) {
  JS_UNWRAP_OR_ALLOC(UIInputView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    declare_value(UIInputViewStyle, inputViewStyle);
    JS_SET_RETURN(js_value_instancetype([self initWithFrame: frame inputViewStyle: inputViewStyle]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIInputView::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UIInputView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_GETTER(NUIInputView::inputViewStyleGetter) {
  JS_UNWRAP(UIInputView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInputViewStyle([self inputViewStyle]));
  }
}

NAN_GETTER(NUIInputView::allowsSelfSizingGetter) {
  JS_UNWRAP(UIInputView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsSelfSizing]));
  }
}

NAN_SETTER(NUIInputView::allowsSelfSizingSetter) {
  JS_UNWRAP(UIInputView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsSelfSizing: input];
  }
}
