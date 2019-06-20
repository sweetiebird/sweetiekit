//
//  NUITextField.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextField.h"
#include "NUIFont.h"

#define instancetype UITextField
#define js_value_instancetype js_value_UITextField

NUITextField::NUITextField()
{
}
NUITextField::~NUITextField()
{
}

#include "NNSNotification.h"
#include "NUITextInput.h"

JS_INIT_CLASS(UITextField, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(callback);
  JS_ASSIGN_PROTO_PROP(autocorrectionType);
  
  JS_ASSIGN_PROTO_METHOD(borderRectForBounds);
  JS_ASSIGN_PROTO_METHOD(textRectForBounds);
  JS_ASSIGN_PROTO_METHOD(placeholderRectForBounds);
  JS_ASSIGN_PROTO_METHOD(editingRectForBounds);
  JS_ASSIGN_PROTO_METHOD(clearButtonRectForBounds);
  JS_ASSIGN_PROTO_METHOD(leftViewRectForBounds);
  JS_ASSIGN_PROTO_METHOD(rightViewRectForBounds);
  JS_ASSIGN_PROTO_METHOD(drawTextInRect);
  JS_ASSIGN_PROTO_METHOD(drawPlaceholderInRect);
  
  JS_ASSIGN_PROTO_PROP(text);
  JS_ASSIGN_PROTO_PROP(attributedText);
  JS_ASSIGN_PROTO_PROP(textColor);
  JS_ASSIGN_PROTO_PROP(font);
  JS_ASSIGN_PROTO_PROP(textAlignment);
  JS_ASSIGN_PROTO_PROP(borderStyle);
  JS_ASSIGN_PROTO_PROP(defaultTextAttributes);
  JS_ASSIGN_PROTO_PROP(placeholder);
  JS_ASSIGN_PROTO_PROP(attributedPlaceholder);
  JS_ASSIGN_PROTO_PROP(clearsOnBeginEditing);
  JS_ASSIGN_PROTO_PROP(adjustsFontSizeToFitWidth);
  JS_ASSIGN_PROTO_PROP(minimumFontSize);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(background);
  JS_ASSIGN_PROTO_PROP(disabledBackground);
  JS_ASSIGN_PROTO_PROP_READONLY(isEditing);
  JS_ASSIGN_PROTO_PROP(allowsEditingTextAttributes);
  JS_ASSIGN_PROTO_PROP(typingAttributes);
  JS_ASSIGN_PROTO_PROP(clearButtonMode);
  JS_ASSIGN_PROTO_PROP(leftView);
  JS_ASSIGN_PROTO_PROP(leftViewMode);
  JS_ASSIGN_PROTO_PROP(rightView);
  JS_ASSIGN_PROTO_PROP(rightViewMode);
  JS_ASSIGN_PROTO_PROP(inputView);
  JS_ASSIGN_PROTO_PROP(inputAccessoryView);
  JS_ASSIGN_PROTO_PROP(clearsOnInsertion);

// UITextField
  JS_ASSIGN_PROTO_PROP(autocapitalizationType);
  JS_ASSIGN_PROTO_PROP(autocorrectionType);
  JS_ASSIGN_PROTO_PROP(spellCheckingType);
  JS_ASSIGN_PROTO_PROP(smartQuotesType);
  JS_ASSIGN_PROTO_PROP(smartDashesType);
  JS_ASSIGN_PROTO_PROP(smartInsertDeleteType);
  JS_ASSIGN_PROTO_PROP(keyboardType);
  JS_ASSIGN_PROTO_PROP(keyboardAppearance);
  JS_ASSIGN_PROTO_PROP(returnKeyType);
  JS_ASSIGN_PROTO_PROP(enablesReturnKeyAutomatically);
  JS_ASSIGN_PROTO_PROP(isSecureTextEntry);
  JS_ASSIGN_PROTO_PROP(textContentType);
  JS_ASSIGN_PROTO_PROP(passwordRules);
  
  
  {
      #if TODO
      // UIKeyInput
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::hasText, "hasText");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::insertText, "insertText");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::deleteBackward, "deleteBackward");
      #endif
      // UITextInput
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::textInRange, "textInRange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::replaceRangeWithText, "replaceRangeWithText");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::setMarkedTextSelectedRange, "setMarkedTextSelectedRange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::unmarkText, "unmarkText");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::textRangeFromPositionToPosition, "textRangeFromPositionToPosition");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::positionFromPositionOffset, "positionFromPositionOffset");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::positionFromPositionInDirectionOffset, "positionFromPositionInDirectionOffset");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::comparePositionToPosition, "comparePositionToPosition");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::offsetFromPositionToPosition, "offsetFromPositionToPosition");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::positionWithinRangeFarthestInDirection, "positionWithinRangeFarthestInDirection");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::characterRangeByExtendingPositionInDirection, "characterRangeByExtendingPositionInDirection");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::baseWritingDirectionForPositionInDirection, "baseWritingDirectionForPositionInDirection");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::setBaseWritingDirectionForRange, "setBaseWritingDirectionForRange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::firstRectForRange, "firstRectForRange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::caretRectForPosition, "caretRectForPosition");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::selectionRectsForRange, "selectionRectsForRange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::closestPositionToPoint, "closestPositionToPoint");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::closestPositionToPointWithinRange, "closestPositionToPointWithinRange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::characterRangeAtPoint, "characterRangeAtPoint");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::shouldChangeTextInRangeReplacementText, "shouldChangeTextInRangeReplacementText");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::textStylingAtPositionInDirection, "textStylingAtPositionInDirection");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::positionWithinRangeAtCharacterOffset, "positionWithinRangeAtCharacterOffset");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::characterOffsetOfPositionWithinRange, "characterOffsetOfPositionWithinRange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::insertDictationResult, "insertDictationResult");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::dictationRecordingDidEnd, "dictationRecordingDidEnd");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::dictationRecognitionFailed, "dictationRecognitionFailed");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::insertDictationResultPlaceholder, "insertDictationResultPlaceholder");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::frameForDictationResultPlaceholder, "frameForDictationResultPlaceholder");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::removeDictationResultPlaceholderWillInsertResult, "removeDictationResultPlaceholderWillInsertResult");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::beginFloatingCursorAtPoint, "beginFloatingCursorAtPoint");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::updateFloatingCursorAtPoint, "updateFloatingCursorAtPoint");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::endFloatingCursor, "endFloatingCursor");
      #if TODO
      // UITextInputDelegate
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::selectionWillChange, "selectionWillChange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::selectionDidChange, "selectionDidChange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::textWillChange, "textWillChange");
        JS_ASSIGN_PROTO_METHOD_AS(NUITextInput::textDidChange, "textDidChange");
      // UIKeyInput
        JS_ASSIGN_PROTO_PROP_READONLY_AS(NUITextInput::hasText, "hasText");
      #endif
      // UITextInput
        JS_ASSIGN_PROTO_PROP_AS(NUITextInput::selectedTextRange, "selectedTextRange");
        JS_ASSIGN_PROTO_PROP_READONLY_AS(NUITextInput::markedTextRange, "markedTextRange");
        JS_ASSIGN_PROTO_PROP_AS(NUITextInput::markedTextStyle, "markedTextStyle");
        JS_ASSIGN_PROTO_PROP_READONLY_AS(NUITextInput::beginningOfDocument, "beginningOfDocument");
        JS_ASSIGN_PROTO_PROP_READONLY_AS(NUITextInput::endOfDocument, "endOfDocument");
        JS_ASSIGN_PROTO_PROP_AS(NUITextInput::inputDelegate, "inputDelegate");
        JS_ASSIGN_PROTO_PROP_READONLY_AS(NUITextInput::tokenizer, "tokenizer");
        JS_ASSIGN_PROTO_PROP_READONLY_AS(NUITextInput::textInputView, "textInputView");
        JS_ASSIGN_PROTO_PROP_AS(NUITextInput::selectionAffinity, "selectionAffinity");
        JS_ASSIGN_PROTO_PROP_READONLY_AS(NUITextInput::insertDictationResultPlaceholder, "insertDictationResultPlaceholder");

  }

  // static members (ctor)
  JS_INIT_CTOR(UITextField, UIControl);
  JS_ASSIGN_PROTO_METHOD(initWithFrameCallback);
  // constants (exports)
  
  //typedef NS_ENUM(NSInteger, UITextBorderStyle) {
    JS_ASSIGN_ENUM(UITextBorderStyleNone, NSInteger);
    JS_ASSIGN_ENUM(UITextBorderStyleLine, NSInteger);
    JS_ASSIGN_ENUM(UITextBorderStyleBezel, NSInteger);
    JS_ASSIGN_ENUM(UITextBorderStyleRoundedRect, NSInteger);
  //};

  //typedef NS_ENUM(NSInteger, UITextFieldViewMode) {
    JS_ASSIGN_ENUM(UITextFieldViewModeNever, NSInteger);
    JS_ASSIGN_ENUM(UITextFieldViewModeWhileEditing, NSInteger);
    JS_ASSIGN_ENUM(UITextFieldViewModeUnlessEditing, NSInteger);
    JS_ASSIGN_ENUM(UITextFieldViewModeAlways, NSInteger);
  //};

  //typedef NS_ENUM(NSInteger, UITextFieldDidEndEditingReason) {
    JS_ASSIGN_ENUM(UITextFieldDidEndEditingReasonCommitted, NSInteger);
