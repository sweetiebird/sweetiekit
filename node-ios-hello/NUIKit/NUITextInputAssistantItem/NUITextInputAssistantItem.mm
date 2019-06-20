//
//  NUITextInputAssistantItem.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextInputAssistantItem.h"

#define instancetype UITextInputAssistantItem
#define js_value_instancetype js_value_UITextInputAssistantItem

NUITextInputAssistantItem::NUITextInputAssistantItem() {}
NUITextInputAssistantItem::~NUITextInputAssistantItem() {}

JS_INIT_CLASS(UITextInputAssistantItem, NSObject);
// UITextInputAssistantItem
  JS_ASSIGN_PROTO_PROP(allowsHidingShortcuts);
  JS_ASSIGN_PROTO_PROP(leadingBarButtonGroups);
  JS_ASSIGN_PROTO_PROP(trailingBarButtonGroups);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextInputAssistantItem, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextInputAssistantItem, NSObject);

NAN_METHOD(NUITextInputAssistantItem::New) {
  JS_RECONSTRUCT(UITextInputAssistantItem);
  @autoreleasepool {
    UITextInputAssistantItem* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextInputAssistantItem *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextInputAssistantItem alloc] init];
    }
    if (self) {
      NUITextInputAssistantItem *wrapper = new NUITextInputAssistantItem();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextInputAssistantItem::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUITextInputAssistantItem::allowsHidingShortcutsGetter) {
  JS_UNWRAP(UITextInputAssistantItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsHidingShortcuts]));
  }
}

NAN_SETTER(NUITextInputAssistantItem::allowsHidingShortcutsSetter) {
  JS_UNWRAP(UITextInputAssistantItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsHidingShortcuts: input];
  }
}

NAN_GETTER(NUITextInputAssistantItem::leadingBarButtonGroupsGetter) {
  JS_UNWRAP(UITextInputAssistantItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIBarButtonItemGroup*>([self leadingBarButtonGroups]));
  }
}

NAN_SETTER(NUITextInputAssistantItem::leadingBarButtonGroupsSetter) {
  JS_UNWRAP(UITextInputAssistantItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIBarButtonItemGroup*>, input);
    [self setLeadingBarButtonGroups: input];
  }
}

NAN_GETTER(NUITextInputAssistantItem::trailingBarButtonGroupsGetter) {
  JS_UNWRAP(UITextInputAssistantItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIBarButtonItemGroup*>([self trailingBarButtonGroups]));
  }
}

NAN_SETTER(NUITextInputAssistantItem::trailingBarButtonGroupsSetter) {
  JS_UNWRAP(UITextInputAssistantItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIBarButtonItemGroup*>, input);
    [self setTrailingBarButtonGroups: input];
  }
}
