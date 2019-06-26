//
//  NSCNSceneSource.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNSceneSource_h
#define NSCNSceneSource_h    

#include "NNSObject.h"

#define js_value_SCNSceneSource(x) js_value_wrapper(x, SCNSceneSource)
#define to_value_SCNSceneSource(x) to_value_wrapper(x, SCNSceneSource)
#define is_value_SCNSceneSource(x) is_value_wrapper(x, SCNSceneSource)

#define js_value_SCNSceneSourceLoadingOption(x) JS_ENUM(SCNSceneSourceLoadingOption, NSString, x)
#define to_value_SCNSceneSourceLoadingOption(x) TO_ENUM(SCNSceneSourceLoadingOption, NSString, x)
#define is_value_SCNSceneSourceLoadingOption(x) IS_ENUM(SCNSceneSourceLoadingOption, NSString, x)

#define js_value_SCNSceneSourceAnimationImportPolicy(x) JS_ENUM(SCNSceneSourceAnimationImportPolicy, NSString, x)
#define to_value_SCNSceneSourceAnimationImportPolicy(x) TO_ENUM(SCNSceneSourceAnimationImportPolicy, NSString, x)
#define is_value_SCNSceneSourceAnimationImportPolicy(x) IS_ENUM(SCNSceneSourceAnimationImportPolicy, NSString, x)

#define js_value_SCNDetailedErrorsKey(x) JS_ENUM(SCNDetailedErrorsKey, NSString, x)
#define to_value_SCNDetailedErrorsKey(x) TO_ENUM(SCNDetailedErrorsKey, NSString, x)
#define is_value_SCNDetailedErrorsKey(x) IS_ENUM(SCNDetailedErrorsKey, NSString, x)

#define js_value_SCNSceneSourceStatus(x) JS_ENUM(SCNSceneSourceStatus, NSInteger, x)
#define to_value_SCNSceneSourceStatus(x) TO_ENUM(SCNSceneSourceStatus, NSInteger, x)
#define is_value_SCNSceneSourceStatus(x) IS_ENUM(SCNSceneSourceStatus, NSInteger, x)

JS_WRAP_CLASS(SCNSceneSource, NSObject);
  JS_STATIC_METHOD(sceneSourceWithURLOptions);
  JS_STATIC_METHOD(sceneSourceWithDataOptions);
  JS_METHOD(initWithURLOptions);
  JS_METHOD(initWithDataOptions);
  JS_METHOD(sceneWithOptionsStatusHandler);
  JS_METHOD(sceneWithOptionsError);
  JS_METHOD(propertyForKey);
  JS_METHOD(entryWithIdentifierWithClass);
  JS_METHOD(identifiersOfEntriesWithClass);
  JS_METHOD(entriesPassingTest);
  JS_PROP_READONLY(url);
  JS_PROP_READONLY(data);
JS_WRAP_CLASS_END(SCNSceneSource);

#endif /* NSCNSceneSource_h */
