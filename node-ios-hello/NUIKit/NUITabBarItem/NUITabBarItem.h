//
//  NUITabBarItem.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarItem_h
#define NUITabBarItem_h

#include "NNSObject.h"

#define js_value_UITabBarItem(x) js_value_wrapper(x, UITabBarItem)
#define to_value_UITabBarItem(x) to_value_wrapper(x, UITabBarItem)
#define is_value_UITabBarItem(x) is_value_wrapper(x, UITabBarItem)

JS_WRAP_CLASS(UITabBarItem, NSObject);
JS_WRAP_CLASS_END(UITabBarItem);

#endif /* NUITabBarItem_h */
