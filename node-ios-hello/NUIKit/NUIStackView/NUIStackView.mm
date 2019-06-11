//
//  NUIStackView.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIStackView.h"

#define instancetype UIStackView
#define js_value_instancetype js_value_UIStackView

NUIStackView::NUIStackView() {}
NUIStackView::~NUIStackView() {}

JS_INIT_CLASS(UIStackView, UIView);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(addArrangedSubview);
  JS_ASSIGN_PROTO_METHOD(removeArrangedSubview);
  JS_ASSIGN_PROTO_METHOD(insertArrangedSubviewAtIndex);
  JS_ASSIGN_PROTO_METHOD(setCustomSpacingAfterView);
  JS_ASSIGN_PROTO_METHOD(customSpacingAfterView);
  JS_ASSIGN_PROTO_PROP_READONLY(arrangedSubviews);
  JS_ASSIGN_PROTO_PROP(axis);
  JS_ASSIGN_PROTO_PROP(distribution);
  JS_ASSIGN_PROTO_PROP(alignment);
  JS_ASSIGN_PROTO_PROP(spacing);
  JS_ASSIGN_PROTO_PROP(isBaselineRelativeArrangement);
  JS_ASSIGN_PROTO_PROP(isLayoutMarginsRelativeArrangement);
  // static members (ctor)
  JS_INIT_CTOR(UIStackView, UIView);
  JS_ASSIGN_STATIC_METHOD(initWithFrame);
  JS_ASSIGN_STATIC_METHOD(initWithCoder);
  JS_ASSIGN_STATIC_METHOD(initWithArrangedSubviews);
JS_INIT_CLASS_END(UIStackView, UIView);

NAN_METHOD(NUIStackView::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `UIStackView(...)`, turn into construct call.
      JS_SET_RETURN_NEW(UIStackView, info);
      return;
    }
    UIStackView* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIStackView *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIStackView alloc] init];
    }
    if (self) {
      NUIStackView *wrapper = new NUIStackView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIStackView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIStackView::initWithFrame) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    JS_SET_RETURN(js_value_instancetype([[UIStackView alloc] initWithFrame: frame]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIStackView::initWithCoder) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_instancetype([[UIStackView alloc] initWithCoder: coder]));
  }
}

NAN_METHOD(NUIStackView::initWithArrangedSubviews) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UIView*>, views);
    JS_SET_RETURN(js_value_instancetype([[UIStackView alloc] initWithArrangedSubviews: views]));
  }
}

NAN_METHOD(NUIStackView::addArrangedSubview) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    [self addArrangedSubview: view];
  }
}

NAN_METHOD(NUIStackView::removeArrangedSubview) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    [self removeArrangedSubview: view];
  }
}

NAN_METHOD(NUIStackView::insertArrangedSubviewAtIndex) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    declare_value(NSUInteger, stackIndex);
    [self insertArrangedSubview: view atIndex: stackIndex];
  }
}

NAN_METHOD(NUIStackView::setCustomSpacingAfterView) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, spacing);
    declare_pointer(UIView, arrangedSubview);
    [self setCustomSpacing: spacing afterView: arrangedSubview];
  }
}

NAN_METHOD(NUIStackView::customSpacingAfterView) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, arrangedSubview);
    JS_SET_RETURN(js_value_CGFloat([self customSpacingAfterView: arrangedSubview]));
  }
}

NAN_GETTER(NUIStackView::arrangedSubviewsGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIView*>([self arrangedSubviews]));
  }
}

NAN_GETTER(NUIStackView::axisGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILayoutConstraintAxis([self axis]));
  }
}

NAN_SETTER(NUIStackView::axisSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UILayoutConstraintAxis, input);
    [self setAxis: input];
  }
}

NAN_GETTER(NUIStackView::distributionGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStackViewDistribution([self distribution]));
  }
}

NAN_SETTER(NUIStackView::distributionSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIStackViewDistribution, input);
    [self setDistribution: input];
  }
}

NAN_GETTER(NUIStackView::alignmentGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStackViewAlignment([self alignment]));
  }
}

NAN_SETTER(NUIStackView::alignmentSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIStackViewAlignment, input);
    [self setAlignment: input];
  }
}

NAN_GETTER(NUIStackView::spacingGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self spacing]));
  }
}

NAN_SETTER(NUIStackView::spacingSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpacing: input];
  }
}

NAN_GETTER(NUIStackView::isBaselineRelativeArrangementGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBaselineRelativeArrangement]));
  }
}

NAN_SETTER(NUIStackView::isBaselineRelativeArrangementSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBaselineRelativeArrangement: input];
  }
}

NAN_GETTER(NUIStackView::isLayoutMarginsRelativeArrangementGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLayoutMarginsRelativeArrangement]));
  }
}

NAN_SETTER(NUIStackView::isLayoutMarginsRelativeArrangementSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLayoutMarginsRelativeArrangement: input];
  }
}

