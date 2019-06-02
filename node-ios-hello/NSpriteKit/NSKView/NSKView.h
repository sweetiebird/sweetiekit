//
//  NSKView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKView_h
#define NSKView_h

#import "NUIView.h"

#define js_value_SKView(x) js_value_wrapper(x, SKView)
#define to_value_SKView(x) to_value_wrapper(x, SKView)
#define is_value_SKView(x) is_value_wrapper(x, SKView)

JS_WRAP_CLASS(SKView, UIView);
  JS_METHOD(presentScene);
JS_WRAP_CLASS_END(SKView);

#endif /* NSKView_h */