#ifdef __TVOS__
    JS_ASSIGN_ENUM(UITextFieldDidEndEditingReasonCancelled, NSInteger); // UIKIT_AVAILABLE_TVOS_ONLY(10_0)
#endif
  //} NS_ENUM_AVAILABLE_IOS(10_0);

  JS_ASSIGN_ENUM(UITextFieldTextDidBeginEditingNotification, NSNotificationName);
  JS_ASSIGN_ENUM(UITextFieldTextDidEndEditingNotification, NSNotificationName);
  JS_ASSIGN_ENUM(UITextFieldTextDidChangeNotification, NSNotificationName);

  JS_ASSIGN_ENUM(UITextFieldDidEndEditingReasonKey, NSString); // NS_AVAILABLE_IOS(10_0);

  // constants (exports) from UITextInputTraits.h

//
// UITextAutocapitalizationType
//
// Controls autocapitalization behavior for a text widget.
// Note: Capitalization does not apply in all script systems. In such
// cases, these values are ignored by the keyboard/input method implementation.
//

//typedef NS_ENUM(NSInteger, UITextAutocapitalizationType) {
  JS_ASSIGN_ENUM(UITextAutocapitalizationTypeNone, NSInteger); //  
  JS_ASSIGN_ENUM(UITextAutocapitalizationTypeWords, NSInteger); //  
  JS_ASSIGN_ENUM(UITextAutocapitalizationTypeSentences, NSInteger); //  
  JS_ASSIGN_ENUM(UITextAutocapitalizationTypeAllCharacters, NSInteger); //  
