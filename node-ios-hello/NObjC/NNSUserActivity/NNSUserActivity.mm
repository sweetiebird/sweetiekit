//
//  NNSUserActivity.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSUserActivity.h"

#define instancetype NSUserActivity
#define js_value_instancetype js_value_NSUserActivity

NNSUserActivity::NNSUserActivity() {}
NNSUserActivity::~NNSUserActivity() {}

JS_INIT_CLASS(NSUserActivity, NSObject);
  JS_ASSIGN_STATIC_METHOD(deleteSavedUserActivitiesWithPersistentIdentifiersCompletionHandler);
  JS_ASSIGN_STATIC_METHOD(deleteAllSavedUserActivitiesWithCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(initWithActivityType);
  JS_ASSIGN_PROTO_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(addUserInfoEntriesFromDictionary);
  JS_ASSIGN_PROTO_METHOD(becomeCurrent);
  JS_ASSIGN_PROTO_METHOD(resignCurrent);
  JS_ASSIGN_PROTO_METHOD(invalidate);
  JS_ASSIGN_PROTO_METHOD(getContinuationStreamsWithCompletionHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(activityType);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(userInfo);
  JS_ASSIGN_PROTO_PROP(requiredUserInfoKeys);
  JS_ASSIGN_PROTO_PROP(needsSave);
  JS_ASSIGN_PROTO_PROP(webpageURL);
  JS_ASSIGN_PROTO_PROP(referrerURL);
  JS_ASSIGN_PROTO_PROP(expirationDate);
  JS_ASSIGN_PROTO_PROP(keywords);
  JS_ASSIGN_PROTO_PROP(supportsContinuationStreams);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(isEligibleForHandoff);
  JS_ASSIGN_PROTO_PROP(isEligibleForSearch);
  JS_ASSIGN_PROTO_PROP(isEligibleForPublicIndexing);
  JS_ASSIGN_PROTO_PROP(isEligibleForPrediction);
  JS_ASSIGN_PROTO_PROP(persistentIdentifier);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSUserActivity, NSObject);
  // constant values (exports)
  
  JS_ASSIGN_ENUM(NSUserActivityTypeBrowsingWeb, NSString);

JS_INIT_CLASS_END(NSUserActivity, NSObject);

NAN_METHOD(NNSUserActivity::New) {
  JS_RECONSTRUCT(NSUserActivity);
  @autoreleasepool {
    NSUserActivity* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSUserActivity *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSUserActivity alloc] init];
    }
    if (self) {
      NNSUserActivity *wrapper = new NNSUserActivity();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSUserActivity::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSUserActivity::deleteSavedUserActivitiesWithPersistentIdentifiersCompletionHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSUserActivityPersistentIdentifier>, persistentIdentifiers);
    declare_callback(handler);
    [NSUserActivity deleteSavedUserActivitiesWithPersistentIdentifiers: persistentIdentifiers completionHandler:^{
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NNSUserActivity::deleteSavedUserActivitiesWithPersistentIdentifiersCompletionHandler");
        }
      });
    }];
  }
}

NAN_METHOD(NNSUserActivity::deleteAllSavedUserActivitiesWithCompletionHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_callback(handler);
    [NSUserActivity deleteAllSavedUserActivitiesWithCompletionHandler:^{
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NNSUserActivity::deleteSavedUserActivitiesWithPersistentIdentifiersCompletionHandler");
        }
      });
    }];
  }
}

NAN_METHOD(NNSUserActivity::initWithActivityType) {
  JS_UNWRAP_OR_ALLOC(NSUserActivity, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, activityType);
    JS_SET_RETURN(js_value_instancetype([self initWithActivityType: activityType]));
  }
}

NAN_METHOD(NNSUserActivity::init) {
  JS_UNWRAP_OR_ALLOC(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self init]));
  }
}

NAN_METHOD(NNSUserActivity::addUserInfoEntriesFromDictionary) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary, otherDictionary);
    [self addUserInfoEntriesFromDictionary: otherDictionary];
  }
}

NAN_METHOD(NNSUserActivity::becomeCurrent) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    [self becomeCurrent];
  }
}

NAN_METHOD(NNSUserActivity::resignCurrent) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    [self resignCurrent];
  }
}

NAN_METHOD(NNSUserActivity::invalidate) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    [self invalidate];
  }
}

