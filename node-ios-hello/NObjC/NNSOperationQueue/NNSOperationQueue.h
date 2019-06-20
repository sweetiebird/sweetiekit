//
//  NNSOperationQueue.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSOperationQueue_h
#define NNSOperationQueue_h    

#include "NNSObject.h"

#define js_value_NSOperationQueue(x) js_value_wrapper(x, NSOperationQueue)
#define to_value_NSOperationQueue(x) to_value_wrapper(x, NSOperationQueue)
#define is_value_NSOperationQueue(x) is_value_wrapper(x, NSOperationQueue)

#define js_value_NSOperationQueuePriority(x) JS_ENUM(NSOperationQueuePriority, NSInteger, x)
#define to_value_NSOperationQueuePriority(x) TO_ENUM(NSOperationQueuePriority, NSInteger, x)
#define is_value_NSOperationQueuePriority(x) IS_ENUM(NSOperationQueuePriority, NSInteger, x)

JS_WRAP_CLASS(NSOperationQueue, NSObject);
  JS_METHOD(addOperation);
  JS_METHOD(addOperationsWaitUntilFinished);
  JS_METHOD(addOperationWithBlock);
  JS_METHOD(cancelAllOperations);
  JS_METHOD(waitUntilAllOperationsAreFinished);
  JS_PROP_READONLY(operations);
  JS_PROP_READONLY(operationCount);
  JS_PROP(maxConcurrentOperationCount);
  JS_PROP(isSuspended);
  JS_PROP(name);
  JS_PROP(qualityOfService);
  JS_PROP(underlyingQueue);
  JS_STATIC_PROP_READONLY(currentQueue);
  JS_STATIC_PROP_READONLY(mainQueue);
JS_WRAP_CLASS_END(NSOperationQueue);

#endif /* NNSOperationQueue_h */
