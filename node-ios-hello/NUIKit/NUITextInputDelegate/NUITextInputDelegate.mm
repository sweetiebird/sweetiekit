//
//  NUITextInputDelegate.mm
//
//  Created by Shawn Presser on 6/20/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextInputDelegate.h"

#define instancetype UITextInputDelegate
#define js_value_instancetype js_value_UITextInputDelegate

NUITextInputDelegate::NUITextInputDelegate() {}
NUITextInputDelegate::~NUITextInputDelegate() {}

JS_INIT_CLASS(UITextInputDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(selectionWillChange);
  JS_ASSIGN_PROTO_PROP(selectionDidChange);
  JS_ASSIGN_PROTO_PROP(textWillChange);
  JS_ASSIGN_PROTO_PROP(textDidChange);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextInputDelegate, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextInputDelegate, NSObject);

NAN_METHOD(NUITextInputDelegate::New) {
  JS_RECONSTRUCT(UITextInputDelegate);
  @autoreleasepool {
    UITextInputDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextInputDelegate *)(info[0].As<External>()->Value());
    } else if (info[0]->IsObject()) {
      Local<Value> that(JS_NEW(NUITextInputDelegate, 0, nullptr));
      sweetiekit::JSFunction objectAssign(JS_OBJ(JS_GLOBAL()->Get(JS_STR("Object")))->Get(JS_STR("assign")));
      objectAssign("NUITextInputDelegate::New", that, info[0]);
      JS_SET_RETURN(that);
      return;
    } else if (info.Length() <= 0) {
      self = [[UITextInputDelegate alloc] init];
    }
    if (self) {
      NUITextInputDelegate *wrapper = new NUITextInputDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextInputDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(UITextInputDelegate, selectionWillChange);
DELEGATE_PROP(UITextInputDelegate, selectionDidChange);
DELEGATE_PROP(UITextInputDelegate, textWillChange);
DELEGATE_PROP(UITextInputDelegate, textDidChange);

#include "NUITextInput.h"

@implementation UITextInputDelegate

- (void)selectionWillChange:(nullable id <UITextInput>)textInput
{
  call_delegate_async(noop(), selectionWillChange,
    js_value_UITextInput(textInput));
}

- (void)selectionDidChange:(nullable id <UITextInput>)textInput
{
  call_delegate_async(noop(), selectionDidChange,
    js_value_UITextInput(textInput));
}

- (void)textWillChange:(nullable id <UITextInput>)textInput
{
  call_delegate_async(noop(), textWillChange,
    js_value_UITextInput(textInput));
}

- (void)textDidChange:(nullable id <UITextInput>)textInput
{
  call_delegate_async(noop(), textDidChange,
    js_value_UITextInput(textInput));
}

@end
