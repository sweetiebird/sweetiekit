//
//  NNSURLAuthenticationChallenge.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSURLAuthenticationChallenge.h"

#define instancetype NSURLAuthenticationChallenge
#define js_value_instancetype js_value_NSURLAuthenticationChallenge

NNSURLAuthenticationChallenge::NNSURLAuthenticationChallenge() {}
NNSURLAuthenticationChallenge::~NNSURLAuthenticationChallenge() {}

JS_INIT_CLASS(NSURLAuthenticationChallenge, NSObject);
#if TODO
// NSURLAuthenticationChallengeSender
  JS_ASSIGN_PROTO_METHOD(useCredentialForAuthenticationChallenge);
  JS_ASSIGN_PROTO_METHOD(continueWithoutCredentialForAuthenticationChallenge);
  JS_ASSIGN_PROTO_METHOD(cancelAuthenticationChallenge);
  JS_ASSIGN_PROTO_METHOD(performDefaultHandlingForAuthenticationChallenge);
  JS_ASSIGN_PROTO_METHOD(rejectProtectionSpaceAndContinueWithChallenge);
#endif
// NSURLAuthenticationChallenge
  JS_ASSIGN_PROTO_METHOD(initWithProtectionSpaceProposedCredentialPreviousFailureCountFailureResponseErrorSender);
  JS_ASSIGN_PROTO_METHOD(initWithAuthenticationChallengeSender);
  JS_ASSIGN_PROTO_PROP_READONLY(protectionSpace);
  JS_ASSIGN_PROTO_PROP_READONLY(proposedCredential);
  JS_ASSIGN_PROTO_PROP_READONLY(previousFailureCount);
  JS_ASSIGN_PROTO_PROP_READONLY(failureResponse);
  JS_ASSIGN_PROTO_PROP_READONLY(error);
  JS_ASSIGN_PROTO_PROP_READONLY(sender);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSURLAuthenticationChallenge, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSURLAuthenticationChallenge, NSObject);

NAN_METHOD(NNSURLAuthenticationChallenge::New) {
  JS_RECONSTRUCT(NSURLAuthenticationChallenge);
  @autoreleasepool {
    NSURLAuthenticationChallenge* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSURLAuthenticationChallenge *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSURLAuthenticationChallenge alloc] init];
    }
    if (self) {
      NNSURLAuthenticationChallenge *wrapper = new NNSURLAuthenticationChallenge();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSURLAuthenticationChallenge::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NNSURLAuthenticationChallengeSender::useCredentialForAuthenticationChallenge) {
  JS_UNWRAP(NSURLAuthenticationChallengeSender, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLCredential, credential);
    declare_pointer(NSURLAuthenticationChallenge, challenge);
    [self useCredential: credential forAuthenticationChallenge: challenge];
  }
}

NAN_METHOD(NNSURLAuthenticationChallengeSender::continueWithoutCredentialForAuthenticationChallenge) {
  JS_UNWRAP(NSURLAuthenticationChallengeSender, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLAuthenticationChallenge, challenge);
    [self continueWithoutCredentialForAuthenticationChallenge: challenge];
  }
}

NAN_METHOD(NNSURLAuthenticationChallengeSender::cancelAuthenticationChallenge) {
  JS_UNWRAP(NSURLAuthenticationChallengeSender, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLAuthenticationChallenge, challenge);
    [self cancelAuthenticationChallenge: challenge];
  }
}

NAN_METHOD(NNSURLAuthenticationChallengeSender::performDefaultHandlingForAuthenticationChallenge) {
  JS_UNWRAP(NSURLAuthenticationChallengeSender, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLAuthenticationChallenge, challenge);
    [self performDefaultHandlingForAuthenticationChallenge: challenge];
  }
}

NAN_METHOD(NNSURLAuthenticationChallengeSender::rejectProtectionSpaceAndContinueWithChallenge) {
  JS_UNWRAP(NSURLAuthenticationChallengeSender, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLAuthenticationChallenge, challenge);
    [self rejectProtectionSpaceAndContinueWithChallenge: challenge];
  }
}
#endif

#include "NNSURLProtectionSpace.h"
#include "NNSURLCredential.h"
#include "NNSURLResponse.h"
#include "NNSError.h"

NAN_METHOD(NNSURLAuthenticationChallenge::initWithProtectionSpaceProposedCredentialPreviousFailureCountFailureResponseErrorSender) {
  JS_UNWRAP_OR_ALLOC(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLProtectionSpace, space);
    declare_nullable_pointer(NSURLCredential, credential);
    declare_value(NSInteger, previousFailureCount);
    declare_nullable_pointer(NSURLResponse, response);
    declare_nullable_pointer(NSError, error);
    declare_value(id/* <NSURLAuthenticationChallengeSender>*/, sender);
    JS_SET_RETURN(js_value_instancetype([self initWithProtectionSpace: space proposedCredential: credential previousFailureCount: previousFailureCount failureResponse: response error: error sender: sender]));
  }
}

#include "NNSURLAuthenticationChallenge.h"

NAN_METHOD(NNSURLAuthenticationChallenge::initWithAuthenticationChallengeSender) {
  JS_UNWRAP_OR_ALLOC(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLAuthenticationChallenge, challenge);
    declare_value(id/* <NSURLAuthenticationChallengeSender>*/, sender);
    JS_SET_RETURN(js_value_instancetype([self initWithAuthenticationChallenge: challenge sender: sender]));
  }
}

NAN_GETTER(NNSURLAuthenticationChallenge::protectionSpaceGetter) {
  JS_UNWRAP(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLProtectionSpace([self protectionSpace]));
  }
}

NAN_GETTER(NNSURLAuthenticationChallenge::proposedCredentialGetter) {
  JS_UNWRAP(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLCredential([self proposedCredential]));
  }
}

NAN_GETTER(NNSURLAuthenticationChallenge::previousFailureCountGetter) {
  JS_UNWRAP(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self previousFailureCount]));
  }
}

NAN_GETTER(NNSURLAuthenticationChallenge::failureResponseGetter) {
  JS_UNWRAP(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLResponse([self failureResponse]));
  }
}

NAN_GETTER(NNSURLAuthenticationChallenge::errorGetter) {
  JS_UNWRAP(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSError([self error]));
  }
}

NAN_GETTER(NNSURLAuthenticationChallenge::senderGetter) {
  JS_UNWRAP(NSURLAuthenticationChallenge, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <NSURLAuthenticationChallengeSender>*/([self sender]));
  }
}

