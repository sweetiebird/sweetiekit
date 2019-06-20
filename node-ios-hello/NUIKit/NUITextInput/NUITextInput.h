//
//  NUITextInput.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextInput_h
#define NUITextInput_h    

#include "NNSObject.h"

#define js_value_UITextInput(x) js_value_wrapper(x, UITextInput)
#define to_value_UITextInput(x) to_value_wrapper(x, UITextInput)
#define is_value_UITextInput(x) is_value_wrapper(x, UITextInput)

#define js_value_UITextStorageDirection(x) JS_ENUM(UITextStorageDirection, NSInteger, x)
#define to_value_UITextStorageDirection(x) TO_ENUM(UITextStorageDirection, NSInteger, x)
#define is_value_UITextStorageDirection(x) IS_ENUM(UITextStorageDirection, NSInteger, x)

#define js_value_UITextLayoutDirection(x) JS_ENUM(UITextLayoutDirection, NSInteger, x)
#define to_value_UITextLayoutDirection(x) TO_ENUM(UITextLayoutDirection, NSInteger, x)
#define is_value_UITextLayoutDirection(x) IS_ENUM(UITextLayoutDirection, NSInteger, x)

#define js_value_UITextDirection(x) JS_ENUM(UITextDirection, NSInteger, x)
#define to_value_UITextDirection(x) TO_ENUM(UITextDirection, NSInteger, x)
#define is_value_UITextDirection(x) IS_ENUM(UITextDirection, NSInteger, x)

#define js_value_UITextWritingDirection(x) JS_ENUM(UITextWritingDirection, NSInteger, x)
#define to_value_UITextWritingDirection(x) TO_ENUM(UITextWritingDirection, NSInteger, x)
#define is_value_UITextWritingDirection(x) IS_ENUM(UITextWritingDirection, NSInteger, x)

#define js_value_UITextGranularity(x) JS_ENUM(UITextGranularity, NSInteger, x)
#define to_value_UITextGranularity(x) TO_ENUM(UITextGranularity, NSInteger, x)
#define is_value_UITextGranularity(x) IS_ENUM(UITextGranularity, NSInteger, x)

JS_WRAP_CLASS(UITextInput, NSObject);
#if TODO
// UIKeyInput
  JS_METHOD(hasText);
  JS_METHOD(insertText);
  JS_METHOD(deleteBackward);
// UITextInput
  JS_METHOD(textInRange);
  JS_METHOD(replaceRangeWithText);
  JS_METHOD(setMarkedTextSelectedRange);
  JS_METHOD(unmarkText);
  JS_METHOD(textRangeFromPositionToPosition);
  JS_METHOD(positionFromPositionOffset);
  JS_METHOD(positionFromPositionInDirectionOffset);
  JS_METHOD(comparePositionToPosition);
  JS_METHOD(offsetFromPositionToPosition);
  JS_METHOD(positionWithinRangeFarthestInDirection);
  JS_METHOD(characterRangeByExtendingPositionInDirection);
  JS_METHOD(baseWritingDirectionForPositionInDirection);
  JS_METHOD(setBaseWritingDirectionForRange);
  JS_METHOD(firstRectForRange);
  JS_METHOD(caretRectForPosition);
  JS_METHOD(selectionRectsForRange);
  JS_METHOD(closestPositionToPoint);
  JS_METHOD(closestPositionToPointWithinRange);
  JS_METHOD(characterRangeAtPoint);
  JS_METHOD(shouldChangeTextInRangeReplacementText);
  JS_METHOD(textStylingAtPositionInDirection);
  JS_METHOD(positionWithinRangeAtCharacterOffset);
  JS_METHOD(characterOffsetOfPositionWithinRange);
  JS_METHOD(insertDictationResult);
  JS_METHOD(dictationRecordingDidEnd);
  JS_METHOD(dictationRecognitionFailed);
  JS_METHOD(insertDictationResultPlaceholder);
  JS_METHOD(frameForDictationResultPlaceholder);
  JS_METHOD(removeDictationResultPlaceholderWillInsertResult);
  JS_METHOD(beginFloatingCursorAtPoint);
  JS_METHOD(updateFloatingCursorAtPoint);
  JS_METHOD(endFloatingCursor);
// UITextInputDelegate
  JS_METHOD(selectionWillChange);
  JS_METHOD(selectionDidChange);
  JS_METHOD(textWillChange);
  JS_METHOD(textDidChange);
// UIKeyInput
  JS_PROP_READONLY(hasText);
// UITextInput
  JS_PROP(selectedTextRange);
  JS_PROP_READONLY(markedTextRange);
  JS_PROP(markedTextStyle);
  JS_PROP_READONLY(beginningOfDocument);
  JS_PROP_READONLY(endOfDocument);
  JS_PROP(inputDelegate);
  JS_PROP_READONLY(tokenizer);
  JS_PROP_READONLY(textInputView);
  JS_PROP(selectionAffinity);
  JS_PROP_READONLY(insertDictationResultPlaceholder);
#endif

JS_WRAP_CLASS_END(UITextInput);

#if __OBJC__
@interface UITextInput : NSObject/* <UITextInput>*/
@end
#endif

#endif /* NUITextInput_h */