//};

//
// UITextAutocorrectionType
//
// Controls keyboard autocorrection behavior for a text widget.
// Note: Some input methods do not support inline autocorrection, and 
// instead use a conversion and/or candidate selection methodology. In such
// cases, these values are ignored by the keyboard/input method implementation.
//

//typedef NS_ENUM(NSInteger, UITextAutocorrectionType) {
  JS_ASSIGN_ENUM(UITextAutocorrectionTypeDefault, NSInteger); //  
  JS_ASSIGN_ENUM(UITextAutocorrectionTypeNo, NSInteger); //  
  JS_ASSIGN_ENUM(UITextAutocorrectionTypeYes, NSInteger); //  
//};

//
// UITextSpellCheckingType
//
// Controls the annotation of misspelled words for a text widget.
// Note: Some input methods do not support spell checking.

//typedef NS_ENUM(NSInteger, UITextSpellCheckingType) {
  JS_ASSIGN_ENUM(UITextSpellCheckingTypeDefault, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSpellCheckingTypeNo, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSpellCheckingTypeYes, NSInteger); //  
//} NS_ENUM_AVAILABLE_IOS(5_0);

//
// UITextSmartQuotesType
//
// Controls the automatic conversion of typographic quote characters for a text widget.

//typedef NS_ENUM(NSInteger, UITextSmartQuotesType) {
  JS_ASSIGN_ENUM(UITextSmartQuotesTypeDefault, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSmartQuotesTypeNo, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSmartQuotesTypeYes, NSInteger); //  
//} NS_ENUM_AVAILABLE_IOS(11_0);

//
// UITextSmartDashesType
//
// Controls the automatic conversion of hyphens into en/em-dashes for a text widget.

//typedef NS_ENUM(NSInteger, UITextSmartDashesType) {
  JS_ASSIGN_ENUM(UITextSmartDashesTypeDefault, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSmartDashesTypeNo, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSmartDashesTypeYes, NSInteger); //  
//} NS_ENUM_AVAILABLE_IOS(11_0);

//
// UITextSmartInsertDeleteType
//
// Controls the automatic insertion/removal of spaces for a text widget.

