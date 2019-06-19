//
//  NNSUserDefaults.h
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
  JS_STATIC_PROP_READONLY(standardUserDefaults);
  JS_STATIC_METHOD(resetStandardUserDefaults);
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithSuiteName);
  JS_METHOD(initWithUser);
  JS_METHOD(objectForKey);
  JS_METHOD(setObjectForKey);
  JS_METHOD(removeObjectForKey);
  JS_METHOD(stringForKey);
  JS_METHOD(arrayForKey);
  JS_METHOD(dictionaryForKey);
  JS_METHOD(dataForKey);
  JS_METHOD(stringArrayForKey);
  JS_METHOD(integerForKey);
  JS_METHOD(floatForKey);
  JS_METHOD(doubleForKey);
  JS_METHOD(boolForKey);
  JS_METHOD(URLForKey);
  JS_METHOD(setIntegerForKey);
  JS_METHOD(setFloatForKey);
  JS_METHOD(setDoubleForKey);
  JS_METHOD(setBoolForKey);
  JS_METHOD(setURLForKey);
  JS_METHOD(registerDefaults);
  JS_METHOD(addSuiteNamed);
  JS_METHOD(removeSuiteNamed);
  JS_METHOD(dictionaryRepresentation);
  JS_METHOD(volatileDomainForName);
  JS_METHOD(setVolatileDomainForName);
  JS_METHOD(removeVolatileDomainForName);
  JS_METHOD(persistentDomainNames);
  JS_METHOD(persistentDomainForName);
  JS_METHOD(setPersistentDomainForName);
  JS_METHOD(removePersistentDomainForName);
  JS_METHOD(synchronize);
  JS_METHOD(objectIsForcedForKey);
  JS_METHOD(objectIsForcedForKeyInDomain);
  JS_PROP_READONLY(volatileDomainNames);

JS_WRAP_CLASS_END(NSUserDefaults);

#endif /* NNSUserDefaults_h */
