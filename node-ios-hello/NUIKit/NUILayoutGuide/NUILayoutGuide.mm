//
//  NUILayoutGuide.mm
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUILayoutGuide.h"

NUILayoutGuide::NUILayoutGuide() {}
NUILayoutGuide::~NUILayoutGuide() {}

JS_INIT_CLASS(UILayoutGuide, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, layoutFrame);
  JS_ASSIGN_PROP(proto, owningView);
  JS_ASSIGN_PROP(proto, identifier);
  JS_ASSIGN_PROP_READONLY(proto, leadingAnchor);
  JS_ASSIGN_PROP_READONLY(proto, trailingAnchor);
  JS_ASSIGN_PROP_READONLY(proto, leftAnchor);
  JS_ASSIGN_PROP_READONLY(proto, rightAnchor);
  JS_ASSIGN_PROP_READONLY(proto, topAnchor);
  JS_ASSIGN_PROP_READONLY(proto, bottomAnchor);
  JS_ASSIGN_PROP_READONLY(proto, widthAnchor);
  JS_ASSIGN_PROP_READONLY(proto, heightAnchor);
  JS_ASSIGN_PROP_READONLY(proto, centerXAnchor);
  JS_ASSIGN_PROP_READONLY(proto, centerYAnchor);
  // static members (ctor)
  JS_INIT_CTOR(UILayoutGuide, NSObject);
JS_INIT_CLASS_END(UILayoutGuide, NSObject);

NAN_METHOD(NUILayoutGuide::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UILayoutGuide(...)', turn into construct call.
      JS_SET_RETURN_NEW(UILayoutGuide, info);
      return;
    }

    UILayoutGuide* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UILayoutGuide *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UILayoutGuide alloc] init];
    }
    if (self) {
      NUILayoutGuide *wrapper = new NUILayoutGuide();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UILayoutGuide::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUILayoutGuide::layoutFrameGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGRect([self layoutFrame]));
  }
}

#include "NUIView.h"

NAN_GETTER(NUILayoutGuide::owningViewGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView([self owningView]));
  }
}

NAN_SETTER(NUILayoutGuide::owningViewSetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    [self setOwningView: to_value_UIView(value)];
  }
}

NAN_GETTER(NUILayoutGuide::identifierGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_SETTER(NUILayoutGuide::identifierSetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    [self setIdentifier: to_value_NSString(value)];
  }
}

#include "NNSLayoutXAxisAnchor.h"

NAN_GETTER(NUILayoutGuide::leadingAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self leadingAnchor]));
  }
}

NAN_GETTER(NUILayoutGuide::trailingAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self trailingAnchor]));
  }
}

NAN_GETTER(NUILayoutGuide::leftAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self leftAnchor]));
  }
}

NAN_GETTER(NUILayoutGuide::rightAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self rightAnchor]));
  }
}

#include "NNSLayoutYAxisAnchor.h"

NAN_GETTER(NUILayoutGuide::topAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self topAnchor]));
  }
}

NAN_GETTER(NUILayoutGuide::bottomAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self bottomAnchor]));
  }
}

#include "NNSLayoutDimension.h"

NAN_GETTER(NUILayoutGuide::widthAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutDimension([self widthAnchor]));
  }
}

NAN_GETTER(NUILayoutGuide::heightAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutDimension([self heightAnchor]));
  }
}

NAN_GETTER(NUILayoutGuide::centerXAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self centerXAnchor]));
  }
}

NAN_GETTER(NUILayoutGuide::centerYAnchorGetter) {
  JS_UNWRAP(UILayoutGuide, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self centerYAnchor]));
  }
}

