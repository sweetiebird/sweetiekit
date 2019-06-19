//
//  NARSCNViewDelegate.h
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSCNViewDelegate_h
#define NARSCNViewDelegate_h

#include "NNSObject.h"

#define js_value_ARSCNViewDelegate(x) js_value_wrapper(x, ARSCNViewDelegate)
#define to_value_ARSCNViewDelegate(x) to_value_wrapper(x, ARSCNViewDelegate)
#define is_value_ARSCNViewDelegate(x) is_value_wrapper(x, ARSCNViewDelegate)

JS_WRAP_CLASS(ARSCNViewDelegate, NSObject);
  sweetiekit::JSFunction _nodeForAnchor;
JS_WRAP_CLASS_END(ARSCNViewDelegate);

#if __OBJC__
typedef SARSCNViewDelegate ARSCNViewDelegate;
#endif

#endif /* NARSCNViewDelegate_h */