//typedef NS_ENUM(NSInteger, UITextSmartInsertDeleteType) {
  JS_ASSIGN_ENUM(UITextSmartInsertDeleteTypeDefault, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSmartInsertDeleteTypeNo, NSInteger); //  
  JS_ASSIGN_ENUM(UITextSmartInsertDeleteTypeYes, NSInteger); //  
//} NS_ENUM_AVAILABLE_IOS(11_0);

//
// UIKeyboardType
//
// Requests that a particular keyboard type be displayed when a text widget
// becomes first responder. 
// Note: Some keyboard/input methods types may not support every variant. 
// In such cases, the input method will make a best effort to find a close 
// match to the requested type (e.g. displaying UIKeyboardTypeNumbersAndPunctuation 
// type if UIKeyboardTypeNumberPad is not supported).
//

//typedef NS_ENUM(NSInteger, UIKeyboardType) {
  JS_ASSIGN_ENUM(UIKeyboardTypeDefault, NSInteger); //                  // Default type for the current input method.
  JS_ASSIGN_ENUM(UIKeyboardTypeASCIICapable, NSInteger); //             // Displays a keyboard which can enter ASCII characters
  JS_ASSIGN_ENUM(UIKeyboardTypeNumbersAndPunctuation, NSInteger); //    // Numbers and assorted punctuation.
  JS_ASSIGN_ENUM(UIKeyboardTypeURL, NSInteger); //                      // A type optimized for URL entry (shows . / .com prominently).
  JS_ASSIGN_ENUM(UIKeyboardTypeNumberPad, NSInteger); //                // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
  JS_ASSIGN_ENUM(UIKeyboardTypePhonePad, NSInteger); //                 // A phone pad (1-9, *, 0, #, with letters under the numbers).
  JS_ASSIGN_ENUM(UIKeyboardTypeNamePhonePad, NSInteger); //             // A type optimized for entering a person's name or phone number.
  JS_ASSIGN_ENUM(UIKeyboardTypeEmailAddress, NSInteger); //             // A type optimized for multiple email address entry (shows space @ . prominently).
  JS_ASSIGN_ENUM(UIKeyboardTypeDecimalPad, NSInteger); //  NS_ENUM_AVAILABLE_IOS(4_1),   // A number pad with a decimal point.
  JS_ASSIGN_ENUM(UIKeyboardTypeTwitter, NSInteger); //  NS_ENUM_AVAILABLE_IOS(5_0),      // A type optimized for twitter text entry (easy access to @ #)
  JS_ASSIGN_ENUM(UIKeyboardTypeWebSearch, NSInteger); //  NS_ENUM_AVAILABLE_IOS(7_0),    // A default keyboard type with URL-oriented addition (shows space . prominently).
  JS_ASSIGN_ENUM(UIKeyboardTypeASCIICapableNumberPad, NSInteger); //  NS_ENUM_AVAILABLE_IOS(10_0), // A number pad (0-9) that will always be ASCII digits.

  JS_ASSIGN_ENUM(UIKeyboardTypeAlphabet, NSInteger); //  = UIKeyboardTypeASCIICapable, // Deprecated

//};

//
// UIKeyboardAppearance
//
// Requests a keyboard appearance be used when a text widget
// becomes first responder.. 
// Note: Some keyboard/input methods types may not support every variant. 
// In such cases, the input method will make a best effort to find a close 
// match to the requested type.
//

//typedef NS_ENUM(NSInteger, UIKeyboardAppearance) {
  JS_ASSIGN_ENUM(UIKeyboardAppearanceDefault, NSInteger); //            // Default apperance for the current input method.
  JS_ASSIGN_ENUM(UIKeyboardAppearanceDark, NSInteger); //  NS_ENUM_AVAILABLE_IOS(7_0),
  JS_ASSIGN_ENUM(UIKeyboardAppearanceLight, NSInteger); //  NS_ENUM_AVAILABLE_IOS(7_0),
  JS_ASSIGN_ENUM(UIKeyboardAppearanceAlert, NSInteger); //  = UIKeyboardAppearanceDark,  // Deprecated
//};

//
// UIReturnKeyType
//
// Controls the display of the return key. 
//
// Note: This enum is under discussion and may be replaced with a 
// different implementation.
//

