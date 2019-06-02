//
//  NNSUserDefaults.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSUserDefaults_h
#define NNSUserDefaults_h

#include "NNSObject.h"

#define js_value_NSUserDefaults(x) js_value_wrapper(x, NSUserDefaults)
#define to_value_NSUserDefaults(x) to_value_wrapper(x, NSUserDefaults)
#define is_value_NSUserDefaults(x) is_value_wrapper(x, NSUserDefaults)

JS_WRAP_CLASS(NSUserDefaults, NSObject);
  JS_PROP(StandardUserDefaults);
  JS_METHOD(Synchronize);
  JS_METHOD(SetValueForKey);
  JS_METHOD(ObjectForKey);
  JS_METHOD(StringForKey);
JS_WRAP_CLASS_END(NSUserDefaults);

#endif /* NNSUserDefaults_h */
