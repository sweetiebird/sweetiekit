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

JS_INIT_CLASS(UITextInput, NSObject);
#if TODO
  JS_ASSIGN_STATIC_METHOD(currentInputMode);
  JS_ASSIGN_STATIC_METHOD(activeInputModes);
// UIKeyInput
  JS_ASSIGN_PROTO_METHOD(hasText);
  JS_ASSIGN_PROTO_METHOD(insertText);
  JS_ASSIGN_PROTO_METHOD(deleteBackward);
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
// UITextInputDelegate
  JS_ASSIGN_PROTO_METHOD(selectionWillChange);
  JS_ASSIGN_PROTO_METHOD(selectionDidChange);
  JS_ASSIGN_PROTO_METHOD(textWillChange);
  JS_ASSIGN_PROTO_METHOD(textDidChange);
// UITextInputTokenizer
  JS_ASSIGN_PROTO_METHOD(rangeEnclosingPositionWithGranularityInDirection);
  JS_ASSIGN_PROTO_METHOD(isPositionAtBoundaryInDirection);
  JS_ASSIGN_PROTO_METHOD(positionFromPositionToBoundaryInDirection);
  JS_ASSIGN_PROTO_METHOD(isPositionWithinTextUnitInDirection);
// UITextInputStringTokenizer
  JS_ASSIGN_PROTO_METHOD(initWithTextInput);
// UIKeyInput
  JS_ASSIGN_PROTO_PROP_READONLY(hasText);
// UIDictationPhrase
  JS_ASSIGN_PROTO_PROP_READONLY(text);
  JS_ASSIGN_PROTO_PROP_READONLY(alternativeInterpretations);
// UITextInputAssistantItem
  JS_ASSIGN_PROTO_PROP(allowsHidingShortcuts);
  JS_ASSIGN_PROTO_PROP(leadingBarButtonGroups);
  JS_ASSIGN_PROTO_PROP(trailingBarButtonGroups);
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
// UITextRange
  JS_ASSIGN_PROTO_PROP_READONLY(isEmpty);
  JS_ASSIGN_PROTO_PROP_READONLY(start);
  JS_ASSIGN_PROTO_PROP_READONLY(end);
// UITextSelectionRect
  JS_ASSIGN_PROTO_PROP_READONLY(rect);
  JS_ASSIGN_PROTO_PROP_READONLY(writingDirection);
  JS_ASSIGN_PROTO_PROP_READONLY(containsStart);
  JS_ASSIGN_PROTO_PROP_READONLY(containsEnd);
  JS_ASSIGN_PROTO_PROP_READONLY(isVertical);
// UITextInputMode
  JS_ASSIGN_PROTO_PROP_READONLY(primaryLanguage);
  JS_ASSIGN_STATIC_PROP_READONLY(activeInputModes);
#endif

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

JS_INIT_CLASS_END(UITextInput, NSObject);

NAN_METHOD(NUITextInput::New) {
  JS_RECONSTRUCT(UITextInput);
  @autoreleasepool {
    UITextInput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextInput *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextInput alloc] init];
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

NAN_METHOD(NUITextInputMode::currentInputMode) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextInputMode([UITextInputMode currentInputMode]));
  }
}

NAN_METHOD(NUITextInputMode::activeInputModes) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UITextInputMode*>([UITextInputMode activeInputModes]));
  }
}

NAN_METHOD(NUIKeyInput::hasText) {
  JS_UNWRAP(UIKeyInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasText]));
  }
}

NAN_METHOD(NUIKeyInput::insertText) {
  JS_UNWRAP(UIKeyInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, text);
    [self insertText: text];
  }
}

NAN_METHOD(NUIKeyInput::deleteBackward) {
  JS_UNWRAP(UIKeyInput, self);
  declare_autoreleasepool {
    [self deleteBackward];
  }
}

NAN_METHOD(NUITextInput::textInRange) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_NSString([self textInRange: range]));
  }
}

NAN_METHOD(NUITextInput::replaceRangeWithText) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_pointer(NSString, text);
    [self replaceRange: range withText: text];
  }
}

NAN_METHOD(NUITextInput::setMarkedTextSelectedRange) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, markedText);
    declare_value(NSRange, selectedRange);
    [self setMarkedText: markedText selectedRange: selectedRange];
  }
}

NAN_METHOD(NUITextInput::unmarkText) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    [self unmarkText];
  }
}

NAN_METHOD(NUITextInput::textRangeFromPositionToPosition) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, fromPosition);
    declare_pointer(UITextPosition, toPosition);
    JS_SET_RETURN(js_value_UITextRange([self textRangeFromPosition: fromPosition toPosition: toPosition]));
  }
}

NAN_METHOD(NUITextInput::positionFromPositionOffset) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(NSInteger, offset);
    JS_SET_RETURN(js_value_UITextPosition([self positionFromPosition: position offset: offset]));
  }
}

NAN_METHOD(NUITextInput::positionFromPositionInDirectionOffset) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextLayoutDirection, direction);
    declare_value(NSInteger, offset);
    JS_SET_RETURN(js_value_UITextPosition([self positionFromPosition: position inDirection: direction offset: offset]));
  }
}

