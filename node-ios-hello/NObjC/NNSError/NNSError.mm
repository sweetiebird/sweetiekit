//
//  NNSError.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSError.h"

#define instancetype NSError
#define js_value_instancetype js_value_NSError

NSError* _Nullable NSString_to_NSError(NSString* _Nullable message, NSString* _Nonnull domain, NSInteger code) {
  if (!message) {
    return nullptr;
  }
  NSDictionary *userInfo = @{
    NSLocalizedDescriptionKey: NSLocalizedString(message, nil)
  };
  return [NSError errorWithDomain:@"sweetiekit.Error" code:-1 userInfo:userInfo];
}

NSString* _Nullable NSError_to_NSString(NSError* _Nullable error) {
  if (!error) {
    return nullptr;
  }
  return [error localizedDescription];
}

NNSError::NNSError() {}
NNSError::~NNSError() {}

 Nan::Persistent<Object> NNSError::JSErrorType;

JS_INIT_CLASS(NSError, NSObject);
  {
    JSErrorType.Reset(JS_OBJ(JS_GLOBAL()->Get(JS_STR("Error"))));
  }
  // instance members (proto)
#if TODO
// NSObject
  JS_ASSIGN_PROTO_METHOD(attemptRecoveryFromErrorOptionIndexDelegateDidRecoverSelectorContextInfo);
  JS_ASSIGN_PROTO_METHOD(attemptRecoveryFromErrorOptionIndex);
#endif
// NSError
  JS_ASSIGN_PROTO_PROP_READONLY(domain);
  JS_ASSIGN_PROTO_PROP_READONLY(code);
  JS_ASSIGN_PROTO_PROP_READONLY(userInfo);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedDescription);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedFailureReason);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedRecoverySuggestion);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedRecoveryOptions);
  JS_ASSIGN_PROTO_PROP_READONLY(recoveryAttempter);
  JS_ASSIGN_PROTO_PROP_READONLY(helpAnchor);

  // static members (ctor)
  JS_INIT_CTOR(NSError, NSObject);
  JS_ASSIGN_STATIC_METHOD(errorWithDomainCodeUserInfo);
  JS_ASSIGN_STATIC_METHOD(setUserInfoValueProviderForDomainProvider);
  JS_ASSIGN_STATIC_METHOD(userInfoValueProviderForDomain);
  JS_ASSIGN_PROTO_METHOD(initWithDomainCodeUserInfo);
JS_INIT_CLASS_END(NSError, NSObject);

NAN_METHOD(NNSError::New) {
  JS_RECONSTRUCT(NSError);
  @autoreleasepool {
    NSError* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge NSError *)(info[0].As<External>()->Value());
    } else if (info[0]->InstanceOf(JS_CONTEXT(), Nan::New<Object>(JSErrorType)).FromJust()) {
      NSString* message = to_value_NSString(JS_OBJ(info[0])->Get(JS_STR("message")));
      self = NSString_to_NSError(message);
    } else if (is_value_NSString(info[0])) {
      declare_args();
      declare_pointer(NSString, message);
      self = NSString_to_NSError(message);
    }
    if (self) {
      NNSError *wrapper = new NNSError();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSError::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSError::errorWithDomainCodeUserInfo) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSErrorDomain, domain);
    declare_value(NSInteger, code);
    declare_nullable_pointer(NSDictionary/* <NSErrorUserInfoKey, id>*/, dict);
    JS_SET_RETURN(js_value_instancetype([NSError errorWithDomain: domain code: code userInfo: dict]));
  }
}

NAN_METHOD(NNSError::setUserInfoValueProviderForDomainProvider) {
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_value(NSErrorDomain, errorDomain);
    declare_value(id-_Nullable-^,_Nullable-NSError-pointer,err,NSErrorUserInfoKey,userInfoKey, provider);
    [NSError setUserInfoValueProviderForDomain: errorDomain provider: provider];
    #endif
  }
}

NAN_METHOD(NNSError::userInfoValueProviderForDomain) {
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_value(NSErrorDomain, errorDomain);
    JS_SET_RETURN(js_value_id__Nullable_9444_Nullable_NSError_pointer44err44NSErrorUserInfoKey44userInfoKey([NSError userInfoValueProviderForDomain: errorDomain]));
    #endif
  }
}

NAN_METHOD(NNSError::initWithDomainCodeUserInfo) {
  JS_UNWRAP_OR_ALLOC(NSError, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSErrorDomain, domain);
    declare_value(NSInteger, code);
    declare_nullable_pointer(NSDictionary/* <NSErrorUserInfoKey, id>*/, dict);
    JS_SET_RETURN(js_value_instancetype([self initWithDomain: domain code: code userInfo: dict]));
  }
}

#if TODO
NAN_METHOD(NNSObject::attemptRecoveryFromErrorOptionIndexDelegateDidRecoverSelectorContextInfo) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSError, error);
    declare_value(NSUInteger, recoveryOptionIndex);
    declare_nullable_value(id, delegate);
    declare_nullable_value(SEL, didRecoverSelector);
    declare_nullable_pointer(void, contextInfo);
    [self attemptRecoveryFromError: error optionIndex: recoveryOptionIndex delegate: delegate didRecoverSelector: didRecoverSelector contextInfo: contextInfo];
  }
}

NAN_METHOD(NNSObject::attemptRecoveryFromErrorOptionIndex) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSError, error);
    declare_value(NSUInteger, recoveryOptionIndex);
    JS_SET_RETURN(js_value_BOOL([self attemptRecoveryFromError: error optionIndex: recoveryOptionIndex]));
  }
}
#endif

NAN_GETTER(NNSError::domainGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSErrorDomain([self domain]));
  }
}

NAN_GETTER(NNSError::codeGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self code]));
  }
}

NAN_GETTER(NNSError::userInfoGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSErrorUserInfoKey, id>*/([self userInfo]));
  }
}

NAN_GETTER(NNSError::localizedDescriptionGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedDescription]));
  }
}

NAN_GETTER(NNSError::localizedFailureReasonGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedFailureReason]));
  }
}

NAN_GETTER(NNSError::localizedRecoverySuggestionGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedRecoverySuggestion]));
  }
}

NAN_GETTER(NNSError::localizedRecoveryOptionsGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self localizedRecoveryOptions]));
  }
}

NAN_GETTER(NNSError::recoveryAttempterGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self recoveryAttempter]));
  }
}

NAN_GETTER(NNSError::helpAnchorGetter) {
  JS_UNWRAP(NSError, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self helpAnchor]));
  }
}
