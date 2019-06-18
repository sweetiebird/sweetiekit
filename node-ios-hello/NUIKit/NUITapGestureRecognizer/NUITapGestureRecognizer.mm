//
//  UITapGestureRecognizer.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITapGestureRecognizer.h"

#define JS_INIT_DEFAULT(name) \
  N##name::N##name() {} \
  N##name::~N##name() {}

JS_INIT_DEFAULT(UITapGestureRecognizer);
JS_INIT_CLASS(UITapGestureRecognizer, UIGestureRecognizer);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(numberOfTapsRequired);
  JS_ASSIGN_PROTO_PROP(numberOfTouchesRequired);
  // static members (ctor)
  JS_INIT_CTOR(UITapGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UITapGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUITapGestureRecognizer::New) {
  JS_RECONSTRUCT(UITapGestureRecognizer);

  Local<Object> obj = info.This();

  NUITapGestureRecognizer *ui = new NUITapGestureRecognizer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITapGestureRecognizer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UITapGestureRecognizer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NUITapGestureRecognizer::numberOfTapsRequiredGetter) {
  JS_UNWRAP(UITapGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfTapsRequired]));
  }
}

NAN_SETTER(NUITapGestureRecognizer::numberOfTapsRequiredSetter) {
  JS_UNWRAP(UITapGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setNumberOfTapsRequired: input];
  }
}

NAN_GETTER(NUITapGestureRecognizer::numberOfTouchesRequiredGetter) {
  JS_UNWRAP(UITapGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfTouchesRequired]));
  }
}

NAN_SETTER(NUITapGestureRecognizer::numberOfTouchesRequiredSetter) {
  JS_UNWRAP(UITapGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setNumberOfTouchesRequired: input];
  }
}

JS_INIT_DEFAULT(UIPinchGestureRecognizer);
JS_INIT_CLASS(UIPinchGestureRecognizer, UIGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(scale);
  JS_ASSIGN_PROTO_PROP_READONLY(velocity);
  JS_INIT_CTOR(UIPinchGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIPinchGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUIPinchGestureRecognizer::New) {
  JS_RECONSTRUCT(UIPinchGestureRecognizer);
  @autoreleasepool {
    UIPinchGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIPinchGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIPinchGestureRecognizer alloc] init];
    }
    if (self) {
      NUIPinchGestureRecognizer *wrapper = new NUIPinchGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPinchGestureRecognizer::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIPinchGestureRecognizer::scaleGetter) {
  JS_UNWRAP(UIPinchGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self scale]));
  }
}

NAN_SETTER(NUIPinchGestureRecognizer::scaleSetter) {
  JS_UNWRAP(UIPinchGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setScale: input];
  }
}

NAN_GETTER(NUIPinchGestureRecognizer::velocityGetter) {
  JS_UNWRAP(UIPinchGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self velocity]));
  }
}

JS_INIT_DEFAULT(UIRotationGestureRecognizer);
JS_INIT_CLASS(UIRotationGestureRecognizer, UIGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(rotation);
  JS_ASSIGN_PROTO_PROP_READONLY(velocity);
  JS_INIT_CTOR(UIRotationGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIRotationGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUIRotationGestureRecognizer::New) {
  JS_RECONSTRUCT(UIRotationGestureRecognizer);
  @autoreleasepool {
    UIRotationGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIRotationGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIRotationGestureRecognizer alloc] init];
    }
    if (self) {
      NUIRotationGestureRecognizer *wrapper = new NUIRotationGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIRotationGestureRecognizer::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIRotationGestureRecognizer::rotationGetter) {
  JS_UNWRAP(UIRotationGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self rotation]));
  }
}

NAN_SETTER(NUIRotationGestureRecognizer::rotationSetter) {
  JS_UNWRAP(UIRotationGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setRotation: input];
  }
}

NAN_GETTER(NUIRotationGestureRecognizer::velocityGetter) {
  JS_UNWRAP(UIRotationGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self velocity]));
  }
}

