
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

JS_WRAP_CLASS(UITableViewCell, UIView);
  JS_PROP(TextLabel);
  JS_PROP(DetailTextLabel);
  JS_PROP(IsEditing);
  JS_PROP(IsSelected);
  JS_PROP(selectionStyle);
  JS_PROP(cellStyle);
JS_WRAP_CLASS_END(UITableViewCell);

#endif /* NUITableViewCell_h */
