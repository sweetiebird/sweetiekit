//
//  NUIInputViewController.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIInputViewController_h
#define NUIInputViewController_h    

#include "NUIViewController.h"

#define js_value_UIInputViewController(x) js_value_wrapper(x, UIInputViewController)
#define to_value_UIInputViewController(x) to_value_wrapper(x, UIInputViewController)
#define is_value_UIInputViewController(x) is_value_wrapper(x, UIInputViewController)

JS_WRAP_CLASS(UIInputViewController, UIViewController);
#if TODO
// UITextDocumentProxy
  JS_METHOD(adjustTextPositionByCharacterOffset);
#endif
// UIInputViewController
  JS_METHOD(dismissKeyboard);
  JS_METHOD(advanceToNextInputMode);
  JS_METHOD(handleInputModeListFromViewWithEvent);
  JS_METHOD(requestSupplementaryLexiconWithCompletion);
#if TODO
// UITextDocumentProxy
  JS_PROP_READONLY(documentContextBeforeInput);
  JS_PROP_READONLY(documentContextAfterInput);
  JS_PROP_READONLY(selectedText);
  JS_PROP_READONLY(documentInputMode);
  JS_PROP_READONLY(documentIdentifier);
#endif
// UIInputViewController
  JS_PROP(inputView);
  JS_PROP_READONLY(textDocumentProxy);
  JS_PROP(primaryLanguage);
  JS_PROP(hasDictationKey);
  JS_PROP_READONLY(hasFullAccess);
  JS_PROP_READONLY(needsInputModeSwitchKey);
JS_WRAP_CLASS_END(UIInputViewController);

#endif /* NUIInputViewController_h */