//typedef NS_ENUM(NSInteger, UIReturnKeyType) {
  JS_ASSIGN_ENUM(UIReturnKeyDefault, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyGo, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyGoogle, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyJoin, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyNext, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyRoute, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeySearch, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeySend, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyYahoo, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyDone, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyEmergencyCall, NSInteger); //  
  JS_ASSIGN_ENUM(UIReturnKeyContinue, NSInteger); //  NS_ENUM_AVAILABLE_IOS(9_0),
//};

  JS_ASSIGN_ENUM(UITextContentTypeName, UITextContentType); //                       NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeNamePrefix, UITextContentType); //                 NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeGivenName, UITextContentType); //                  NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeMiddleName, UITextContentType); //                 NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeFamilyName, UITextContentType); //                 NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeNameSuffix, UITextContentType); //                 NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeNickname, UITextContentType); //                   NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeJobTitle, UITextContentType); //                   NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeOrganizationName, UITextContentType); //           NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeLocation, UITextContentType); //                   NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeFullStreetAddress, UITextContentType); //          NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeStreetAddressLine1, UITextContentType); //         NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeStreetAddressLine2, UITextContentType); //         NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeAddressCity, UITextContentType); //                NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeAddressState, UITextContentType); //               NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeAddressCityAndState, UITextContentType); //        NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeSublocality, UITextContentType); //                NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeCountryName, UITextContentType); //                NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypePostalCode, UITextContentType); //                 NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeTelephoneNumber, UITextContentType); //            NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeEmailAddress, UITextContentType); //               NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeURL, UITextContentType); //                        NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeCreditCardNumber, UITextContentType); //           NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UITextContentTypeUsername, UITextContentType); //                   NS_AVAILABLE_IOS(11_0);
  JS_ASSIGN_ENUM(UITextContentTypePassword, UITextContentType); //                   NS_AVAILABLE_IOS(11_0);
  JS_ASSIGN_ENUM(UITextContentTypeNewPassword, UITextContentType); //                NS_AVAILABLE_IOS(12_0);
  JS_ASSIGN_ENUM(UITextContentTypeOneTimeCode, UITextContentType); //                NS_AVAILABLE_IOS(12_0);

JS_INIT_CLASS_END(UITextField, UIControl);

NAN_METHOD(NUITextField::New) {
  JS_RECONSTRUCT(UITextField);
  @autoreleasepool {
    UITextField* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITextField *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UITextField alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UITextField alloc] init];
    }
    if (self) {
      NUITextField *wrapper = new NUITextField();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NUITextField::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITextField::initWithFrameCallback) {
  JS_UNWRAP_OR_ALLOC(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    JS_SET_RETURN(js_value_instancetype([self initWithFrame:frame]));
    declare_persistent_function(callback, @"sweetiekit.UITextField.initWithFrameCallback");
    [self setPlaceholder:@"Enter text here"];
    [self setFont:[UIFont systemFontOfSize:15]];
    [self setBorderStyle:UITextBorderStyleRoundedRect];
    [self setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self setKeyboardType:UIKeyboardTypeDefault];
    [self setReturnKeyType:UIReturnKeyDone];
    [self setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self setTargetClosureWithClosure:^(UITextField* sender){
      __block bool result = true;
      dispatch_main(^{
        get_persistent_function(sender, callback, @"sweetiekit.UITextField.initWithFrameCallback");
        if (callback) {
          result = to_value_BOOL([callback jsFunction]->Call("NUITextField::initWithFrameCallback"));
        }
      });
      return result;
    }];
  }
}

NAN_GETTER(NUITextField::callbackGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"sweetiekit.UITextField.initWithFrameCallback");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUITextField::callbackSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"sweetiekit.UITextField.initWithFrameCallback");
  }
}

NAN_METHOD(NUITextField::borderRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self borderRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::textRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self textRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::placeholderRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self placeholderRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::editingRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self editingRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::clearButtonRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self clearButtonRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::leftViewRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self leftViewRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::rightViewRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self rightViewRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::drawTextInRect) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    [self drawTextInRect: rect];
  }
}

NAN_METHOD(NUITextField::drawPlaceholderInRect) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    [self drawPlaceholderInRect: rect];
  }
}

NAN_GETTER(NUITextField::textGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString ([self text]));
  }
}

NAN_SETTER(NUITextField::textSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString , input);
    [self setText: input];
  }
}

#include "NNSAttributedString.h"

NAN_GETTER(NUITextField::attributedTextGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSAttributedString([self attributedText]));
  }
}

