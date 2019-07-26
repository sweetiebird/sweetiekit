//
//  NGCEventViewController.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGCEventViewController_h
#define NGCEventViewController_h    

#include "NUIViewController.h"

#define js_value_GCEventViewController(x) js_value_wrapper(x, GCEventViewController)
#define to_value_GCEventViewController(x) to_value_wrapper(x, GCEventViewController)
#define is_value_GCEventViewController(x) is_value_wrapper(x, GCEventViewController)

JS_WRAP_CLASS(GCEventViewController, UIViewController);
  JS_PROP(controllerUserInteractionEnabled);
JS_WRAP_CLASS_END(GCEventViewController);

#endif /* NGCEventViewController_h */