JS_INIT_DEFAULT(UISwipeGestureRecognizer);
JS_INIT_CLASS(UISwipeGestureRecognizer, UIGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(numberOfTouchesRequired);
  JS_ASSIGN_PROTO_PROP(direction);

  JS_INIT_CTOR(UISwipeGestureRecognizer, UIGestureRecognizer);

  //typedef NS_OPTIONS(NSUInteger, UISwipeGestureRecognizerDirection) {
    JS_ASSIGN_ENUM(UISwipeGestureRecognizerDirectionRight, NSUInteger); //  = 1 << 0,
    JS_ASSIGN_ENUM(UISwipeGestureRecognizerDirectionLeft, NSUInteger); //   = 1 << 1,
    JS_ASSIGN_ENUM(UISwipeGestureRecognizerDirectionUp, NSUInteger); //     = 1 << 2,
    JS_ASSIGN_ENUM(UISwipeGestureRecognizerDirectionDown, NSUInteger); //   = 1 << 3
  //};

JS_INIT_CLASS_END(UISwipeGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUISwipeGestureRecognizer::New) {
  JS_RECONSTRUCT(UISwipeGestureRecognizer);
  @autoreleasepool {
    UISwipeGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UISwipeGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UISwipeGestureRecognizer alloc] init];
    }
    if (self) {
      NUISwipeGestureRecognizer *wrapper = new NUISwipeGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISwipeGestureRecognizer::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUISwipeGestureRecognizer::numberOfTouchesRequiredGetter) {
  JS_UNWRAP(UISwipeGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfTouchesRequired]));
  }
}

NAN_SETTER(NUISwipeGestureRecognizer::numberOfTouchesRequiredSetter) {
  JS_UNWRAP(UISwipeGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setNumberOfTouchesRequired: input];
  }
}

NAN_GETTER(NUISwipeGestureRecognizer::directionGetter) {
  JS_UNWRAP(UISwipeGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISwipeGestureRecognizerDirection([self direction]));
  }
}

NAN_SETTER(NUISwipeGestureRecognizer::directionSetter) {
  JS_UNWRAP(UISwipeGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UISwipeGestureRecognizerDirection, input);
    [self setDirection: input];
  }
}

JS_INIT_DEFAULT(UIPanGestureRecognizer);
JS_INIT_CLASS(UIPanGestureRecognizer, UIGestureRecognizer);
  JS_ASSIGN_PROTO_METHOD(translationInView);
  JS_ASSIGN_PROTO_METHOD(setTranslationInView);
  JS_ASSIGN_PROTO_METHOD(velocityInView);
  JS_ASSIGN_PROTO_PROP(minimumNumberOfTouches);
  JS_ASSIGN_PROTO_PROP(maximumNumberOfTouches);
  JS_INIT_CTOR(UIPanGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIPanGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUIPanGestureRecognizer::New) {
  JS_RECONSTRUCT(UIPanGestureRecognizer);
  @autoreleasepool {
    UIPanGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIPanGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIPanGestureRecognizer alloc] init];
    }
    if (self) {
      NUIPanGestureRecognizer *wrapper = new NUIPanGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPanGestureRecognizer::New: invalid arguments");
    }
  }
}

#include "NUIView.h"

NAN_METHOD(NUIPanGestureRecognizer::translationInView) {
  JS_UNWRAP(UIPanGestureRecognizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self translationInView: view]));
  }
}

NAN_METHOD(NUIPanGestureRecognizer::setTranslationInView) {
  JS_UNWRAP(UIPanGestureRecognizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, translation);
    declare_nullable_pointer(UIView, view);
    [self setTranslation: translation inView: view];
  }
}

NAN_METHOD(NUIPanGestureRecognizer::velocityInView) {
  JS_UNWRAP(UIPanGestureRecognizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self velocityInView: view]));
  }
}

