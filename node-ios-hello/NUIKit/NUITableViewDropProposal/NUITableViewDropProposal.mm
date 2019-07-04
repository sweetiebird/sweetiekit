//
//  NUITableViewDropProposal.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewDropProposal.h"

#define instancetype UITableViewDropProposal
#define js_value_instancetype js_value_UITableViewDropProposal

NUITableViewDropProposal::NUITableViewDropProposal() {}
NUITableViewDropProposal::~NUITableViewDropProposal() {}

JS_INIT_CLASS(UITableViewDropProposal, UIDropProposal);
  JS_ASSIGN_PROTO_METHOD(initWithDropOperationIntent);
  JS_ASSIGN_PROTO_PROP_READONLY(intent);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewDropProposal, UIDropProposal);
  // constant values (exports)
JS_INIT_CLASS_END(UITableViewDropProposal, UIDropProposal);

NAN_METHOD(NUITableViewDropProposal::New) {
  JS_RECONSTRUCT(UITableViewDropProposal);
  @autoreleasepool {
    UITableViewDropProposal* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewDropProposal *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUITableViewDropProposal *wrapper = new NUITableViewDropProposal();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewDropProposal::New: invalid arguments");
    }
  }
}

#include "NUIDropInteraction.h"
#include "NUITableView.h"

NAN_METHOD(NUITableViewDropProposal::initWithDropOperationIntent) {
  JS_UNWRAP_OR_ALLOC(UITableViewDropProposal, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDropOperation, operation);
    declare_value(UITableViewDropIntent, intent);
    JS_SET_RETURN(js_value_instancetype([self initWithDropOperation: operation intent: intent]));
  }
}

NAN_GETTER(NUITableViewDropProposal::intentGetter) {
  JS_UNWRAP(UITableViewDropProposal, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewDropIntent([self intent]));
  }
}
