//
//  NNSProgress.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSProgress.h"

#define instancetype NSProgress
#define js_value_instancetype js_value_NSProgress

NNSProgress::NNSProgress() {}
NNSProgress::~NNSProgress() {}

JS_INIT_CLASS(NSProgress, NSObject);
  JS_ASSIGN_STATIC_METHOD(currentProgress);
  JS_ASSIGN_STATIC_METHOD(progressWithTotalUnitCount);
  JS_ASSIGN_STATIC_METHOD(discreteProgressWithTotalUnitCount);
  JS_ASSIGN_STATIC_METHOD(progressWithTotalUnitCountParentPendingUnitCount);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_STATIC_METHOD(addSubscriberForFileURLWithPublishingHandler);
  JS_ASSIGN_STATIC_METHOD(removeSubscriber);
#endif
  JS_ASSIGN_PROTO_METHOD(initWithParentUserInfo);
  JS_ASSIGN_PROTO_METHOD(becomeCurrentWithPendingUnitCount);
  JS_ASSIGN_PROTO_METHOD(performAsCurrentWithPendingUnitCountUsingBlock);
  JS_ASSIGN_PROTO_METHOD(resignCurrent);
  JS_ASSIGN_PROTO_METHOD(addChildWithPendingUnitCount);
  JS_ASSIGN_PROTO_METHOD(setUserInfoObjectForKey);
  JS_ASSIGN_PROTO_METHOD(cancel);
  JS_ASSIGN_PROTO_METHOD(pause);
  JS_ASSIGN_PROTO_METHOD(resume);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(publish);
  JS_ASSIGN_PROTO_METHOD(unpublish);
#endif
  JS_ASSIGN_PROTO_PROP(totalUnitCount);
  JS_ASSIGN_PROTO_PROP(completedUnitCount);
  JS_ASSIGN_PROTO_PROP(localizedDescription);
  JS_ASSIGN_PROTO_PROP(localizedAdditionalDescription);
  JS_ASSIGN_PROTO_PROP(isCancellable);
  JS_ASSIGN_PROTO_PROP(isPausable);
  JS_ASSIGN_PROTO_PROP_READONLY(isCancelled);
  JS_ASSIGN_PROTO_PROP_READONLY(isPaused);
  JS_ASSIGN_PROTO_PROP(cancellationHandler);
  JS_ASSIGN_PROTO_PROP(pausingHandler);
  JS_ASSIGN_PROTO_PROP(resumingHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(isIndeterminate);
  JS_ASSIGN_PROTO_PROP_READONLY(fractionCompleted);
  JS_ASSIGN_PROTO_PROP_READONLY(isFinished);
  JS_ASSIGN_PROTO_PROP_READONLY(userInfo);
  JS_ASSIGN_PROTO_PROP(kind);
  JS_ASSIGN_PROTO_PROP(estimatedTimeRemaining);
  JS_ASSIGN_PROTO_PROP(throughput);
  JS_ASSIGN_PROTO_PROP(fileOperationKind);
  JS_ASSIGN_PROTO_PROP(fileURL);
  JS_ASSIGN_PROTO_PROP(fileTotalCount);
  JS_ASSIGN_PROTO_PROP(fileCompletedCount);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP_READONLY(isOld);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSProgress, NSObject);
  // constant values (exports)

  //#pragma mark *** Details of General Progress ***

  /* How much time is probably left in the operation, as an NSNumber containing a number of seconds.
  */
  JS_ASSIGN_ENUM(NSProgressEstimatedTimeRemainingKey, NSProgressUserInfoKey); //  NS_AVAILABLE(10_9, 7_0);

  /* How fast data is being processed, as an NSNumber containing bytes per second.
  */
  JS_ASSIGN_ENUM(NSProgressThroughputKey, NSProgressUserInfoKey); //  NS_AVAILABLE(10_9, 7_0);

  //#pragma mark *** Details of File Progress ***

  /* The value for the kind property that indicates that the work being done is one of the kind of file operations listed below. NSProgress of this kind is assumed to use bytes as the unit of work being done and the default implementation of -localizedDescription takes advantage of that to return more specific text than it could otherwise. The NSProgressFileTotalCountKey and NSProgressFileCompletedCountKey keys in the userInfo dictionary are used for the overall count of files.
  */
  JS_ASSIGN_ENUM(NSProgressKindFile, NSProgressKind); //  NS_AVAILABLE(10_9, 7_0);

  /* A user info dictionary key, for an entry that is required when the value for the kind property is NSProgressKindFile. The value must be one of the strings listed in the next section. The default implementations of of -localizedDescription and -localizedItemDescription use this value to determine the text that they return.
  */
  JS_ASSIGN_ENUM(NSProgressFileOperationKindKey, NSProgressUserInfoKey); //  NS_AVAILABLE(10_9, 7_0);

  /* Possible values for NSProgressFileOperationKindKey entries.
  */
  JS_ASSIGN_ENUM(NSProgressFileOperationKindDownloading, NSProgressFileOperationKind); //  NS_AVAILABLE(10_9, 7_0);
  JS_ASSIGN_ENUM(NSProgressFileOperationKindDecompressingAfterDownloading, NSProgressFileOperationKind); //  NS_AVAILABLE(10_9, 7_0);
  JS_ASSIGN_ENUM(NSProgressFileOperationKindReceiving, NSProgressFileOperationKind); //  NS_AVAILABLE(10_9, 7_0);
  JS_ASSIGN_ENUM(NSProgressFileOperationKindCopying, NSProgressFileOperationKind); //  NS_AVAILABLE(10_9, 7_0);

  /* A user info dictionary key. The value must be an NSURL identifying the item on which progress is being made. This is required for any NSProgress that is published using -publish to be reported to subscribers registered with +addSubscriberForFileURL:withPublishingHandler:.
  */
  JS_ASSIGN_ENUM(NSProgressFileURLKey, NSProgressUserInfoKey); //  NS_AVAILABLE(10_9, 7_0);

  /* User info dictionary keys. The values must be NSNumbers containing integers. These entries are optional but if they are both present then the default implementation of -localizedAdditionalDescription uses them to determine the text that it returns.
  */
  JS_ASSIGN_ENUM(NSProgressFileTotalCountKey, NSProgressUserInfoKey); //  NS_AVAILABLE(10_9, 7_0);
  JS_ASSIGN_ENUM(NSProgressFileCompletedCountKey, NSProgressUserInfoKey); //  NS_AVAILABLE(10_9, 7_0);

