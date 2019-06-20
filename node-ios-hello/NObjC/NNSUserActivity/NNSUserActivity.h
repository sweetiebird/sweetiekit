//
//  NNSUserActivity.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSUserActivity_h
#define NNSUserActivity_h    

#include "NNSObject.h"

#define js_value_NSUserActivity(x) js_value_wrapper(x, NSUserActivity)
#define to_value_NSUserActivity(x) to_value_wrapper(x, NSUserActivity)
#define is_value_NSUserActivity(x) is_value_wrapper(x, NSUserActivity)

#define js_value_NSUserActivityPersistentIdentifier(x) JS_ENUM(NSUserActivityPersistentIdentifier, NSString, x)
#define to_value_NSUserActivityPersistentIdentifier(x) TO_ENUM(NSUserActivityPersistentIdentifier, NSString, x)
#define is_value_NSUserActivityPersistentIdentifier(x) IS_ENUM(NSUserActivityPersistentIdentifier, NSString, x)

JS_WRAP_CLASS(NSUserActivity, NSObject);
  JS_STATIC_METHOD(deleteSavedUserActivitiesWithPersistentIdentifiersCompletionHandler);
  JS_STATIC_METHOD(deleteAllSavedUserActivitiesWithCompletionHandler);
  JS_METHOD(initWithActivityType);
  JS_METHOD(init);
  JS_METHOD(addUserInfoEntriesFromDictionary);
  JS_METHOD(becomeCurrent);
  JS_METHOD(resignCurrent);
  JS_METHOD(invalidate);
  JS_METHOD(getContinuationStreamsWithCompletionHandler);
  JS_PROP_READONLY(activityType);
  JS_PROP(title);
  JS_PROP(userInfo);
  JS_PROP(requiredUserInfoKeys);
  JS_PROP(needsSave);
  JS_PROP(webpageURL);
  JS_PROP(referrerURL);
  JS_PROP(expirationDate);
  JS_PROP(keywords);
  JS_PROP(supportsContinuationStreams);
  JS_PROP(delegate);
  JS_PROP(isEligibleForHandoff);
  JS_PROP(isEligibleForSearch);
  JS_PROP(isEligibleForPublicIndexing);
  JS_PROP(isEligibleForPrediction);
  JS_PROP(persistentIdentifier);
JS_WRAP_CLASS_END(NSUserActivity);

#endif /* NNSUserActivity_h */