NAN_SETTER(NUITextField::attributedTextSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSAttributedString, input);
    [self setAttributedText: input];
  }
}

NAN_GETTER(NUITextField::textColorGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor ([self textColor]));
  }
}

NAN_SETTER(NUITextField::textColorSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor , input);
    [self setTextColor: input];
  }
}

NAN_GETTER(NUITextField::fontGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIFont ([self font]));
  }
}

NAN_SETTER(NUITextField::fontSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIFont , input);
    [self setFont: input];
  }
}

#include "NUILabel.h"

NAN_GETTER(NUITextField::textAlignmentGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTextAlignment([self textAlignment]));
  }
}

NAN_SETTER(NUITextField::textAlignmentSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTextAlignment, input);
    [self setTextAlignment: input];
  }
}

NAN_GETTER(NUITextField::borderStyleGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextBorderStyle([self borderStyle]));
  }
}

NAN_SETTER(NUITextField::borderStyleSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextBorderStyle, input);
    [self setBorderStyle: input];
  }
}

NAN_GETTER(NUITextField::defaultTextAttributesGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self defaultTextAttributes]));
  }
}

NAN_SETTER(NUITextField::defaultTextAttributesSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, input);
    [self setDefaultTextAttributes: input];
  }
}

NAN_GETTER(NUITextField::placeholderGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString ([self placeholder]));
  }
}

NAN_SETTER(NUITextField::placeholderSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString , input);
    [self setPlaceholder: input];
  }
}

#include "NNSAttributedString.h"

NAN_GETTER(NUITextField::attributedPlaceholderGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSAttributedString([self attributedPlaceholder]));
  }
}

NAN_SETTER(NUITextField::attributedPlaceholderSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSAttributedString, input);
    [self setAttributedPlaceholder: input];
  }
}

NAN_GETTER(NUITextField::clearsOnBeginEditingGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self clearsOnBeginEditing]));
  }
}

NAN_SETTER(NUITextField::clearsOnBeginEditingSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setClearsOnBeginEditing: input];
  }
}

NAN_GETTER(NUITextField::adjustsFontSizeToFitWidthGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self adjustsFontSizeToFitWidth]));
  }
}

NAN_SETTER(NUITextField::adjustsFontSizeToFitWidthSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAdjustsFontSizeToFitWidth: input];
  }
}

NAN_GETTER(NUITextField::minimumFontSizeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumFontSize]));
  }
}

NAN_SETTER(NUITextField::minimumFontSizeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumFontSize: input];
  }
}

NAN_GETTER(NUITextField::delegateGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UITextFieldDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUITextField::delegateSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UITextFieldDelegate>*/, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NUITextField::delegate"];
  }
}

#include "NUIImage.h"

NAN_GETTER(NUITextField::backgroundGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage ([self background]));
  }
}

NAN_SETTER(NUITextField::backgroundSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setBackground: input];
  }
}

NAN_GETTER(NUITextField::disabledBackgroundGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self disabledBackground]));
  }
}

NAN_SETTER(NUITextField::disabledBackgroundSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setDisabledBackground: input];
  }
}

NAN_GETTER(NUITextField::isEditingGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEditing]));
  }
}

NAN_GETTER(NUITextField::allowsEditingTextAttributesGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsEditingTextAttributes]));
  }
}

NAN_SETTER(NUITextField::allowsEditingTextAttributesSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsEditingTextAttributes: input];
  }
}

NAN_GETTER(NUITextField::typingAttributesGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self typingAttributes]));
  }
}

NAN_SETTER(NUITextField::typingAttributesSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, input);
    [self setTypingAttributes: input];
  }
}

NAN_GETTER(NUITextField::clearButtonModeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextFieldViewMode([self clearButtonMode]));
  }
}

NAN_SETTER(NUITextField::clearButtonModeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextFieldViewMode, input);
    [self setClearButtonMode: input];
  }
}

NAN_GETTER(NUITextField::leftViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self leftView]));
  }
}

NAN_SETTER(NUITextField::leftViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView , input);
    [self setLeftView: input];
  }
}

NAN_GETTER(NUITextField::leftViewModeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextFieldViewMode([self leftViewMode]));
  }
}

NAN_SETTER(NUITextField::leftViewModeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextFieldViewMode, input);
    [self setLeftViewMode: input];
  }
}

NAN_GETTER(NUITextField::rightViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self rightView]));
  }
}

