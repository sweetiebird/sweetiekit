//
//  NGifManager.h
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGifManager_h
#define NGifManager_h

#include "NNSObject.h"

#define js_value_GifManager(x) js_value_wrapper(x, GifManager)
#define to_value_GifManager(x) to_value_wrapper(x, GifManager)
#define is_value_GifManager(x) is_value_wrapper(x, GifManager)

JS_WRAP_CLASS(GifManager, NSObject);
JS_WRAP_CLASS_END(GifManager);

#endif /* NGifManager_h */
