//
//  NUIPopoverController.h
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPopoverController_h
#define NUIPopoverController_h    

#include "NNSObject.h"

#define js_value_UIPopoverController(x) js_value_wrapper(x, UIPopoverController)
#define to_value_UIPopoverController(x) to_value_wrapper(x, UIPopoverController)
#define is_value_UIPopoverController(x) is_value_wrapper(x, UIPopoverController)

JS_WRAP_CLASS(UIPopoverController, NSObject);
JS_WRAP_CLASS_END(UIPopoverController);

#endif /* NUIPopoverController_h */