#if !TARGET_OS_IPHONE
  /* User info dictionary keys. The value for the first entry must be an NSImage, typically an icon. The value for the second entry must be an NSValue containing an NSRect, in screen coordinates, locating the image where it initially appears on the screen.
  */
  JS_ASSIGN_ENUM(NSProgressFileAnimationImageKey, NSProgressUserInfoKey); //  API_AVAILABLE(macos(10.9)) API_UNAVAILABLE(ios, watchos, tvos);
  JS_ASSIGN_ENUM(NSProgressFileAnimationImageOriginalRectKey, NSProgressUserInfoKey); //  API_AVAILABLE(macos(10.9)) API_UNAVAILABLE(ios, watchos, tvos);

  /* A user info dictionary key. The value must be an NSImage containing an icon. This entry is optional but, if it is present, the Finder will use it to show the icon of a file while progress is being made on that file. For example, the App Store uses this to specify an icon for an application being downloaded before the icon can be gotten from the application bundle itself.
  */
  JS_ASSIGN_ENUM(NSProgressFileIconKey, NSProgressUserInfoKey); //  API_AVAILABLE(macos(10.9)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

JS_INIT_CLASS_END(NSProgress, NSObject);

NAN_METHOD(NNSProgress::New) {
  JS_RECONSTRUCT(NSProgress);
  @autoreleasepool {
    NSProgress* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSProgress *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSProgress alloc] init];
    }
    if (self) {
      NNSProgress *wrapper = new NNSProgress();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSProgress::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSProgress::currentProgress) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSProgress([NSProgress currentProgress]));
  }
}

