//
//  NUITargetedDragPreview.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITargetedDragPreview.h"

#define instancetype UITargetedDragPreview
#define js_value_instancetype js_value_UITargetedDragPreview

NUITargetedDragPreview::NUITargetedDragPreview() {}
NUITargetedDragPreview::~NUITargetedDragPreview() {}

JS_INIT_CLASS(UITargetedDragPreview, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithViewParametersTarget);
  JS_ASSIGN_PROTO_METHOD(initWithViewParameters);
  JS_ASSIGN_PROTO_METHOD(initWithView);
  JS_ASSIGN_PROTO_METHOD(retargetedPreviewWithTarget);
  JS_ASSIGN_PROTO_PROP_READONLY(target);
  JS_ASSIGN_PROTO_PROP_READONLY(view);
  JS_ASSIGN_PROTO_PROP_READONLY(parameters);
  JS_ASSIGN_PROTO_PROP_READONLY(size);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITargetedDragPreview, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITargetedDragPreview, NSObject);

NAN_METHOD(NUITargetedDragPreview::New) {
  JS_RECONSTRUCT(UITargetedDragPreview);
  @autoreleasepool {
    UITargetedDragPreview* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITargetedDragPreview *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUITargetedDragPreview *wrapper = new NUITargetedDragPreview();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITargetedDragPreview::New: invalid arguments");
    }
  }
}

#include "NUIView.h"
#include "NUIDragPreviewParameters.h"
#include "NUIDragPreviewTarget.h"

NAN_METHOD(NUITargetedDragPreview::initWithViewParametersTarget) {
  JS_UNWRAP_OR_ALLOC(UITargetedDragPreview, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    declare_pointer(UIDragPreviewParameters, parameters);
    declare_pointer(UIDragPreviewTarget, target);
    JS_SET_RETURN(js_value_instancetype([self initWithView: view parameters: parameters target: target]));
  }
}

NAN_METHOD(NUITargetedDragPreview::initWithViewParameters) {
  JS_UNWRAP_OR_ALLOC(UITargetedDragPreview, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    declare_pointer(UIDragPreviewParameters, parameters);
    JS_SET_RETURN(js_value_instancetype([self initWithView: view parameters: parameters]));
  }
}

NAN_METHOD(NUITargetedDragPreview::initWithView) {
  JS_UNWRAP_OR_ALLOC(UITargetedDragPreview, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_instancetype([self initWithView: view]));
  }
}

NAN_METHOD(NUITargetedDragPreview::retargetedPreviewWithTarget) {
  JS_UNWRAP(UITargetedDragPreview, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIDragPreviewTarget, newTarget);
    JS_SET_RETURN(js_value_UITargetedDragPreview([self retargetedPreviewWithTarget: newTarget]));
  }
}

NAN_GETTER(NUITargetedDragPreview::targetGetter) {
  JS_UNWRAP(UITargetedDragPreview, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragPreviewTarget([self target]));
  }
}

NAN_GETTER(NUITargetedDragPreview::viewGetter) {
  JS_UNWRAP(UITargetedDragPreview, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self view]));
  }
}

NAN_GETTER(NUITargetedDragPreview::parametersGetter) {
  JS_UNWRAP(UITargetedDragPreview, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragPreviewParameters([self parameters]));
  }
}

NAN_GETTER(NUITargetedDragPreview::sizeGetter) {
  JS_UNWRAP(UITargetedDragPreview, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self size]));
  }
}
