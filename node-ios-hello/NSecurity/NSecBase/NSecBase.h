//
//  NSecBase.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSecBase_h
#define NSecBase_h    

#include "NNSObject.h"

#define js_value_SecBase(x) js_value_wrapper(x, SecBase)
#define to_value_SecBase(x) to_value_wrapper(x, SecBase)
#define is_value_SecBase(x) is_value_wrapper(x, SecBase)

#define js_value_bridged(x, t) sweetiekit::GetWrapperFor((__bridge id)x, Nid::type)
#define to_value_bridged(x, t) (__bridge t)sweetiekit::GetValueFor(x)
#define is_value_bridged(x, t) JS_INSTANCEOF(x, Nid)

//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecCertificate) *SecCertificateRef;
#define js_value_SecCertificateRef(x) js_value_bridged(x, SecCertificateRef)
#define to_value_SecCertificateRef(x) to_value_bridged(x, SecCertificateRef)
#define is_value_SecCertificateRef(x) is_value_bridged(x, SecCertificateRef)


//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecIdentity) *SecIdentityRef;
#define js_value_SecIdentityRef(x) js_value_bridged(x, SecIdentityRef)
#define to_value_SecIdentityRef(x) to_value_bridged(x, SecIdentityRef)
#define is_value_SecIdentityRef(x) is_value_bridged(x, SecIdentityRef)


//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecKey) *SecKeyRef;
#define js_value_SecKeyRef(x) js_value_bridged(x, SecKeyRef)
#define to_value_SecKeyRef(x) to_value_bridged(x, SecKeyRef)
#define is_value_SecKeyRef(x) is_value_bridged(x, SecKeyRef)


//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecPolicy) *SecPolicyRef;
#define js_value_SecPolicyRef(x) js_value_bridged(x, SecPolicyRef)
#define to_value_SecPolicyRef(x) to_value_bridged(x, SecPolicyRef)
#define is_value_SecPolicyRef(x) is_value_bridged(x, SecPolicyRef)


//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecAccessControl) *SecAccessControlRef;
#define js_value_SecAccessControlRef(x) js_value_bridged(x, SecAccessControlRef)
#define to_value_SecAccessControlRef(x) to_value_bridged(x, SecAccessControlRef)
#define is_value_SecAccessControlRef(x) is_value_bridged(x, SecAccessControlRef)


//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecKeychain) *SecKeychainRef
//  API_AVAILABLE(macos(10.0)) API_UNAVAILABLE(ios, tvos, watchos);
#if !defined(__IPHONEOS__) && !defined(__TVOS__) && !defined(__WATCHOS__)
#define js_value_SecKeychainRef(x) js_value_bridged(x, SecKeychainRef)
#define to_value_SecKeychainRef(x) to_value_bridged(x, SecKeychainRef)
#define is_value_SecKeychainRef(x) is_value_bridged(x, SecKeychainRef)
#endif

//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecKeychainItem) *SecKeychainItemRef
//  API_UNAVAILABLE(ios);
#ifndef __IPHONEOS__
#define js_value_SecKeychainItemRef(x) js_value_bridged(x, SecKeychainItemRef)
#define to_value_SecKeychainItemRef(x) to_value_bridged(x, SecKeychainItemRef)
#define is_value_SecKeychainItemRef(x) is_value_bridged(x, SecKeychainItemRef)
#endif

//typedef struct CF_BRIDGED_TYPE(id) SECTYPE(SecKeychainSearch) *SecKeychainSearchRef
//  API_UNAVAILABLE(ios);
#ifndef __IPHONEOS__
#define js_value_SecKeychainSearchRef(x) js_value_bridged(x, SecKeychainSearchRef)
#define to_value_SecKeychainSearchRef(x) to_value_bridged(x, SecKeychainSearchRef)
#define is_value_SecKeychainSearchRef(x) is_value_bridged(x, SecKeychainSearchRef)
#endif

//
// <Security/SecTrust.h>
//

/*!
    @typedef SecTrustRef
    @abstract CFType used for performing X.509 certificate trust evaluations.
 */
//typedef struct CF_BRIDGED_TYPE(id) __SecTrust *SecTrustRef;
#define js_value_SecTrustRef(x) js_value_bridged(x, SecTrustRef)
#define to_value_SecTrustRef(x) to_value_bridged(x, SecTrustRef)
#define is_value_SecTrustRef(x) is_value_bridged(x, SecTrustRef)


JS_WRAP_CLASS(SecBase, NSObject);
JS_WRAP_CLASS_END(SecBase);

#if __OBJC__
@interface SecBase : NSObject
@end
#endif

#endif /* NSecBase_h */