NAN_GETTER(NUIPanGestureRecognizer::minimumNumberOfTouchesGetter) {
  JS_UNWRAP(UIPanGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self minimumNumberOfTouches]));
  }
}

NAN_SETTER(NUIPanGestureRecognizer::minimumNumberOfTouchesSetter) {
  JS_UNWRAP(UIPanGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMinimumNumberOfTouches: input];
  }
}

NAN_GETTER(NUIPanGestureRecognizer::maximumNumberOfTouchesGetter) {
  JS_UNWRAP(UIPanGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maximumNumberOfTouches]));
  }
}

NAN_SETTER(NUIPanGestureRecognizer::maximumNumberOfTouchesSetter) {
  JS_UNWRAP(UIPanGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMaximumNumberOfTouches: input];
  }
}

JS_INIT_DEFAULT(UIScreenEdgePanGestureRecognizer);
JS_INIT_CLASS(UIScreenEdgePanGestureRecognizer, UIPanGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(edges);
  JS_INIT_CTOR(UIScreenEdgePanGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIScreenEdgePanGestureRecognizer, UIPanGestureRecognizer);

NAN_METHOD(NUIScreenEdgePanGestureRecognizer::New) {
  JS_RECONSTRUCT(UIScreenEdgePanGestureRecognizer);
  @autoreleasepool {
    UIScreenEdgePanGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIScreenEdgePanGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIScreenEdgePanGestureRecognizer alloc] init];
    }
    if (self) {
      NUIScreenEdgePanGestureRecognizer *wrapper = new NUIScreenEdgePanGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIScreenEdgePanGestureRecognizer::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIScreenEdgePanGestureRecognizer::edgesGetter) {
  JS_UNWRAP(UIScreenEdgePanGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIRectEdge([self edges]));
  }
}

NAN_SETTER(NUIScreenEdgePanGestureRecognizer::edgesSetter) {
  JS_UNWRAP(UIScreenEdgePanGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIRectEdge, input);
    [self setEdges: input];
  }
}

JS_INIT_DEFAULT(UILongPressGestureRecognizer);
JS_INIT_CLASS(UILongPressGestureRecognizer, UIGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(numberOfTapsRequired);
  JS_ASSIGN_PROTO_PROP(numberOfTouchesRequired);
  JS_ASSIGN_PROTO_PROP(minimumPressDuration);
  JS_ASSIGN_PROTO_PROP(allowableMovement);
  JS_INIT_CTOR(UILongPressGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UILongPressGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUILongPressGestureRecognizer::New) {
  JS_RECONSTRUCT(UILongPressGestureRecognizer);
  @autoreleasepool {
    UILongPressGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UILongPressGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UILongPressGestureRecognizer alloc] init];
    }
    if (self) {
      NUILongPressGestureRecognizer *wrapper = new NUILongPressGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UILongPressGestureRecognizer::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUILongPressGestureRecognizer::numberOfTapsRequiredGetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfTapsRequired]));
  }
}

NAN_SETTER(NUILongPressGestureRecognizer::numberOfTapsRequiredSetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setNumberOfTapsRequired: input];
  }
}

NAN_GETTER(NUILongPressGestureRecognizer::numberOfTouchesRequiredGetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfTouchesRequired]));
  }
}

NAN_SETTER(NUILongPressGestureRecognizer::numberOfTouchesRequiredSetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setNumberOfTouchesRequired: input];
  }
}

NAN_GETTER(NUILongPressGestureRecognizer::minimumPressDurationGetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self minimumPressDuration]));
  }
}

NAN_SETTER(NUILongPressGestureRecognizer::minimumPressDurationSetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setMinimumPressDuration: input];
  }
}

NAN_GETTER(NUILongPressGestureRecognizer::allowableMovementGetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self allowableMovement]));
  }
}

NAN_SETTER(NUILongPressGestureRecognizer::allowableMovementSetter) {
  JS_UNWRAP(UILongPressGestureRecognizer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setAllowableMovement: input];
  }
}