NAN_METHOD(NNSProgress::progressWithTotalUnitCount) {
  declare_autoreleasepool {
    declare_args();
    declare_value(int64_t, unitCount);
    JS_SET_RETURN(js_value_NSProgress([NSProgress progressWithTotalUnitCount: unitCount]));
  }
}

NAN_METHOD(NNSProgress::discreteProgressWithTotalUnitCount) {
  declare_autoreleasepool {
    declare_args();
    declare_value(int64_t, unitCount);
    JS_SET_RETURN(js_value_NSProgress([NSProgress discreteProgressWithTotalUnitCount: unitCount]));
  }
}

NAN_METHOD(NNSProgress::progressWithTotalUnitCountParentPendingUnitCount) {
  declare_autoreleasepool {
    declare_args();
    declare_value(int64_t, unitCount);
    declare_pointer(NSProgress, parent);
    declare_value(int64_t, portionOfParentTotalUnitCount);
    JS_SET_RETURN(js_value_NSProgress([NSProgress progressWithTotalUnitCount: unitCount parent: parent pendingUnitCount: portionOfParentTotalUnitCount]));
  }
}

#include "NNSURL.h"

#if !TARGET_OS_IPHONE
NAN_METHOD(NNSProgress::addSubscriberForFileURLWithPublishingHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_callback(publishingHandler);
    JS_SET_RETURN(js_value_id([NSProgress addSubscriberForFileURL: url withPublishingHandler: publishingHandler]));
  }
}

NAN_METHOD(NNSProgress::removeSubscriber) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id, subscriber);
    [NSProgress removeSubscriber: subscriber];
  }
}
#endif

NAN_METHOD(NNSProgress::initWithParentUserInfo) {
  JS_UNWRAP_OR_ALLOC(NSProgress, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSProgress, parentProgressOrNil);
    declare_nullable_pointer(NSDictionary/* <NSProgressUserInfoKey, id>*/, userInfoOrNil);
    JS_SET_RETURN(js_value_instancetype([self initWithParent: parentProgressOrNil userInfo: userInfoOrNil]));
  }
}

NAN_METHOD(NNSProgress::becomeCurrentWithPendingUnitCount) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int64_t, unitCount);
    [self becomeCurrentWithPendingUnitCount: unitCount];
  }
}

NAN_METHOD(NNSProgress::performAsCurrentWithPendingUnitCountUsingBlock) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int64_t, unitCount);
    declare_callback(work);
    [self performAsCurrentWithPendingUnitCount: unitCount usingBlock:^{
      if (work) {
        [work jsFunction]->Call("NNSProgress::performAsCurrentWithPendingUnitCountUsingBlock");
      }
    }];
  }
}

NAN_METHOD(NNSProgress::resignCurrent) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    [self resignCurrent];
  }
}

NAN_METHOD(NNSProgress::addChildWithPendingUnitCount) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSProgress, child);
    declare_value(int64_t, inUnitCount);
    [self addChild: child withPendingUnitCount: inUnitCount];
  }
}

NAN_METHOD(NNSProgress::setUserInfoObjectForKey) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, objectOrNil);
    declare_value(NSProgressUserInfoKey, key);
    [self setUserInfoObject: objectOrNil forKey: key];
  }
}

NAN_METHOD(NNSProgress::cancel) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    [self cancel];
  }
}

NAN_METHOD(NNSProgress::pause) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    [self pause];
  }
}

NAN_METHOD(NNSProgress::resume) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    [self resume];
  }
}

#if !TARGET_OS_IPHONE

NAN_METHOD(NNSProgress::publish) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    [self publish];
  }
}

NAN_METHOD(NNSProgress::unpublish) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    [self unpublish];
  }
}

#endif // !TARGET_OS_IPHONE

NAN_GETTER(NNSProgress::totalUnitCountGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_int64_t([self totalUnitCount]));
  }
}

NAN_SETTER(NNSProgress::totalUnitCountSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(int64_t, input);
    [self setTotalUnitCount: input];
  }
}

NAN_GETTER(NNSProgress::completedUnitCountGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_int64_t([self completedUnitCount]));
  }
}

