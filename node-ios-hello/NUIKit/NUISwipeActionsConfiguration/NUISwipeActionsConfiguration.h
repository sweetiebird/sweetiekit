//
//  NUISwipeActionsConfiguration.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISwipeActionsConfiguration_h
#define NUISwipeActionsConfiguration_h    

#include "NNSObject.h"

#define js_value_UISwipeActionsConfiguration(x) js_value_wrapper(x, UISwipeActionsConfiguration)
#define to_value_UISwipeActionsConfiguration(x) to_value_wrapper(x, UISwipeActionsConfiguration)
#define is_value_UISwipeActionsConfiguration(x) is_value_wrapper(x, UISwipeActionsConfiguration)

JS_WRAP_CLASS(UISwipeActionsConfiguration, NSObject);
  JS_STATIC_METHOD(configurationWithActions);
  JS_PROP_READONLY(actions);
  JS_PROP(performsFirstActionWithFullSwipe);
JS_WRAP_CLASS_END(UISwipeActionsConfiguration);

#endif /* NUISwipeActionsConfiguration_h */
