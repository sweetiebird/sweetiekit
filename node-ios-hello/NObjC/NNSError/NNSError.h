//
//  NNSError.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSError_h
#define NNSError_h    

#include "NNSObject.h"

#define js_value_NSError(x) js_value_wrapper(x, NSError)
#define to_value_NSError(x) to_value_wrapper(x, NSError)
#define is_value_NSError(x) is_value_wrapper(x, NSError)

// Foundation enums
#define js_value_NSErrorDomain(x) JS_ENUM(NSErrorDomain, NSString, x)
#define to_value_NSErrorDomain(x) TO_ENUM(NSErrorDomain, NSString, x)
#define is_value_NSErrorDomain(x) IS_ENUM(NSErrorDomain, NSString, x)


NSError* _Nullable NSString_to_NSError(NSString* _Nullable message, NSString* _Nonnull domain = @"sweetiekit.Error", NSInteger code = -1);
NSString* _Nullable NSError_to_NSString(NSError* _Nullable error);

JS_WRAP_CLASS(NSError, NSObject);
  static Nan::Persistent<Object> JSErrorType;
// NSError
  JS_STATIC_METHOD(errorWithDomainCodeUserInfo);
  JS_STATIC_METHOD(setUserInfoValueProviderForDomainProvider);
  JS_STATIC_METHOD(userInfoValueProviderForDomain);
  JS_STATIC_METHOD(initWithDomainCodeUserInfo);
#if TODO
// NSObject
  JS_METHOD(attemptRecoveryFromErrorOptionIndexDelegateDidRecoverSelectorContextInfo);
  JS_METHOD(attemptRecoveryFromErrorOptionIndex);
#endif
// NSError
  JS_PROP_READONLY(domain);
  JS_PROP_READONLY(code);
  JS_PROP_READONLY(userInfo);
  JS_PROP_READONLY(localizedDescription);
  JS_PROP_READONLY(localizedFailureReason);
  JS_PROP_READONLY(localizedRecoverySuggestion);
  JS_PROP_READONLY(localizedRecoveryOptions);
  JS_PROP_READONLY(recoveryAttempter);
  JS_PROP_READONLY(helpAnchor);

JS_WRAP_CLASS_END(NSError);

#endif /* NNSError_h */