#include "NNSInputStream.h"
#include "NNSOutputStream.h"
#include "NNSError.h"

NAN_METHOD(NNSUserActivity::getContinuationStreamsWithCompletionHandler) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(handler);
    [self getContinuationStreamsWithCompletionHandler:^(NSInputStream * _Nullable inputStream, NSOutputStream * _Nullable outputStream, NSError * _Nullable error) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NNSUserActivity::getContinuationStreamsWithCompletionHandler",
            js_value_NSInputStream(inputStream),
            js_value_NSOutputStream(outputStream),
            js_value_NSError(error));
        }
      });
    }];
  }
}

NAN_GETTER(NNSUserActivity::activityTypeGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self activityType]));
  }
}

NAN_GETTER(NNSUserActivity::titleGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NNSUserActivity::titleSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NNSUserActivity::userInfoGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self userInfo]));
  }
}

NAN_SETTER(NNSUserActivity::userInfoSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary, input);
    [self setUserInfo: input];
  }
}

NAN_GETTER(NNSUserActivity::requiredUserInfoKeysGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <NSString*>*/([self requiredUserInfoKeys]));
  }
}

NAN_SETTER(NNSUserActivity::requiredUserInfoKeysSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSSet/* <NSString*>*/, input);
    [self setRequiredUserInfoKeys: input];
  }
}

NAN_GETTER(NNSUserActivity::needsSaveGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self needsSave]));
  }
}

NAN_SETTER(NNSUserActivity::needsSaveSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNeedsSave: input];
  }
}

#include "NNSURL.h"

NAN_GETTER(NNSUserActivity::webpageURLGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self webpageURL]));
  }
}

NAN_SETTER(NNSUserActivity::webpageURLSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSURL, input);
    [self setWebpageURL: input];
  }
}

NAN_GETTER(NNSUserActivity::referrerURLGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self referrerURL]));
  }
}

NAN_SETTER(NNSUserActivity::referrerURLSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSURL, input);
    [self setReferrerURL: input];
  }
}

NAN_GETTER(NNSUserActivity::expirationDateGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self expirationDate]));
  }
}

NAN_SETTER(NNSUserActivity::expirationDateSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setExpirationDate: input];
  }
}

NAN_GETTER(NNSUserActivity::keywordsGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <NSString*>*/([self keywords]));
  }
}

NAN_SETTER(NNSUserActivity::keywordsSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSSet/* <NSString*>*/, input);
    [self setKeywords: input];
  }
}

NAN_GETTER(NNSUserActivity::supportsContinuationStreamsGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self supportsContinuationStreams]));
  }
}

NAN_SETTER(NNSUserActivity::supportsContinuationStreamsSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSupportsContinuationStreams: input];
  }
}

#include "NNSUserActivityDelegate.h"

NAN_GETTER(NNSUserActivity::delegateGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id<NSUserActivityDelegate>([self delegate]));
  }
}

NAN_SETTER(NNSUserActivity::delegateSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <NSUserActivityDelegate>*/, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NNSUserActivity::delegate"];
  }
}

NAN_GETTER(NNSUserActivity::isEligibleForHandoffGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEligibleForHandoff]));
  }
}

NAN_SETTER(NNSUserActivity::isEligibleForHandoffSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEligibleForHandoff: input];
  }
}

NAN_GETTER(NNSUserActivity::isEligibleForSearchGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEligibleForSearch]));
  }
}

NAN_SETTER(NNSUserActivity::isEligibleForSearchSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEligibleForSearch: input];
  }
}

NAN_GETTER(NNSUserActivity::isEligibleForPublicIndexingGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEligibleForPublicIndexing]));
  }
}

NAN_SETTER(NNSUserActivity::isEligibleForPublicIndexingSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEligibleForPublicIndexing: input];
  }
}

NAN_GETTER(NNSUserActivity::isEligibleForPredictionGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEligibleForPrediction]));
  }
}

NAN_SETTER(NNSUserActivity::isEligibleForPredictionSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEligibleForPrediction: input];
  }
}

NAN_GETTER(NNSUserActivity::persistentIdentifierGetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUserActivityPersistentIdentifier([self persistentIdentifier]));
  }
}

NAN_SETTER(NNSUserActivity::persistentIdentifierSetter) {
  JS_UNWRAP(NSUserActivity, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUserActivityPersistentIdentifier, input);
    [self setPersistentIdentifier: input];
  }
}
