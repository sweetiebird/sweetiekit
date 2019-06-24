//
//  NUITextInput.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextInput.h"

#define instancetype UITextInput
#define js_value_instancetype js_value_UITextInput

NUITextInput::NUITextInput() {}
NUITextInput::~NUITextInput() {}

#include "NNSNotification.h"

JS_INIT_PROTOCOL(UITextInput, NSObject);
#if TODO
// UIKeyInput
  JS_ASSIGN_PROTO_METHOD(hasText);
  JS_ASSIGN_PROTO_METHOD(insertText);
  JS_ASSIGN_PROTO_METHOD(deleteBackward);
#endif
// UITextInput
  JS_ASSIGN_PROTO_METHOD(textInRange);
  JS_ASSIGN_PROTO_METHOD(replaceRangeWithText);
  JS_ASSIGN_PROTO_METHOD(setMarkedTextSelectedRange);
  JS_ASSIGN_PROTO_METHOD(unmarkText);
  JS_ASSIGN_PROTO_METHOD(textRangeFromPositionToPosition);
  JS_ASSIGN_PROTO_METHOD(positionFromPositionOffset);
  JS_ASSIGN_PROTO_METHOD(positionFromPositionInDirectionOffset);
  JS_ASSIGN_PROTO_METHOD(comparePositionToPosition);
  JS_ASSIGN_PROTO_METHOD(offsetFromPositionToPosition);
  JS_ASSIGN_PROTO_METHOD(positionWithinRangeFarthestInDirection);
  JS_ASSIGN_PROTO_METHOD(characterRangeByExtendingPositionInDirection);
  JS_ASSIGN_PROTO_METHOD(baseWritingDirectionForPositionInDirection);
  JS_ASSIGN_PROTO_METHOD(setBaseWritingDirectionForRange);
  JS_ASSIGN_PROTO_METHOD(firstRectForRange);
  JS_ASSIGN_PROTO_METHOD(caretRectForPosition);
  JS_ASSIGN_PROTO_METHOD(selectionRectsForRange);
  JS_ASSIGN_PROTO_METHOD(closestPositionToPoint);
  JS_ASSIGN_PROTO_METHOD(closestPositionToPointWithinRange);
  JS_ASSIGN_PROTO_METHOD(characterRangeAtPoint);
  JS_ASSIGN_PROTO_METHOD(shouldChangeTextInRangeReplacementText);
  JS_ASSIGN_PROTO_METHOD(textStylingAtPositionInDirection);
  JS_ASSIGN_PROTO_METHOD(positionWithinRangeAtCharacterOffset);
  JS_ASSIGN_PROTO_METHOD(characterOffsetOfPositionWithinRange);
  JS_ASSIGN_PROTO_METHOD(insertDictationResult);
  JS_ASSIGN_PROTO_METHOD(dictationRecordingDidEnd);
  JS_ASSIGN_PROTO_METHOD(dictationRecognitionFailed);
  JS_ASSIGN_PROTO_METHOD(insertDictationResultPlaceholder);
  JS_ASSIGN_PROTO_METHOD(frameForDictationResultPlaceholder);
  JS_ASSIGN_PROTO_METHOD(removeDictationResultPlaceholderWillInsertResult);
  JS_ASSIGN_PROTO_METHOD(beginFloatingCursorAtPoint);
  JS_ASSIGN_PROTO_METHOD(updateFloatingCursorAtPoint);
  JS_ASSIGN_PROTO_METHOD(endFloatingCursor);
#if TODO
// UITextInputDelegate
  JS_ASSIGN_PROTO_METHOD(selectionWillChange);
  JS_ASSIGN_PROTO_METHOD(selectionDidChange);
  JS_ASSIGN_PROTO_METHOD(textWillChange);
  JS_ASSIGN_PROTO_METHOD(textDidChange);
// UIKeyInput
  JS_ASSIGN_PROTO_PROP_READONLY(hasText);