NAN_METHOD(NUITextInput::comparePositionToPosition) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_pointer(UITextPosition, other);
    JS_SET_RETURN(js_value_NSComparisonResult([self comparePosition: position toPosition: other]));
  }
}

NAN_METHOD(NUITextInput::offsetFromPositionToPosition) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, from);
    declare_pointer(UITextPosition, toPosition);
    JS_SET_RETURN(js_value_NSInteger([self offsetFromPosition: from toPosition: toPosition]));
  }
}

NAN_METHOD(NUITextInput::positionWithinRangeFarthestInDirection) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_value(UITextLayoutDirection, direction);
    JS_SET_RETURN(js_value_UITextPosition([self positionWithinRange: range farthestInDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::characterRangeByExtendingPositionInDirection) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextLayoutDirection, direction);
    JS_SET_RETURN(js_value_UITextRange([self characterRangeByExtendingPosition: position inDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::baseWritingDirectionForPositionInDirection) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextStorageDirection, direction);
    JS_SET_RETURN(js_value_UITextWritingDirection([self baseWritingDirectionForPosition: position inDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::setBaseWritingDirectionForRange) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITextWritingDirection, writingDirection);
    declare_pointer(UITextRange, range);
    [self setBaseWritingDirection: writingDirection forRange: range];
  }
}

NAN_METHOD(NUITextInput::firstRectForRange) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_CGRect([self firstRectForRange: range]));
  }
}

NAN_METHOD(NUITextInput::caretRectForPosition) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    JS_SET_RETURN(js_value_CGRect([self caretRectForPosition: position]));
  }
}

NAN_METHOD(NUITextInput::selectionRectsForRange) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_NSArray<UITextSelectionRect*>([self selectionRectsForRange: range]));
  }
}

NAN_METHOD(NUITextInput::closestPositionToPoint) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_UITextPosition([self closestPositionToPoint: point]));
  }
}

NAN_METHOD(NUITextInput::closestPositionToPointWithinRange) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_UITextPosition([self closestPositionToPoint: point withinRange: range]));
  }
}

NAN_METHOD(NUITextInput::characterRangeAtPoint) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_UITextRange([self characterRangeAtPoint: point]));
  }
}

NAN_METHOD(NUITextInput::shouldChangeTextInRangeReplacementText) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_pointer(NSString, text);
    JS_SET_RETURN(js_value_BOOL([self shouldChangeTextInRange: range replacementText: text]));
  }
}

NAN_METHOD(NUITextInput::textStylingAtPositionInDirection) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextStorageDirection, direction);
    JS_SET_RETURN(js_value_NSDictionary<NSAttributedStringKey_id>([self textStylingAtPosition: position inDirection: direction]));
  }
}

NAN_METHOD(NUITextInput::positionWithinRangeAtCharacterOffset) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextRange, range);
    declare_value(NSInteger, offset);
    JS_SET_RETURN(js_value_UITextPosition([self positionWithinRange: range atCharacterOffset: offset]));
  }
}

NAN_METHOD(NUITextInput::characterOffsetOfPositionWithinRange) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_pointer(UITextRange, range);
    JS_SET_RETURN(js_value_NSInteger([self characterOffsetOfPosition: position withinRange: range]));
  }
}

NAN_METHOD(NUITextInput::insertDictationResult) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UIDictationPhrase*>, dictationResult);
    [self insertDictationResult: dictationResult];
  }
}

NAN_METHOD(NUITextInput::dictationRecordingDidEnd) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    [self dictationRecordingDidEnd];
  }
}

NAN_METHOD(NUITextInput::dictationRecognitionFailed) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    [self dictationRecognitionFailed];
  }
}

NAN_METHOD(NUITextInput::insertDictationResultPlaceholder) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self insertDictationResultPlaceholder]));
  }
}

NAN_METHOD(NUITextInput::frameForDictationResultPlaceholder) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, placeholder);
    JS_SET_RETURN(js_value_CGRect([self frameForDictationResultPlaceholder: placeholder]));
  }
}

NAN_METHOD(NUITextInput::removeDictationResultPlaceholderWillInsertResult) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, placeholder);
    declare_value(BOOL, willInsertResult);
    [self removeDictationResultPlaceholder: placeholder willInsertResult: willInsertResult];
  }
}

NAN_METHOD(NUITextInput::beginFloatingCursorAtPoint) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    [self beginFloatingCursorAtPoint: point];
  }
}

NAN_METHOD(NUITextInput::updateFloatingCursorAtPoint) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    [self updateFloatingCursorAtPoint: point];
  }
}

NAN_METHOD(NUITextInput::endFloatingCursor) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    [self endFloatingCursor];
  }
}

NAN_METHOD(NUITextInputDelegate::selectionWillChange) {
  JS_UNWRAP(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self selectionWillChange: textInput];
  }
}

NAN_METHOD(NUITextInputDelegate::selectionDidChange) {
  JS_UNWRAP(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self selectionDidChange: textInput];
  }
}

NAN_METHOD(NUITextInputDelegate::textWillChange) {
  JS_UNWRAP(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self textWillChange: textInput];
  }
}

