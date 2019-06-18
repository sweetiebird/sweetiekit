
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
  JS_PROP(TextLabel);
  JS_PROP(DetailTextLabel);
  JS_PROP(IsEditing);
  JS_PROP(IsSelected);
  JS_PROP(selectionStyle);
  JS_PROP(cellStyle);
JS_WRAP_CLASS_END(UITableViewCell);

#endif /* NUITableViewCell_h */