#endif
// UITextInput
  JS_ASSIGN_PROTO_PROP(selectedTextRange);
  JS_ASSIGN_PROTO_PROP_READONLY(markedTextRange);
  JS_ASSIGN_PROTO_PROP(markedTextStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(beginningOfDocument);
  JS_ASSIGN_PROTO_PROP_READONLY(endOfDocument);
  JS_ASSIGN_PROTO_PROP(inputDelegate);
  JS_ASSIGN_PROTO_PROP_READONLY(tokenizer);
  JS_ASSIGN_PROTO_PROP_READONLY(textInputView);
  JS_ASSIGN_PROTO_PROP(selectionAffinity);
  JS_ASSIGN_PROTO_PROP_READONLY(insertDictationResultPlaceholder);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextInput, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UITextStorageDirection) {
    JS_ASSIGN_ENUM(UITextStorageDirectionForward, NSInteger); // = 0,
    JS_ASSIGN_ENUM(UITextStorageDirectionBackward, NSInteger);
  //};

  //typedef NS_ENUM(NSInteger, UITextLayoutDirection) {
    JS_ASSIGN_ENUM(UITextLayoutDirectionRight, NSInteger); // = 2,
    JS_ASSIGN_ENUM(UITextLayoutDirectionLeft, NSInteger);
    JS_ASSIGN_ENUM(UITextLayoutDirectionUp, NSInteger);
    JS_ASSIGN_ENUM(UITextLayoutDirectionDown, NSInteger);
  //};

  //typedef NSInteger UITextDirection NS_TYPED_ENUM;

  //typedef NS_ENUM(NSInteger, UITextWritingDirection) {
    JS_ASSIGN_ENUM(UITextWritingDirectionNatural, NSInteger); // = -1,
    JS_ASSIGN_ENUM(UITextWritingDirectionLeftToRight, NSInteger); // = 0,
    JS_ASSIGN_ENUM(UITextWritingDirectionRightToLeft, NSInteger);
  //};

  //typedef NS_ENUM(NSInteger, UITextGranularity) {
    JS_ASSIGN_ENUM(UITextGranularityCharacter, NSInteger);
    JS_ASSIGN_ENUM(UITextGranularityWord, NSInteger);
    JS_ASSIGN_ENUM(UITextGranularitySentence, NSInteger);
    JS_ASSIGN_ENUM(UITextGranularityParagraph, NSInteger);
    JS_ASSIGN_ENUM(UITextGranularityLine, NSInteger);
    JS_ASSIGN_ENUM(UITextGranularityDocument, NSInteger);
  //};
  
  JS_ASSIGN_ENUM(UITextInputTextBackgroundColorKey, NSString); // NS_DEPRECATED_IOS(3_2, 8_0, "Use NSBackgroundColorAttributeName instead") __TVOS_PROHIBITED; 
  JS_ASSIGN_ENUM(UITextInputTextColorKey, NSString); //           NS_DEPRECATED_IOS(3_2, 8_0, "Use NSForegroundColorAttributeName instead") __TVOS_PROHIBITED; 
  JS_ASSIGN_ENUM(UITextInputTextFontKey, NSString); //            NS_DEPRECATED_IOS(3_2, 8_0, "Use NSFontAttributeName instead") __TVOS_PROHIBITED; 

  JS_ASSIGN_ENUM(UITextInputCurrentInputModeDidChangeNotification, NSNotificationName); // NS_AVAILABLE_IOS(4_2);

JS_INIT_PROTOCOL_END(UITextInput, NSObject);

NAN_METHOD(NUITextInput::New) {
  JS_RECONSTRUCT(UITextInput);
  @autoreleasepool {
    id<UITextInput> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UITextInput>)(info[0].As<External>()->Value());
    } else if (is_value_UITextInput(info[0])) {
      self = to_value_UITextInput(info[0]);
    }
    if (self) {
      NUITextInput *wrapper = new NUITextInput();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextInput::New: invalid arguments");
    }
  }
}

#if TODO

NAN_METHOD(NUIKeyInput::hasText) {
  JS_UNWRAP_PROTOCOL(UIKeyInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasText]));
  }
}

NAN_METHOD(NUIKeyInput::insertText) {
  JS_UNWRAP_PROTOCOL(UIKeyInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, text);
    [self insertText: text];
  }
}

NAN_METHOD(NUIKeyInput::deleteBackward) {
  JS_UNWRAP_PROTOCOL(UIKeyInput, self);
  declare_autoreleasepool {
    [self deleteBackward];
  }
}
#endif

#include "NUITextRange.h"

NAN_METHOD(NUITextInput::textInRange) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_NSString([self textInRange: range]));
  }
}

