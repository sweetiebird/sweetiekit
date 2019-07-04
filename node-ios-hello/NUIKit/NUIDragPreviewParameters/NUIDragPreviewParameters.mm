//
//  NUIDragPreviewParameters.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragPreviewParameters.h"

#define instancetype UIDragPreviewParameters
#define js_value_instancetype js_value_UIDragPreviewParameters

NUIDragPreviewParameters::NUIDragPreviewParameters() {}
NUIDragPreviewParameters::~NUIDragPreviewParameters() {}

JS_INIT_CLASS(UIDragPreviewParameters, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithTextLineRects);
  JS_ASSIGN_PROTO_PROP(visiblePath);
  JS_ASSIGN_PROTO_PROP(backgroundColor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragPreviewParameters, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIDragPreviewParameters, NSObject);

NAN_METHOD(NUIDragPreviewParameters::New) {
  JS_RECONSTRUCT(UIDragPreviewParameters);
  @autoreleasepool {
    UIDragPreviewParameters* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDragPreviewParameters *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIDragPreviewParameters alloc] init];
    }
    if (self) {
      NUIDragPreviewParameters *wrapper = new NUIDragPreviewParameters();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragPreviewParameters::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIDragPreviewParameters::initWithTextLineRects) {
  JS_UNWRAP_OR_ALLOC(UIDragPreviewParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSValue*>, textLineRects);
    JS_SET_RETURN(js_value_instancetype([self initWithTextLineRects: textLineRects]));
  }
}

#include "NUIBezierPath.h"

NAN_GETTER(NUIDragPreviewParameters::visiblePathGetter) {
  JS_UNWRAP(UIDragPreviewParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBezierPath([self visiblePath]));
  }
}

NAN_SETTER(NUIDragPreviewParameters::visiblePathSetter) {
  JS_UNWRAP(UIDragPreviewParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIBezierPath, input);
    [self setVisiblePath: input];
  }
}

NAN_GETTER(NUIDragPreviewParameters::backgroundColorGetter) {
  JS_UNWRAP(UIDragPreviewParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self backgroundColor]));
  }
}

NAN_SETTER(NUIDragPreviewParameters::backgroundColorSetter) {
  JS_UNWRAP(UIDragPreviewParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setBackgroundColor: input];
  }
}
