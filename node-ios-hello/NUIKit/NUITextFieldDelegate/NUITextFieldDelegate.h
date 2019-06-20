//
//  NUITextFieldDelegate.h
//
//  Created by Shawn Presser on 6/20/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextFieldDelegate_h
#define NUITextFieldDelegate_h    

#include "NNSObject.h"

#define js_value_UITextFieldDelegate(x) js_value_wrapper(x, UITextFieldDelegate)
#define to_value_UITextFieldDelegate(x) to_value_wrapper(x, UITextFieldDelegate)
#define is_value_UITextFieldDelegate(x) is_value_wrapper(x, UITextFieldDelegate)

JS_WRAP_CLASS(UITextFieldDelegate, NSObject);
  JS_PROP(textFieldShouldBeginEditing);
  JS_PROP(textFieldDidBeginEditing);
  JS_PROP(textFieldShouldEndEditing);
  JS_PROP(textFieldDidEndEditing);
  JS_PROP(textFieldDidEndEditingReason);
  JS_PROP(textFieldShouldChangeCharactersInRangeReplacementString);
  JS_PROP(textFieldShouldClear);
  JS_PROP(textFieldShouldReturn);
JS_WRAP_CLASS_END(UITextFieldDelegate);

#if __OBJC__
@interface UITextFieldDelegate : NSObject<UITextFieldDelegate>

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0); // if implemented, called in place of textFieldDidEndEditing:

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text

- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.

@end
#endif

#endif /* NUITextFieldDelegate_h */
