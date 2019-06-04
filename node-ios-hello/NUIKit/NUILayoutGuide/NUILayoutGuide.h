//
//  NUILayoutGuide.h
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUILayoutGuide_h
#define NUILayoutGuide_h    

#include "NNSObject.h"

#define js_value_UILayoutGuide(x) js_value_wrapper(x, UILayoutGuide)
#define to_value_UILayoutGuide(x) to_value_wrapper(x, UILayoutGuide)
#define is_value_UILayoutGuide(x) is_value_wrapper(x, UILayoutGuide)

JS_WRAP_CLASS(UILayoutGuide, NSObject);
  JS_PROP_READONLY(layoutFrame);
  JS_PROP(owningView);
  JS_PROP(identifier);
  JS_PROP_READONLY(leadingAnchor);
  JS_PROP_READONLY(trailingAnchor);
  JS_PROP_READONLY(leftAnchor);
  JS_PROP_READONLY(rightAnchor);
  JS_PROP_READONLY(topAnchor);
  JS_PROP_READONLY(bottomAnchor);
  JS_PROP_READONLY(widthAnchor);
  JS_PROP_READONLY(heightAnchor);
  JS_PROP_READONLY(centerXAnchor);
  JS_PROP_READONLY(centerYAnchor);
JS_WRAP_CLASS_END(UILayoutGuide);

#endif /* NUILayoutGuide_h */
