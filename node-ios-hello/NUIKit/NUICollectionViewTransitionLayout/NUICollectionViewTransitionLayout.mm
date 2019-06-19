//
//  NUICollectionViewTransitionLayout.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewTransitionLayout.h"

#define instancetype UICollectionViewTransitionLayout
#define js_value_instancetype js_value_UICollectionViewTransitionLayout

NUICollectionViewTransitionLayout::NUICollectionViewTransitionLayout() {}
NUICollectionViewTransitionLayout::~NUICollectionViewTransitionLayout() {}

JS_INIT_CLASS(UICollectionViewTransitionLayout, UICollectionViewLayout);
  JS_ASSIGN_PROTO_METHOD(initWithCurrentLayoutNextLayout);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(updateValueForAnimatedKey);
  JS_ASSIGN_PROTO_METHOD(valueForAnimatedKey);
  JS_ASSIGN_PROTO_PROP(transitionProgress);
  JS_ASSIGN_PROTO_PROP_READONLY(currentLayout);
  JS_ASSIGN_PROTO_PROP_READONLY(nextLayout);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewTransitionLayout, UICollectionViewLayout);
  // constant values (exports)
JS_INIT_CLASS_END(UICollectionViewTransitionLayout, UICollectionViewLayout);

NAN_METHOD(NUICollectionViewTransitionLayout::New) {
  JS_RECONSTRUCT(UICollectionViewTransitionLayout);
  @autoreleasepool {
    UICollectionViewTransitionLayout* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionViewTransitionLayout *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUICollectionViewTransitionLayout *wrapper = new NUICollectionViewTransitionLayout();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionViewTransitionLayout::New: invalid arguments");
    }
  }
}

#include "NUICollectionViewLayout.h"

NAN_METHOD(NUICollectionViewTransitionLayout::initWithCurrentLayoutNextLayout) {
  JS_UNWRAP_OR_ALLOC(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayout, currentLayout);
    declare_pointer(UICollectionViewLayout, newLayout);
    JS_SET_RETURN(js_value_instancetype([self initWithCurrentLayout: currentLayout nextLayout: newLayout]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUICollectionViewTransitionLayout::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUICollectionViewTransitionLayout::updateValueForAnimatedKey) {
  JS_UNWRAP(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, value);
    declare_pointer(NSString, key);
    [self updateValue: value forAnimatedKey: key];
  }
}

NAN_METHOD(NUICollectionViewTransitionLayout::valueForAnimatedKey) {
  JS_UNWRAP(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_CGFloat([self valueForAnimatedKey: key]));
  }
}

NAN_GETTER(NUICollectionViewTransitionLayout::transitionProgressGetter) {
  JS_UNWRAP(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self transitionProgress]));
  }
}

NAN_SETTER(NUICollectionViewTransitionLayout::transitionProgressSetter) {
  JS_UNWRAP(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setTransitionProgress: input];
  }
}

NAN_GETTER(NUICollectionViewTransitionLayout::currentLayoutGetter) {
  JS_UNWRAP(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewLayout([self currentLayout]));
  }
}

NAN_GETTER(NUICollectionViewTransitionLayout::nextLayoutGetter) {
  JS_UNWRAP(UICollectionViewTransitionLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewLayout([self nextLayout]));
  }
}
