//
//  NCLHeading.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLHeading_h
#define NCLHeading_h

#import "NNSObject.h"

#define js_value_CLHeading(x) js_value_wrapper(x, CLHeading)
#define to_value_CLHeading(x) to_value_wrapper(x, CLHeading)
#define is_value_CLHeading(x) is_value_wrapper(x, CLHeading)

JS_WRAP_CLASS(CLHeading, NSObject);
  JS_PROP(MagneticHeading);
  JS_PROP(TrueHeading);
  JS_PROP(HeadingAccuracy);
  JS_PROP(Timestamp);
  JS_PROP(X);
  JS_PROP(Y);
  JS_PROP(Z);
JS_WRAP_CLASS_END(CLHeading);

#endif /* NCLHeading_h */