NAN_METHOD(NUITextInput::replaceRangeWithText) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_pointer(NSString, text);
    [self replaceRange: range withText: text];
  }
}

NAN_METHOD(NUITextInput::setMarkedTextSelectedRange) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, markedText);
    declare_value(NSRange, selectedRange);
    [self setMarkedText: markedText selectedRange: selectedRange];
  }
}

NAN_METHOD(NUITextInput::unmarkText) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    [self unmarkText];
  }
}

#include "NUITextPosition.h"

NAN_METHOD(NUITextInput::textRangeFromPositionToPosition) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, fromPosition);
    declare_pointer(UITextPosition, toPosition);
    JS_SET_RETURN(js_value_UITextRange([self textRangeFromPosition: fromPosition toPosition: toPosition]));
  }
}

NAN_METHOD(NUITextInput::positionFromPositionOffset) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(NSInteger, offset);
    JS_SET_RETURN(js_value_UITextPosition([self positionFromPosition: position offset: offset]));
  }
}

NAN_METHOD(NUITextInput::positionFromPositionInDirectionOffset) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextLayoutDirection, direction);
    declare_value(NSInteger, offset);
    JS_SET_RETURN(js_value_UITextPosition([self positionFromPosition: position inDirection: direction offset: offset]));
  }
}

#include "NNSObjCRuntime.h"

NAN_METHOD(NUITextInput::comparePositionToPosition) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_pointer(UITextPosition, other);
    JS_SET_RETURN(js_value_NSComparisonResult([self comparePosition: position toPosition: other]));
  }
}

NAN_METHOD(NUITextInput::offsetFromPositionToPosition) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, from);
    declare_pointer(UITextPosition, toPosition);
    JS_SET_RETURN(js_value_NSInteger([self offsetFromPosition: from toPosition: toPosition]));
  }
}

NAN_METHOD(NUITextInput::positionWithinRangeFarthestInDirection) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_value(UITextLayoutDirection, direction);
    JS_SET_RETURN(js_value_UITextPosition([self positionWithinRange: range farthestInDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::characterRangeByExtendingPositionInDirection) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextLayoutDirection, direction);
    JS_SET_RETURN(js_value_UITextRange([self characterRangeByExtendingPosition: position inDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::baseWritingDirectionForPositionInDirection) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextStorageDirection, direction);
    JS_SET_RETURN(js_value_UITextWritingDirection([self baseWritingDirectionForPosition: position inDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::setBaseWritingDirectionForRange) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITextWritingDirection, writingDirection);
    declare_pointer(UITextRange, range);
    [self setBaseWritingDirection: writingDirection forRange: range];
  }
}

NAN_METHOD(NUITextInput::firstRectForRange) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_CGRect([self firstRectForRange: range]));
  }
}

NAN_METHOD(NUITextInput::caretRectForPosition) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    JS_SET_RETURN(js_value_CGRect([self caretRectForPosition: position]));
  }
}

NAN_METHOD(NUITextInput::selectionRectsForRange) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_NSArray<UITextSelectionRect*>([self selectionRectsForRange: range]));
  }
}

NAN_METHOD(NUITextInput::closestPositionToPoint) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_UITextPosition([self closestPositionToPoint: point]));
  }
}

NAN_METHOD(NUITextInput::closestPositionToPointWithinRange) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_UITextPosition([self closestPositionToPoint: point withinRange: range]));
  }
}

NAN_METHOD(NUITextInput::characterRangeAtPoint) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_UITextRange([self characterRangeAtPoint: point]));
  }
}

NAN_METHOD(NUITextInput::shouldChangeTextInRangeReplacementText) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_pointer(NSString, text);
    JS_SET_RETURN(js_value_BOOL([self shouldChangeTextInRange: range replacementText: text]));
  }
}

NAN_METHOD(NUITextInput::textStylingAtPositionInDirection) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextStorageDirection, direction);
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self textStylingAtPosition: position inDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::positionWithinRangeAtCharacterOffset) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_value(NSInteger, offset);
    JS_SET_RETURN(js_value_UITextPosition([self positionWithinRange: range atCharacterOffset: offset]));
  }
}

NAN_METHOD(NUITextInput::characterOffsetOfPositionWithinRange) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_NSInteger([self characterOffsetOfPosition: position withinRange: range]));
  }
}

