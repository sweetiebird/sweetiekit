//
//  NNSURLCredential.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSURLCredential.h"

#define instancetype NSURLCredential
#define js_value_instancetype js_value_NSURLCredential

NNSURLCredential::NNSURLCredential() {}
NNSURLCredential::~NNSURLCredential() {}

JS_INIT_CLASS(NSURLCredential, NSObject);
  JS_ASSIGN_STATIC_METHOD(credentialWithUserPasswordPersistence);
  JS_ASSIGN_STATIC_METHOD(credentialWithIdentityCertificatesPersistence);
  JS_ASSIGN_STATIC_METHOD(credentialForTrust);
  JS_ASSIGN_PROTO_METHOD(initWithUserPasswordPersistence);
  JS_ASSIGN_PROTO_METHOD(initWithIdentityCertificatesPersistence);
  JS_ASSIGN_PROTO_METHOD(initWithTrust);
  JS_ASSIGN_PROTO_PROP_READONLY(persistence);
  JS_ASSIGN_PROTO_PROP_READONLY(user);
  JS_ASSIGN_PROTO_PROP_READONLY(password);
  JS_ASSIGN_PROTO_PROP_READONLY(hasPassword);
  JS_ASSIGN_PROTO_PROP_READONLY(identity);
  JS_ASSIGN_PROTO_PROP_READONLY(certificates);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSURLCredential, NSObject);
  // constant values (exports)
  
  //typedef NS_ENUM(NSUInteger, NSURLCredentialPersistence) {
    JS_ASSIGN_ENUM(NSURLCredentialPersistenceNone, NSInteger);
    JS_ASSIGN_ENUM(NSURLCredentialPersistenceForSession, NSInteger);
    JS_ASSIGN_ENUM(NSURLCredentialPersistencePermanent, NSInteger);
    JS_ASSIGN_ENUM(NSURLCredentialPersistenceSynchronizable, NSInteger); // API_AVAILABLE(macos(10.8), ios(6.0), watchos(2.0), tvos(9.0))
  //};

JS_INIT_CLASS_END(NSURLCredential, NSObject);

NAN_METHOD(NNSURLCredential::New) {
  JS_RECONSTRUCT(NSURLCredential);
  @autoreleasepool {
    NSURLCredential* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSURLCredential *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSURLCredential alloc] init];
    }
    if (self) {
      NNSURLCredential *wrapper = new NNSURLCredential();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSURLCredential::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSURLCredential::credentialWithUserPasswordPersistence) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, user);
    declare_pointer(NSString, password);
    declare_value(NSURLCredentialPersistence, persistence);
    JS_SET_RETURN(js_value_NSURLCredential([NSURLCredential credentialWithUser: user password: password persistence: persistence]));
  }
}

#include "NSecBase.h"
#include "NNSURLCredential.h"

NAN_METHOD(NNSURLCredential::credentialWithIdentityCertificatesPersistence) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SecIdentityRef, identity);
    declare_nullable_pointer(NSArray, certArray);
    declare_value(NSURLCredentialPersistence, persistence);
    JS_SET_RETURN(js_value_NSURLCredential([NSURLCredential credentialWithIdentity: identity certificates: certArray persistence: persistence]));
  }
}

NAN_METHOD(NNSURLCredential::credentialForTrust) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SecTrustRef, trust);
    JS_SET_RETURN(js_value_NSURLCredential([NSURLCredential credentialForTrust: trust]));
  }
}

NAN_METHOD(NNSURLCredential::initWithUserPasswordPersistence) {
  JS_UNWRAP_OR_ALLOC(NSURLCredential, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, user);
    declare_pointer(NSString, password);
    declare_value(NSURLCredentialPersistence, persistence);
    JS_SET_RETURN(js_value_instancetype([self initWithUser: user password: password persistence: persistence]));
  }
}

NAN_METHOD(NNSURLCredential::initWithIdentityCertificatesPersistence) {
  JS_UNWRAP_OR_ALLOC(NSURLCredential, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SecIdentityRef, identity);
    declare_nullable_pointer(NSArray, certArray);
    declare_value(NSURLCredentialPersistence, persistence);
    JS_SET_RETURN(js_value_instancetype([self initWithIdentity: identity certificates: certArray persistence: persistence]));
  }
}

NAN_METHOD(NNSURLCredential::initWithTrust) {
  JS_UNWRAP_OR_ALLOC(NSURLCredential, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SecTrustRef, trust);
    JS_SET_RETURN(js_value_instancetype([self initWithTrust: trust]));
  }
}

NAN_GETTER(NNSURLCredential::persistenceGetter) {
  JS_UNWRAP(NSURLCredential, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURLCredentialPersistence([self persistence]));
  }
}

NAN_GETTER(NNSURLCredential::userGetter) {
  JS_UNWRAP(NSURLCredential, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self user]));
  }
}

NAN_GETTER(NNSURLCredential::passwordGetter) {
  JS_UNWRAP(NSURLCredential, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self password]));
  }
}

NAN_GETTER(NNSURLCredential::hasPasswordGetter) {
  JS_UNWRAP(NSURLCredential, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasPassword]));
  }
}

NAN_GETTER(NNSURLCredential::identityGetter) {
  JS_UNWRAP(NSURLCredential, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SecIdentityRef([self identity]));
  }
}

NAN_GETTER(NNSURLCredential::certificatesGetter) {
  JS_UNWRAP(NSURLCredential, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray([self certificates]));
  }
}

