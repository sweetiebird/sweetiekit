//
//  NUITextFieldDelegate.mm
//
//  Created by Shawn Presser on 6/20/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextFieldDelegate.h"

#define instancetype UITextFieldDelegate
#define js_value_instancetype js_value_UITextFieldDelegate

NUITextFieldDelegate::NUITextFieldDelegate() {}
NUITextFieldDelegate::~NUITextFieldDelegate() {}

JS_INIT_CLASS(UITextFieldDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(textFieldShouldBeginEditing);
  JS_ASSIGN_PROTO_PROP(textFieldDidBeginEditing);
  JS_ASSIGN_PROTO_PROP(textFieldShouldEndEditing);
  JS_ASSIGN_PROTO_PROP(textFieldDidEndEditing);
  JS_ASSIGN_PROTO_PROP(textFieldDidEndEditingReason);
  JS_ASSIGN_PROTO_PROP(textFieldShouldChangeCharactersInRangeReplacementString);
  JS_ASSIGN_PROTO_PROP(textFieldShouldClear);
  JS_ASSIGN_PROTO_PROP(textFieldShouldReturn);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextFieldDelegate, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextFieldDelegate, NSObject);

NAN_METHOD(NUITextFieldDelegate::New) {
  JS_RECONSTRUCT(UITextFieldDelegate);
  @autoreleasepool {
    UITextFieldDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextFieldDelegate *)(info[0].As<External>()->Value());
    } else if (info[0]->IsObject()) {
      Local<Value> that(JS_NEW(NUITextFieldDelegate, 0, nullptr));
      sweetiekit::JSFunction objectAssign(JS_OBJ(JS_GLOBAL()->Get(JS_STR("Object")))->Get(JS_STR("assign")));
      objectAssign("NUITextFieldDelegate::New", that, info[0]);
      JS_SET_RETURN(that);
      return;
    } else if (info.Length() <= 0) {
      self = [[UITextFieldDelegate alloc] init];
    }
    if (self) {
      NUITextFieldDelegate *wrapper = new NUITextFieldDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextFieldDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(UITextFieldDelegate, textFieldShouldBeginEditing);
DELEGATE_PROP(UITextFieldDelegate, textFieldDidBeginEditing);
DELEGATE_PROP(UITextFieldDelegate, textFieldShouldEndEditing);
DELEGATE_PROP(UITextFieldDelegate, textFieldDidEndEditing);
DELEGATE_PROP(UITextFieldDelegate, textFieldDidEndEditingReason);
DELEGATE_PROP(UITextFieldDelegate, textFieldShouldChangeCharactersInRangeReplacementString);
DELEGATE_PROP(UITextFieldDelegate, textFieldShouldClear);
DELEGATE_PROP(UITextFieldDelegate, textFieldShouldReturn);

#include "NUITextField.h"

@implementation UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField         // return NO to disallow editing.
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), textFieldShouldBeginEditing,
    js_value_UITextField(textField));
  return result;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField            // became first responder
{
  call_delegate_async(noop(), textFieldDidBeginEditing,
    js_value_UITextField(textField));
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField           // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), textFieldShouldEndEditing,
    js_value_UITextField(textField));
  return result;
}

- (void)textFieldDidEndEditing:(UITextField *)textField              // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
{
  call_delegate_async(noop(), textFieldDidEndEditing,
    js_value_UITextField(textField));
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0)  // if implemented, called in place of textFieldDidEndEditing:
{
  call_delegate_async(noop(), textFieldDidEndEditingReason,
    js_value_UITextField(textField),
    js_value_UITextFieldDidEndEditingReason(reason));
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string    // return NO to not change text
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), textFieldShouldChangeCharactersInRangeReplacementString,
    js_value_UITextField(textField),
    js_value_NSRange(range),
    js_value_NSString(string));
  return result;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField                // called when clear button pressed. return NO to ignore (no notifications)
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), textFieldShouldClear,
    js_value_UITextField(textField));
  return result;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField               // called when 'return' key pressed. return NO to ignore.
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), textFieldShouldReturn,
    js_value_UITextField(textField));
  return result;
}


@end
