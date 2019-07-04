//
//  NUITableViewHeaderFooterView.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewHeaderFooterView.h"

#define instancetype UITableViewHeaderFooterView
#define js_value_instancetype js_value_UITableViewHeaderFooterView

NUITableViewHeaderFooterView::NUITableViewHeaderFooterView() {}
NUITableViewHeaderFooterView::~NUITableViewHeaderFooterView() {}

JS_INIT_CLASS(UITableViewHeaderFooterView, UIView);
  JS_ASSIGN_PROTO_METHOD(initWithReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(prepareForReuse);
  JS_ASSIGN_PROTO_PROP_READONLY(textLabel);
  JS_ASSIGN_PROTO_PROP_READONLY(detailTextLabel);
  JS_ASSIGN_PROTO_PROP_READONLY(contentView);
  JS_ASSIGN_PROTO_PROP(backgroundView);
  JS_ASSIGN_PROTO_PROP_READONLY(reuseIdentifier);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewHeaderFooterView, UIView);
  // constant values (exports)
JS_INIT_CLASS_END(UITableViewHeaderFooterView, UIView);

NAN_METHOD(NUITableViewHeaderFooterView::New) {
  JS_RECONSTRUCT(UITableViewHeaderFooterView);
  @autoreleasepool {
    UITableViewHeaderFooterView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewHeaderFooterView *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITableViewHeaderFooterView alloc] init];
    }
    if (self) {
      NUITableViewHeaderFooterView *wrapper = new NUITableViewHeaderFooterView();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewHeaderFooterView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITableViewHeaderFooterView::initWithReuseIdentifier) {
  JS_UNWRAP_OR_ALLOC(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, reuseIdentifier);
    JS_SET_RETURN(js_value_instancetype([self initWithReuseIdentifier: reuseIdentifier]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUITableViewHeaderFooterView::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUITableViewHeaderFooterView::prepareForReuse) {
  JS_UNWRAP(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    [self prepareForReuse];
  }
}

#include "NUILabel.h"

NAN_GETTER(NUITableViewHeaderFooterView::textLabelGetter) {
  JS_UNWRAP(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILabel([self textLabel]));
  }
}

NAN_GETTER(NUITableViewHeaderFooterView::detailTextLabelGetter) {
  JS_UNWRAP(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILabel([self detailTextLabel]));
  }
}

NAN_GETTER(NUITableViewHeaderFooterView::contentViewGetter) {
  JS_UNWRAP(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self contentView]));
  }
}

NAN_GETTER(NUITableViewHeaderFooterView::backgroundViewGetter) {
  JS_UNWRAP(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self backgroundView]));
  }
}

NAN_SETTER(NUITableViewHeaderFooterView::backgroundViewSetter) {
  JS_UNWRAP(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setBackgroundView: input];
  }
}

NAN_GETTER(NUITableViewHeaderFooterView::reuseIdentifierGetter) {
  JS_UNWRAP(UITableViewHeaderFooterView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self reuseIdentifier]));
  }
}