NAN_SETTER(NUITextField::rightViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView , input);
    [self setRightView: input];
  }
}

NAN_GETTER(NUITextField::rightViewModeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextFieldViewMode([self rightViewMode]));
  }
}

NAN_SETTER(NUITextField::rightViewModeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextFieldViewMode, input);
    [self setRightViewMode: input];
  }
}

NAN_GETTER(NUITextField::inputViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self inputView]));
  }
}

NAN_SETTER(NUITextField::inputViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setInputView: input];
  }
}

NAN_GETTER(NUITextField::inputAccessoryViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self inputAccessoryView]));
  }
}

NAN_SETTER(NUITextField::inputAccessoryViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setInputAccessoryView: input];
  }
}

NAN_GETTER(NUITextField::clearsOnInsertionGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self clearsOnInsertion]));
  }
}

NAN_SETTER(NUITextField::clearsOnInsertionSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setClearsOnInsertion: input];
  }
}

// --------- UITextField ----------------

NAN_GETTER(NUITextField::autocapitalizationTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextAutocapitalizationType([self autocapitalizationType]));
  }
}

NAN_SETTER(NUITextField::autocapitalizationTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextAutocapitalizationType, input);
    [self setAutocapitalizationType: input];
  }
}

NAN_GETTER(NUITextField::autocorrectionTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextAutocorrectionType([self autocorrectionType]));
  }
}

NAN_SETTER(NUITextField::autocorrectionTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextAutocorrectionType, input);
    [self setAutocorrectionType: input];
  }
}

NAN_GETTER(NUITextField::spellCheckingTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextSpellCheckingType([self spellCheckingType]));
  }
}

NAN_SETTER(NUITextField::spellCheckingTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextSpellCheckingType, input);
    [self setSpellCheckingType: input];
  }
}

NAN_GETTER(NUITextField::smartQuotesTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextSmartQuotesType([self smartQuotesType]));
  }
}

NAN_SETTER(NUITextField::smartQuotesTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextSmartQuotesType, input);
    [self setSmartQuotesType: input];
  }
}

NAN_GETTER(NUITextField::smartDashesTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextSmartDashesType([self smartDashesType]));
  }
}


NAN_SETTER(NUITextField::smartDashesTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextSmartDashesType, input);
    [self setSmartDashesType: input];
  }
}

NAN_GETTER(NUITextField::smartInsertDeleteTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextSmartInsertDeleteType([self smartInsertDeleteType]));
  }
}

NAN_SETTER(NUITextField::smartInsertDeleteTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextSmartInsertDeleteType, input);
    [self setSmartInsertDeleteType: input];
  }
}

NAN_GETTER(NUITextField::keyboardTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIKeyboardType([self keyboardType]));
  }
}

NAN_SETTER(NUITextField::keyboardTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIKeyboardType, input);
    [self setKeyboardType: input];
  }
}

NAN_GETTER(NUITextField::keyboardAppearanceGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIKeyboardAppearance([self keyboardAppearance]));
  }
}

NAN_SETTER(NUITextField::keyboardAppearanceSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIKeyboardAppearance, input);
    [self setKeyboardAppearance: input];
  }
}

NAN_GETTER(NUITextField::returnKeyTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIReturnKeyType([self returnKeyType]));
  }
}

NAN_SETTER(NUITextField::returnKeyTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIReturnKeyType, input);
    [self setReturnKeyType: input];
  }
}

NAN_GETTER(NUITextField::enablesReturnKeyAutomaticallyGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self enablesReturnKeyAutomatically]));
  }
}

NAN_SETTER(NUITextField::enablesReturnKeyAutomaticallySetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnablesReturnKeyAutomatically: input];
  }
}

NAN_GETTER(NUITextField::isSecureTextEntryGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSecureTextEntry]));
  }
}

NAN_SETTER(NUITextField::isSecureTextEntrySetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSecureTextEntry: input];
  }
}

NAN_GETTER(NUITextField::textContentTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextContentType([self textContentType]));
  }
}

NAN_SETTER(NUITextField::textContentTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextContentType, input);
    [self setTextContentType: input];
  }
}

#include "NUITextInputPasswordRules.h"

NAN_GETTER(NUITextField::passwordRulesGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextInputPasswordRules([self passwordRules]));
  }
}

NAN_SETTER(NUITextField::passwordRulesSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UITextInputPasswordRules, input);
    [self setPasswordRules: input];
  }
}

// --------- end source ----------------

