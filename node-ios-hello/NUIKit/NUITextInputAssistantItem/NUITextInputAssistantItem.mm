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
