//
//  NNSURLCredential.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSURLCredential_h
#define NNSURLCredential_h    

#include "NNSObject.h"

#define js_value_NSURLCredential(x) js_value_wrapper(x, NSURLCredential)
#define to_value_NSURLCredential(x) to_value_wrapper(x, NSURLCredential)
#define is_value_NSURLCredential(x) is_value_wrapper(x, NSURLCredential)

/*!
    @enum NSURLCredentialPersistence
    @abstract Constants defining how long a credential will be kept around
    @constant NSURLCredentialPersistenceNone This credential won't be saved.
    @constant NSURLCredentialPersistenceForSession This credential will only be stored for this session.
    @constant NSURLCredentialPersistencePermanent This credential will be stored permanently. Note: Whereas in Mac OS X any application can access any credential provided the user gives permission, in iPhone OS an application can access only its own credentials.
    @constant NSURLCredentialPersistenceSynchronizable This credential will be stored permanently. Additionally, this credential will be distributed to other devices based on the owning AppleID.
        Note: Whereas in Mac OS X any application can access any credential provided the user gives permission, on iOS an application can 
        access only its own credentials.
*/

#define js_value_NSURLCredentialPersistence(x) JS_ENUM(NSURLCredentialPersistence, NSUInteger, x)
#define to_value_NSURLCredentialPersistence(x) TO_ENUM(NSURLCredentialPersistence, NSUInteger, x)
#define is_value_NSURLCredentialPersistence(x) IS_ENUM(NSURLCredentialPersistence, NSUInteger, x)

JS_WRAP_CLASS(NSURLCredential, NSObject);
  JS_STATIC_METHOD(credentialWithUserPasswordPersistence);
  JS_STATIC_METHOD(credentialWithIdentityCertificatesPersistence);
  JS_STATIC_METHOD(credentialForTrust);
  JS_METHOD(initWithUserPasswordPersistence);
  JS_METHOD(initWithIdentityCertificatesPersistence);
  JS_METHOD(initWithTrust);
  JS_PROP_READONLY(persistence);
  JS_PROP_READONLY(user);
  JS_PROP_READONLY(password);
  JS_PROP_READONLY(hasPassword);
  JS_PROP_READONLY(identity);
  JS_PROP_READONLY(certificates);
JS_WRAP_CLASS_END(NSURLCredential);

#endif /* NNSURLCredential_h */