NAN_METHOD(NUITextInputDelegate::textDidChange) {
  JS_UNWRAP(UITextInputDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id<UITextInput>, textInput);
    [self textDidChange: textInput];
  }
}

NAN_METHOD(NUITextInputTokenizer::rangeEnclosingPositionWithGranularityInDirection) {
  JS_UNWRAP(UITextInputTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_UITextRange([self rangeEnclosingPosition: position withGranularity: granularity inDirection: direction]));
  }
}

NAN_METHOD(NUITextInputTokenizer::isPositionAtBoundaryInDirection) {
  JS_UNWRAP(UITextInputTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_BOOL([self isPosition: position atBoundary: granularity inDirection: direction]));
  }
}

NAN_METHOD(NUITextInputTokenizer::positionFromPositionToBoundaryInDirection) {
  JS_UNWRAP(UITextInputTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_UITextPosition([self positionFromPosition: position toBoundary: granularity inDirection: direction]));
  }
}

NAN_METHOD(NUITextInputTokenizer::isPositionWithinTextUnitInDirection) {
  JS_UNWRAP(UITextInputTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_BOOL([self isPosition: position withinTextUnit: granularity inDirection: direction]));
  }
}

NAN_METHOD(NUITextInputStringTokenizer::initWithTextInput) {
  JS_UNWRAP_OR_ALLOC(UITextInputStringTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIResponder<UITextInput>, textInput);
    JS_SET_RETURN(js_value_instancetype([self initWithTextInput: textInput]));
  }
}

NAN_GETTER(NUIKeyInput::hasTextGetter) {
  JS_UNWRAP(UIKeyInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasText]));
  }
}

NAN_GETTER(NUIDictationPhrase::textGetter) {
  JS_UNWRAP(UIDictationPhrase, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self text]));
  }
}

NAN_GETTER(NUIDictationPhrase::alternativeInterpretationsGetter) {
  JS_UNWRAP(UIDictationPhrase, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self alternativeInterpretations]));
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

NAN_GETTER(NUITextInput::selectedTextRangeGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextRange([self selectedTextRange]));
  }
}

NAN_SETTER(NUITextInput::selectedTextRangeSetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UITextRange, input);
    [self setSelectedTextRange: input];
  }
}

NAN_GETTER(NUITextInput::markedTextRangeGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextRange([self markedTextRange]));
  }
}

NAN_GETTER(NUITextInput::markedTextStyleGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary<NSAttributedStringKey id>([self markedTextStyle]));
  }
}

NAN_SETTER(NUITextInput::markedTextStyleSetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary<NSAttributedStringKey id>, input);
    [self setMarkedTextStyle: input];
  }
}

NAN_GETTER(NUITextInput::beginningOfDocumentGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self beginningOfDocument]));
  }
}

NAN_GETTER(NUITextInput::endOfDocumentGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self endOfDocument]));
  }
}

NAN_GETTER(NUITextInput::inputDelegateGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id<UITextInputDelegate>([self inputDelegate]));
  }
}

NAN_SETTER(NUITextInput::inputDelegateSetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id<UITextInputDelegate>, input);
    [self setInputDelegate: input];
  }
}

NAN_GETTER(NUITextInput::tokenizerGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id<UITextInputTokenizer>([self tokenizer]));
  }
}

NAN_GETTER(NUITextInput::textInputViewGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self textInputView]));
  }
}

NAN_GETTER(NUITextInput::selectionAffinityGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextStorageDirection([self selectionAffinity]));
  }
}

NAN_SETTER(NUITextInput::selectionAffinitySetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextStorageDirection, input);
    [self setSelectionAffinity: input];
  }
}

NAN_GETTER(NUITextInput::insertDictationResultPlaceholderGetter) {
  JS_UNWRAP(UITextInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self insertDictationResultPlaceholder]));
  }
}

NAN_GETTER(NUITextRange::isEmptyGetter) {
  JS_UNWRAP(UITextRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEmpty]));
  }
}

NAN_GETTER(NUITextRange::startGetter) {
  JS_UNWRAP(UITextRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self start]));
  }
}

NAN_GETTER(NUITextRange::endGetter) {
  JS_UNWRAP(UITextRange, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextPosition([self end]));
  }
}

NAN_GETTER(NUITextSelectionRect::rectGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self rect]));
  }
}

NAN_GETTER(NUITextSelectionRect::writingDirectionGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextWritingDirection([self writingDirection]));
  }
}

NAN_GETTER(NUITextSelectionRect::containsStartGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self containsStart]));
  }
}

NAN_GETTER(NUITextSelectionRect::containsEndGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self containsEnd]));
  }
}

NAN_GETTER(NUITextSelectionRect::isVerticalGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVertical]));
  }
}

NAN_GETTER(NUITextInputMode::primaryLanguageGetter) {
  JS_UNWRAP(UITextInputMode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self primaryLanguage]));
  }
}

NAN_GETTER(NUITextInputMode::activeInputModesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UITextInputMode*>([UITextInputMode activeInputModes]));
  }
}

#endif

@implementation UITextInput
@end
