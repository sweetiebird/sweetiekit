//
//  NNSProgress.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSProgress_h
#define NNSProgress_h    

#include "NNSObject.h"

#define js_value_NSProgress(x) js_value_wrapper(x, NSProgress)
#define to_value_NSProgress(x) to_value_wrapper(x, NSProgress)
#define is_value_NSProgress(x) is_value_wrapper(x, NSProgress)

#define js_value_NSProgressKind(x) JS_ENUM(NSProgressKind, NSString, x)
#define to_value_NSProgressKind(x) TO_ENUM(NSProgressKind, NSString, x)
#define is_value_NSProgressKind(x) IS_ENUM(NSProgressKind, NSString, x)

#define js_value_NSProgressUserInfoKey(x) JS_ENUM(NSProgressUserInfoKey, NSString, x)
#define to_value_NSProgressUserInfoKey(x) TO_ENUM(NSProgressUserInfoKey, NSString, x)
#define is_value_NSProgressUserInfoKey(x) IS_ENUM(NSProgressUserInfoKey, NSString, x)

#define js_value_NSProgressFileOperationKind(x) JS_ENUM(NSProgressFileOperationKind, NSString, x)
#define to_value_NSProgressFileOperationKind(x) TO_ENUM(NSProgressFileOperationKind, NSString, x)
#define is_value_NSProgressFileOperationKind(x) IS_ENUM(NSProgressFileOperationKind, NSString, x)

JS_WRAP_CLASS(NSProgress, NSObject);
  JS_STATIC_METHOD(currentProgress);
  JS_STATIC_METHOD(progressWithTotalUnitCount);
  JS_STATIC_METHOD(discreteProgressWithTotalUnitCount);
  JS_STATIC_METHOD(progressWithTotalUnitCountParentPendingUnitCount);
  JS_STATIC_METHOD(addSubscriberForFileURLWithPublishingHandler);
  JS_STATIC_METHOD(removeSubscriber);
  JS_METHOD(initWithParentUserInfo);
  JS_METHOD(becomeCurrentWithPendingUnitCount);
  JS_METHOD(performAsCurrentWithPendingUnitCountUsingBlock);
  JS_METHOD(resignCurrent);
  JS_METHOD(addChildWithPendingUnitCount);
  JS_METHOD(setUserInfoObjectForKey);
  JS_METHOD(cancel);
  JS_METHOD(pause);
  JS_METHOD(resume);
  JS_METHOD(publish);
  JS_METHOD(unpublish);
  JS_PROP(totalUnitCount);
  JS_PROP(completedUnitCount);
  JS_PROP(localizedDescription);
  JS_PROP(localizedAdditionalDescription);
  JS_PROP(isCancellable);
  JS_PROP(isPausable);
  JS_PROP_READONLY(isCancelled);
  JS_PROP_READONLY(isPaused);
  JS_PROP(cancellationHandler);
  JS_PROP(pausingHandler);
  JS_PROP(resumingHandler);
  JS_PROP_READONLY(isIndeterminate);
  JS_PROP_READONLY(fractionCompleted);
  JS_PROP_READONLY(isFinished);
  JS_PROP_READONLY(userInfo);
  JS_PROP(kind);
  JS_PROP(estimatedTimeRemaining);
  JS_PROP(throughput);
  JS_PROP(fileOperationKind);
  JS_PROP(fileURL);
  JS_PROP(fileTotalCount);
  JS_PROP(fileCompletedCount);
  JS_PROP_READONLY(isOld);
JS_WRAP_CLASS_END(NSProgress);

#endif /* NNSProgress_h */
