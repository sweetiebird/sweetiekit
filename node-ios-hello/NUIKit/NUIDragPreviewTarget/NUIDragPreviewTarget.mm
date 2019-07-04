//
//  NUIDragPreviewTarget.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragPreviewTarget.h"

#define instancetype UIDragPreviewTarget
#define js_value_instancetype js_value_UIDragPreviewTarget

NUIDragPreviewTarget::NUIDragPreviewTarget() {}
NUIDragPreviewTarget::~NUIDragPreviewTarget() {}

JS_INIT_CLASS(UIDragPreviewTarget, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithContainerCenterTransform);
  JS_ASSIGN_PROTO_METHOD(initWithContainerCenter);
  JS_ASSIGN_PROTO_PROP_READONLY(container);
  JS_ASSIGN_PROTO_PROP_READONLY(center);
  JS_ASSIGN_PROTO_PROP_READONLY(transform);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragPreviewTarget, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIDragPreviewTarget, NSObject);

NAN_METHOD(NUIDragPreviewTarget::New) {
  JS_RECONSTRUCT(UIDragPreviewTarget);
  @autoreleasepool {
    UIDragPreviewTarget* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDragPreviewTarget *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIDragPreviewTarget *wrapper = new NUIDragPreviewTarget();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragPreviewTarget::New: invalid arguments");
    }
  }
}

#include "NUIView.h"

NAN_METHOD(NUIDragPreviewTarget::initWithContainerCenterTransform) {
  JS_UNWRAP_OR_ALLOC(UIDragPreviewTarget, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, container);
    declare_value(CGPoint, center);
    declare_value(CGAffineTransform, transform);
    JS_SET_RETURN(js_value_instancetype([self initWithContainer: container center: center transform: transform]));
  }
}

NAN_METHOD(NUIDragPreviewTarget::initWithContainerCenter) {
  JS_UNWRAP_OR_ALLOC(UIDragPreviewTarget, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, container);
    declare_value(CGPoint, center);
    JS_SET_RETURN(js_value_instancetype([self initWithContainer: container center: center]));
  }
}

NAN_GETTER(NUIDragPreviewTarget::containerGetter) {
  JS_UNWRAP(UIDragPreviewTarget, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self container]));
  }
}

NAN_GETTER(NUIDragPreviewTarget::centerGetter) {
  JS_UNWRAP(UIDragPreviewTarget, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self center]));
  }
}

NAN_GETTER(NUIDragPreviewTarget::transformGetter) {
  JS_UNWRAP(UIDragPreviewTarget, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGAffineTransform([self transform]));
  }
}