NAN_SETTER(NNSProgress::completedUnitCountSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(int64_t, input);
    [self setCompletedUnitCount: input];
  }
}

NAN_GETTER(NNSProgress::localizedDescriptionGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedDescription]));
  }
}

NAN_SETTER(NNSProgress::localizedDescriptionSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLocalizedDescription: input];
  }
}

NAN_GETTER(NNSProgress::localizedAdditionalDescriptionGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedAdditionalDescription]));
  }
}

NAN_SETTER(NNSProgress::localizedAdditionalDescriptionSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLocalizedAdditionalDescription: input];
  }
}

NAN_GETTER(NNSProgress::isCancellableGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCancellable]));
  }
}

NAN_SETTER(NNSProgress::isCancellableSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCancellable: input];
  }
}

NAN_GETTER(NNSProgress::isPausableGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPausable]));
  }
}

NAN_SETTER(NNSProgress::isPausableSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPausable: input];
  }
}

NAN_GETTER(NNSProgress::isCancelledGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCancelled]));
  }
}

NAN_GETTER(NNSProgress::isPausedGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_GETTER(NNSProgress::cancellationHandlerGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    auto handler = [self cancellationHandler];
    JS_TODO();
  }
}

NAN_SETTER(NNSProgress::cancellationHandlerSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_callback(input);
    JS_TODO();
  }
}

NAN_GETTER(NNSProgress::pausingHandlerGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    auto handler = [self pausingHandler];
    JS_TODO();
  }
}

NAN_SETTER(NNSProgress::pausingHandlerSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_callback(input);
    JS_TODO();
  }
}

NAN_GETTER(NNSProgress::resumingHandlerGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    auto handler = [self resumingHandler];
    JS_TODO();
  }
}

NAN_SETTER(NNSProgress::resumingHandlerSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_callback(input);
    JS_TODO();
  }
}

NAN_GETTER(NNSProgress::isIndeterminateGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isIndeterminate]));
  }
}

NAN_GETTER(NNSProgress::fractionCompletedGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self fractionCompleted]));
  }
}

NAN_GETTER(NNSProgress::isFinishedGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFinished]));
  }
}

NAN_GETTER(NNSProgress::userInfoGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSProgressUserInfoKey, id>*/([self userInfo]));
  }
}

NAN_GETTER(NNSProgress::kindGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSProgressKind([self kind]));
  }
}

NAN_SETTER(NNSProgress::kindSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSProgressKind, input);
    [self setKind: input];
  }
}

NAN_GETTER(NNSProgress::estimatedTimeRemainingGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self estimatedTimeRemaining]));
  }
}

NAN_SETTER(NNSProgress::estimatedTimeRemainingSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSNumber, input);
    [self setEstimatedTimeRemaining: input];
  }
}

NAN_GETTER(NNSProgress::throughputGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self throughput]));
  }
}

NAN_SETTER(NNSProgress::throughputSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSNumber, input);
    [self setThroughput: input];
  }
}

NAN_GETTER(NNSProgress::fileOperationKindGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSProgressFileOperationKind([self fileOperationKind]));
  }
}

NAN_SETTER(NNSProgress::fileOperationKindSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSProgressFileOperationKind, input);
    [self setFileOperationKind: input];
  }
}

NAN_GETTER(NNSProgress::fileURLGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self fileURL]));
  }
}

NAN_SETTER(NNSProgress::fileURLSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSURL, input);
    [self setFileURL: input];
  }
}

NAN_GETTER(NNSProgress::fileTotalCountGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self fileTotalCount]));
  }
}

NAN_SETTER(NNSProgress::fileTotalCountSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSNumber, input);
    [self setFileTotalCount: input];
  }
}

NAN_GETTER(NNSProgress::fileCompletedCountGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self fileCompletedCount]));
  }
}

NAN_SETTER(NNSProgress::fileCompletedCountSetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSNumber, input);
    [self setFileCompletedCount: input];
  }
}

#if !TARGET_OS_IPHONE
NAN_GETTER(NNSProgress::isOldGetter) {
  JS_UNWRAP(NSProgress, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isOld]));
  }
}
#endif