NAN_METHOD(NUITextInput::insertDictationResult) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UIDictationPhrase*>, dictationResult);
    [self insertDictationResult: dictationResult];
  }
}

NAN_METHOD(NUITextInput::dictationRecordingDidEnd) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    [self dictationRecordingDidEnd];
  }
}

NAN_METHOD(NUITextInput::dictationRecognitionFailed) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    [self dictationRecognitionFailed];
  }
}

NAN_METHOD(NUITextInput::insertDictationResultPlaceholder) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self insertDictationResultPlaceholder]));
  }
}

NAN_METHOD(NUITextInput::frameForDictationResultPlaceholder) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, placeholder);
    JS_SET_RETURN(js_value_CGRect([self frameForDictationResultPlaceholder: placeholder]));
  }
}

NAN_METHOD(NUITextInput::removeDictationResultPlaceholderWillInsertResult) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, placeholder);
    declare_value(BOOL, willInsertResult);
    [self removeDictationResultPlaceholder: placeholder willInsertResult: willInsertResult];
  }
}

NAN_METHOD(NUITextInput::beginFloatingCursorAtPoint) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    [self beginFloatingCursorAtPoint: point];
  }
}

NAN_METHOD(NUITextInput::updateFloatingCursorAtPoint) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    [self updateFloatingCursorAtPoint: point];
  }
}

NAN_METHOD(NUITextInput::endFloatingCursor) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    [self endFloatingCursor];
  }
}

#if TODO
NAN_METHOD(NUITextInputDelegate::selectionWillChange) {
  JS_UNWRAP_PROTOCOL(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self selectionWillChange: textInput];
  }
}

NAN_METHOD(NUITextInputDelegate::selectionDidChange) {
  JS_UNWRAP_PROTOCOL(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self selectionDidChange: textInput];
  }
}

NAN_METHOD(NUITextInputDelegate::textWillChange) {
  JS_UNWRAP_PROTOCOL(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self textWillChange: textInput];
  }
}

NAN_METHOD(NUITextInputDelegate::textDidChange) {
  JS_UNWRAP_PROTOCOL(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self textDidChange: textInput];
  }
}

NAN_GETTER(NUIKeyInput::hasTextGetter) {
  JS_UNWRAP_PROTOCOL(UIKeyInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasText]));
  }
}
#endif


NAN_GETTER(NUITextInput::selectedTextRangeGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextRange([self selectedTextRange]));
  }
}

NAN_SETTER(NUITextInput::selectedTextRangeSetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UITextRange, input);
    [self setSelectedTextRange: input];
  }
}

NAN_GETTER(NUITextInput::markedTextRangeGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextRange([self markedTextRange]));
  }
}

NAN_GETTER(NUITextInput::markedTextStyleGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self markedTextStyle]));
  }
}

NAN_SETTER(NUITextInput::markedTextStyleSetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, input);
    [self setMarkedTextStyle: input];
  }
}

NAN_GETTER(NUITextInput::beginningOfDocumentGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self beginningOfDocument]));
  }
}

NAN_GETTER(NUITextInput::endOfDocumentGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self endOfDocument]));
  }
}

NAN_GETTER(NUITextInput::inputDelegateGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UITextInputDelegate>*/([self inputDelegate]));
  }
}

NAN_SETTER(NUITextInput::inputDelegateSetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UITextInputDelegate>*/, input);
    [self setInputDelegate: input];
    [(NSObject*)self associateValue:input withKey:@"NUITextInput::inputDelegate"];
  }
}

NAN_GETTER(NUITextInput::tokenizerGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UITextInputTokenizer>*/([self tokenizer]));
  }
}

#include "NUIView.h"

NAN_GETTER(NUITextInput::textInputViewGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self textInputView]));
  }
}

NAN_GETTER(NUITextInput::selectionAffinityGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextStorageDirection([self selectionAffinity]));
  }
}

NAN_SETTER(NUITextInput::selectionAffinitySetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextStorageDirection, input);
    [self setSelectionAffinity: input];
  }
}

NAN_GETTER(NUITextInput::insertDictationResultPlaceholderGetter) {
  JS_UNWRAP_PROTOCOL(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self insertDictationResultPlaceholder]));
  }
}

