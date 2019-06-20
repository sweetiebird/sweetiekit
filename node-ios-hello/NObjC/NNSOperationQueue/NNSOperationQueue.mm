//
//  NNSOperationQueue.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSOperationQueue.h"

#define instancetype NSOperationQueue
#define js_value_instancetype js_value_NSOperationQueue

NNSOperationQueue::NNSOperationQueue() {}
NNSOperationQueue::~NNSOperationQueue() {}

JS_INIT_CLASS(NSOperationQueue, NSObject);
  JS_ASSIGN_PROTO_METHOD(addOperation);
  JS_ASSIGN_PROTO_METHOD(addOperationsWaitUntilFinished);
  JS_ASSIGN_PROTO_METHOD(addOperationWithBlock);
  JS_ASSIGN_PROTO_METHOD(cancelAllOperations);
  JS_ASSIGN_PROTO_METHOD(waitUntilAllOperationsAreFinished);
  JS_ASSIGN_PROTO_PROP_READONLY(operations);
  JS_ASSIGN_PROTO_PROP_READONLY(operationCount);
  JS_ASSIGN_PROTO_PROP(maxConcurrentOperationCount);
  JS_ASSIGN_PROTO_PROP(isSuspended);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(qualityOfService);
  JS_ASSIGN_PROTO_PROP(underlyingQueue);
  JS_ASSIGN_STATIC_PROP_READONLY(currentQueue);
  JS_ASSIGN_STATIC_PROP_READONLY(mainQueue);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSOperationQueue, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, NSOperationQueuePriority) {
    JS_ASSIGN_ENUM(NSOperationQueuePriorityVeryLow, NSInteger); // = -8L,
    JS_ASSIGN_ENUM(NSOperationQueuePriorityLow, NSInteger); // = -4L,
    JS_ASSIGN_ENUM(NSOperationQueuePriorityNormal, NSInteger); // = 0,
    JS_ASSIGN_ENUM(NSOperationQueuePriorityHigh, NSInteger); // = 4,
    JS_ASSIGN_ENUM(NSOperationQueuePriorityVeryHigh, NSInteger); // = 8
  //};

JS_INIT_CLASS_END(NSOperationQueue, NSObject);

NAN_METHOD(NNSOperationQueue::New) {
  JS_RECONSTRUCT(NSOperationQueue);
  @autoreleasepool {
    NSOperationQueue* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSOperationQueue *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSOperationQueue alloc] init];
    }
    if (self) {
      NNSOperationQueue *wrapper = new NNSOperationQueue();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSOperationQueue::New: invalid arguments");
    }
  }
}

#include "NNSOperation.h"

NAN_METHOD(NNSOperationQueue::addOperation) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSOperation, op);
    [self addOperation: op];
  }
}

NAN_METHOD(NNSOperationQueue::addOperationsWaitUntilFinished) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSOperation*>, ops);
    declare_value(BOOL, wait);
    [self addOperations: ops waitUntilFinished: wait];
  }
}

NAN_METHOD(NNSOperationQueue::addOperationWithBlock) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self addOperationWithBlock:^{
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NNSOperationQueue::addOperationWithBlock");
          clear_callback(block);
        }
      });
    }];
    JS_SET_RETURN(js_value_id(block));
  }
}

NAN_METHOD(NNSOperationQueue::cancelAllOperations) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    [self cancelAllOperations];
  }
}

NAN_METHOD(NNSOperationQueue::waitUntilAllOperationsAreFinished) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    [self waitUntilAllOperationsAreFinished];
  }
}

NAN_GETTER(NNSOperationQueue::operationsGetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSOperation*>([self operations]));
  }
}

NAN_GETTER(NNSOperationQueue::operationCountGetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self operationCount]));
  }
}

NAN_GETTER(NNSOperationQueue::maxConcurrentOperationCountGetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self maxConcurrentOperationCount]));
  }
}

NAN_SETTER(NNSOperationQueue::maxConcurrentOperationCountSetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setMaxConcurrentOperationCount: input];
  }
}

NAN_GETTER(NNSOperationQueue::isSuspendedGetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSuspended]));
  }
}

NAN_SETTER(NNSOperationQueue::isSuspendedSetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSuspended: input];
  }
}

NAN_GETTER(NNSOperationQueue::nameGetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NNSOperationQueue::nameSetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

#include "NNSObjCRuntime.h"

NAN_GETTER(NNSOperationQueue::qualityOfServiceGetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSQualityOfService([self qualityOfService]));
  }
}

NAN_SETTER(NNSOperationQueue::qualityOfServiceSetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSQualityOfService, input);
    [self setQualityOfService: input];
  }
}

#define js_value_dispatch_queue_t(x) js_value_bridged(x, dispatch_queue_t)
#define to_value_dispatch_queue_t(x) to_value_bridged(x, dispatch_queue_t)
#define is_value_dispatch_queue_t(x) is_value_bridged(x, dispatch_queue_t)

NAN_GETTER(NNSOperationQueue::underlyingQueueGetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    // TODO: Incompatible types casting 'dispatch_queue_t _Nullable' (aka 'NSObject<OS_dispatch_queue> *') to 'id' with a __bridge cast
    JS_SET_RETURN(js_value_dispatch_queue_t([self underlyingQueue]));
    #endif
  }
}

NAN_SETTER(NNSOperationQueue::underlyingQueueSetter) {
  JS_UNWRAP(NSOperationQueue, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    // TODO: Incompatible types casting 'id _Nullable' to 'dispatch_queue_t' (aka 'NSObject<OS_dispatch_queue> *') with a __bridge cast
    declare_value(dispatch_queue_t, input);
    [self setUnderlyingQueue: input];
    #endif
  }
}

NAN_GETTER(NNSOperationQueue::currentQueueGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSOperationQueue([NSOperationQueue currentQueue]));
  }
}

NAN_GETTER(NNSOperationQueue::mainQueueGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSOperationQueue([NSOperationQueue mainQueue]));
  }
}
