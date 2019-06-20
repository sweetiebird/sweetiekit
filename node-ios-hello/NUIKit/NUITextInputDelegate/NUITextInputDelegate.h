//
//  NUITextInputDelegate.h
//
//  Created by Shawn Presser on 6/20/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextInputDelegate_h
#define NUITextInputDelegate_h    

#include "NNSObject.h"

#define js_value_UITextInputDelegate(x) js_value_wrapper(x, UITextInputDelegate)
#define to_value_UITextInputDelegate(x) to_value_wrapper(x, UITextInputDelegate)
#define is_value_UITextInputDelegate(x) is_value_wrapper(x, UITextInputDelegate)

JS_WRAP_CLASS(UITextInputDelegate, NSObject);
  JS_PROP(selectionWillChange);
  JS_PROP(selectionDidChange);
  JS_PROP(textWillChange);
  JS_PROP(textDidChange);
JS_WRAP_CLASS_END(UITextInputDelegate);

#if __OBJC__
@interface UITextInputDelegate : NSObject<UITextInputDelegate>

- (void)selectionWillChange:(nullable id <UITextInput>)textInput;
- (void)selectionDidChange:(nullable id <UITextInput>)textInput;
- (void)textWillChange:(nullable id <UITextInput>)textInput;
- (void)textDidChange:(nullable id <UITextInput>)textInput;

@end
#endif

#endif /* NUITextInputDelegate_h */
