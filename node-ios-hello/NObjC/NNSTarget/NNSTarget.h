//
//  NNSTarget.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSTarget_h
#define NNSTarget_h    

#include "NNSObject.h"

#define js_value_NSTarget(x) js_value_wrapper(x, NSTarget)
#define to_value_NSTarget(x) to_value_wrapper(x, NSTarget)
#define is_value_NSTarget(x) is_value_wrapper(x, NSTarget)

JS_WRAP_CLASS(NSTarget, NSObject);
  JS_PROP(callback);
  JS_PROP_READONLY(selector);
JS_WRAP_CLASS_END(NSTarget);

#if __OBJC__
@interface NSTarget : NSObject
- (IBAction)callback:(id)sender;
- (SEL)selector;
@end
#endif

#endif /* NNSTarget_h */
