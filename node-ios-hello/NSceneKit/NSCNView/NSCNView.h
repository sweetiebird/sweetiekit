//
//  NSCNView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNView_h
#define NSCNView_h

#include "NUIView.h"

#define js_value_SCNView(x) js_value_wrapper(x, SCNView)
#define to_value_SCNView(x) to_value_wrapper(x, SCNView)
#define is_value_SCNView(x) is_value_wrapper(x, SCNView)

JS_WRAP_CLASS(SCNView, UIView);
  JS_PROP(AutoenablesDefaultLighting);
  JS_PROP(Playing);
JS_WRAP_CLASS_END(SCNView);

#endif /* NSCNView_h */
