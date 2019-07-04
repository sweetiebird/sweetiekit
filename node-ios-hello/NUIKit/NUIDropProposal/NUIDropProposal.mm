//
//  NUIDropProposal.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDropProposal.h"

#define instancetype UIDropProposal
#define js_value_instancetype js_value_UIDropProposal

NUIDropProposal::NUIDropProposal() {}
NUIDropProposal::~NUIDropProposal() {}

JS_INIT_CLASS(UIDropProposal, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithDropOperation);
  JS_ASSIGN_PROTO_PROP_READONLY(operation);
  JS_ASSIGN_PROTO_PROP(isPrecise);
  JS_ASSIGN_PROTO_PROP(prefersFullSizePreview);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDropProposal, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIDropProposal, NSObject);

NAN_METHOD(NUIDropProposal::New) {
  JS_RECONSTRUCT(UIDropProposal);
  @autoreleasepool {
    UIDropProposal* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDropProposal *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIDropProposal *wrapper = new NUIDropProposal();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDropProposal::New: invalid arguments");
    }
  }
}

#include "NUIDropInteraction.h"

NAN_METHOD(NUIDropProposal::initWithDropOperation) {
  JS_UNWRAP_OR_ALLOC(UIDropProposal, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDropOperation, operation);
    JS_SET_RETURN(js_value_instancetype([self initWithDropOperation: operation]));
  }
}

NAN_GETTER(NUIDropProposal::operationGetter) {
  JS_UNWRAP(UIDropProposal, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDropOperation([self operation]));
  }
}

NAN_GETTER(NUIDropProposal::isPreciseGetter) {
  JS_UNWRAP(UIDropProposal, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPrecise]));
  }
}

NAN_SETTER(NUIDropProposal::isPreciseSetter) {
  JS_UNWRAP(UIDropProposal, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPrecise: input];
  }
}

NAN_GETTER(NUIDropProposal::prefersFullSizePreviewGetter) {
  JS_UNWRAP(UIDropProposal, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self prefersFullSizePreview]));
  }
}

NAN_SETTER(NUIDropProposal::prefersFullSizePreviewSetter) {
  JS_UNWRAP(UIDropProposal, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPrefersFullSizePreview: input];
  }
}
