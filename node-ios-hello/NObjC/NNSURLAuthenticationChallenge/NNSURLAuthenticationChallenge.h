//
//  NNSURLAuthenticationChallenge.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSURLAuthenticationChallenge_h
#define NNSURLAuthenticationChallenge_h    

#include "NNSObject.h"

#define js_value_NSURLAuthenticationChallenge(x) js_value_wrapper(x, NSURLAuthenticationChallenge)
#define to_value_NSURLAuthenticationChallenge(x) to_value_wrapper(x, NSURLAuthenticationChallenge)
#define is_value_NSURLAuthenticationChallenge(x) is_value_wrapper(x, NSURLAuthenticationChallenge)

JS_WRAP_CLASS(NSURLAuthenticationChallenge, NSObject);
#if TODO
// NSURLAuthenticationChallengeSender
  JS_METHOD(useCredentialForAuthenticationChallenge);
  JS_METHOD(continueWithoutCredentialForAuthenticationChallenge);
  JS_METHOD(cancelAuthenticationChallenge);
  JS_METHOD(performDefaultHandlingForAuthenticationChallenge);
  JS_METHOD(rejectProtectionSpaceAndContinueWithChallenge);
#endif
// NSURLAuthenticationChallenge
  JS_METHOD(initWithProtectionSpaceProposedCredentialPreviousFailureCountFailureResponseErrorSender);
  JS_METHOD(initWithAuthenticationChallengeSender);
  JS_PROP_READONLY(protectionSpace);
  JS_PROP_READONLY(proposedCredential);
  JS_PROP_READONLY(previousFailureCount);
  JS_PROP_READONLY(failureResponse);
  JS_PROP_READONLY(error);
  JS_PROP_READONLY(sender);
JS_WRAP_CLASS_END(NSURLAuthenticationChallenge);

#endif /* NNSURLAuthenticationChallenge_h */
