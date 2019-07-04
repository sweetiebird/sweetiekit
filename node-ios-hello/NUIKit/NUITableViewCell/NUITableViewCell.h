
//
//  NUITableViewCell.h
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewCell_h
#define NUITableViewCell_h

#include "NUIView.h"

#define js_value_UITableViewCell(x) js_value_wrapper(x, UITableViewCell)
#define to_value_UITableViewCell(x) to_value_wrapper(x, UITableViewCell)
#define is_value_UITableViewCell(x) is_value_wrapper(x, UITableViewCell)

#define js_value_UITableViewCellStyle(x) JS_ENUM(UITableViewCellStyle, NSInteger, x)
#define to_value_UITableViewCellStyle(x) TO_ENUM(UITableViewCellStyle, NSInteger, x)
#define is_value_UITableViewCellStyle(x) IS_ENUM(UITableViewCellStyle, NSInteger, x)

#define js_value_UITableViewCellSeparatorStyle(x) JS_ENUM(UITableViewCellSeparatorStyle, NSInteger, x)
#define to_value_UITableViewCellSeparatorStyle(x) TO_ENUM(UITableViewCellSeparatorStyle, NSInteger, x)
#define is_value_UITableViewCellSeparatorStyle(x) IS_ENUM(UITableViewCellSeparatorStyle, NSInteger, x)

#define js_value_UITableViewCellSelectionStyle(x) JS_ENUM(UITableViewCellSelectionStyle, NSInteger, x)
#define to_value_UITableViewCellSelectionStyle(x) TO_ENUM(UITableViewCellSelectionStyle, NSInteger, x)
#define is_value_UITableViewCellSelectionStyle(x) IS_ENUM(UITableViewCellSelectionStyle, NSInteger, x)

#define js_value_UITableViewCellFocusStyle(x) JS_ENUM(UITableViewCellFocusStyle, NSInteger, x)
#define to_value_UITableViewCellFocusStyle(x) TO_ENUM(UITableViewCellFocusStyle, NSInteger, x)
#define is_value_UITableViewCellFocusStyle(x) IS_ENUM(UITableViewCellFocusStyle, NSInteger, x)

#define js_value_UITableViewCellEditingStyle(x) JS_ENUM(UITableViewCellEditingStyle, NSInteger, x)
#define to_value_UITableViewCellEditingStyle(x) TO_ENUM(UITableViewCellEditingStyle, NSInteger, x)
#define is_value_UITableViewCellEditingStyle(x) IS_ENUM(UITableViewCellEditingStyle, NSInteger, x)

#define js_value_UITableViewCellAccessoryType(x) JS_ENUM(UITableViewCellAccessoryType, NSInteger, x)
#define to_value_UITableViewCellAccessoryType(x) TO_ENUM(UITableViewCellAccessoryType, NSInteger, x)
#define is_value_UITableViewCellAccessoryType(x) IS_ENUM(UITableViewCellAccessoryType, NSInteger, x)

#define js_value_UITableViewCellStateMask(x) JS_OPTS(UITableViewCellStateMask, NSUInteger, x)
#define to_value_UITableViewCellStateMask(x) TO_OPTS(UITableViewCellStateMask, NSUInteger, x)
#define is_value_UITableViewCellStateMask(x) IS_OPTS(UITableViewCellStateMask, NSUInteger, x)

#define js_value_UITableViewCellDragState(x) JS_ENUM(UITableViewCellDragState, NSInteger, x)
#define to_value_UITableViewCellDragState(x) TO_ENUM(UITableViewCellDragState, NSInteger, x)
#define is_value_UITableViewCellDragState(x) IS_ENUM(UITableViewCellDragState, NSInteger, x)


JS_WRAP_CLASS(UITableViewCell, UIView);
  JS_METHOD(initWithStyleReuseIdentifier);
  JS_METHOD(initWithCoder);
  JS_METHOD(prepareForReuse);
  JS_METHOD(setSelectedAnimated);
  JS_METHOD(setHighlightedAnimated);
  JS_METHOD(setEditingAnimated);
  JS_METHOD(willTransitionToState);
  JS_METHOD(didTransitionToState);
  JS_METHOD(dragStateDidChange);
  JS_METHOD(initWithFrameReuseIdentifier);
  JS_PROP_READONLY(imageView);
  JS_PROP_READONLY(textLabel);
  JS_PROP_READONLY(detailTextLabel);
  JS_PROP_READONLY(contentView);
  JS_PROP(backgroundView);
  JS_PROP(selectedBackgroundView);
  JS_PROP(multipleSelectionBackgroundView);
  JS_PROP_READONLY(reuseIdentifier);
  JS_PROP(selectionStyle);
  JS_PROP(isSelected);
  JS_PROP(isHighlighted);
  JS_PROP_READONLY(editingStyle);
  JS_PROP(showsReorderControl);
  JS_PROP(shouldIndentWhileEditing);
  JS_PROP(accessoryType);
  JS_PROP(accessoryView);
  JS_PROP(editingAccessoryType);
  JS_PROP(editingAccessoryView);
  JS_PROP(indentationLevel);
  JS_PROP(indentationWidth);
  JS_PROP(separatorInset);
  JS_PROP(isEditing);
  JS_PROP_READONLY(showingDeleteConfirmation);
  JS_PROP(focusStyle);
  JS_PROP(userInteractionEnabledWhileDragging);
  JS_PROP(text);
  JS_PROP(font);
  JS_PROP(textAlignment);
  JS_PROP(lineBreakMode);
  JS_PROP(textColor);
  JS_PROP(selectedTextColor);
  JS_PROP(image);
  JS_PROP(selectedImage);
  JS_PROP(hidesAccessoryWhenEditing);
  JS_PROP(target);
  JS_PROP(editAction);
  JS_PROP(accessoryAction);
JS_WRAP_CLASS_END(UITableViewCell);

#endif /* NUITableViewCell_h */
