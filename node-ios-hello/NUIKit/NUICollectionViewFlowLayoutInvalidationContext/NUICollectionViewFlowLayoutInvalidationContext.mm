//
//  NUICollectionViewFlowLayoutInvalidationContext.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewFlowLayoutInvalidationContext.h"

#define instancetype UICollectionViewFlowLayoutInvalidationContext
#define js_value_instancetype js_value_UICollectionViewFlowLayoutInvalidationContext

NUICollectionViewFlowLayoutInvalidationContext::NUICollectionViewFlowLayoutInvalidationContext() {}
NUICollectionViewFlowLayoutInvalidationContext::~NUICollectionViewFlowLayoutInvalidationContext() {}

JS_INIT_CLASS(UICollectionViewFlowLayoutInvalidationContext, UICollectionViewLayoutInvalidationContext);
  JS_ASSIGN_PROTO_PROP(invalidateFlowLayoutDelegateMetrics);
  JS_ASSIGN_PROTO_PROP(invalidateFlowLayoutAttributes);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewFlowLayoutInvalidationContext, UICollectionViewLayoutInvalidationContext);
  // constant values (exports)
JS_INIT_CLASS_END(UICollectionViewFlowLayoutInvalidationContext, UICollectionViewLayoutInvalidationContext);

NAN_METHOD(NUICollectionViewFlowLayoutInvalidationContext::New) {
  JS_RECONSTRUCT(UICollectionViewFlowLayoutInvalidationContext);
  @autoreleasepool {
    UICollectionViewFlowLayoutInvalidationContext* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionViewFlowLayoutInvalidationContext *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UICollectionViewFlowLayoutInvalidationContext alloc] init];
    }
    if (self) {
      NUICollectionViewFlowLayoutInvalidationContext *wrapper = new NUICollectionViewFlowLayoutInvalidationContext();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionViewFlowLayoutInvalidationContext::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUICollectionViewFlowLayoutInvalidationContext::invalidateFlowLayoutDelegateMetricsGetter) {
  JS_UNWRAP(UICollectionViewFlowLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self invalidateFlowLayoutDelegateMetrics]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayoutInvalidationContext::invalidateFlowLayoutDelegateMetricsSetter) {
  JS_UNWRAP(UICollectionViewFlowLayoutInvalidationContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInvalidateFlowLayoutDelegateMetrics: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayoutInvalidationContext::invalidateFlowLayoutAttributesGetter) {
  JS_UNWRAP(UICollectionViewFlowLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self invalidateFlowLayoutAttributes]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayoutInvalidationContext::invalidateFlowLayoutAttributesSetter) {
  JS_UNWRAP(UICollectionViewFlowLayoutInvalidationContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInvalidateFlowLayoutAttributes: input];
  }
}
