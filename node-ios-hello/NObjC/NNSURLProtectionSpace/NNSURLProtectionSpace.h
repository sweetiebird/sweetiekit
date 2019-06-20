//
//  NNSURLProtectionSpace.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSURLProtectionSpace_h
#define NNSURLProtectionSpace_h    

#include "NNSObject.h"

#define js_value_NSURLProtectionSpace(x) js_value_wrapper(x, NSURLProtectionSpace)
#define to_value_NSURLProtectionSpace(x) to_value_wrapper(x, NSURLProtectionSpace)
#define is_value_NSURLProtectionSpace(x) is_value_wrapper(x, NSURLProtectionSpace)

JS_WRAP_CLASS(NSURLProtectionSpace, NSObject);
  JS_METHOD(initWithHostPortProtocolRealmAuthenticationMethod);
  JS_METHOD(initWithProxyHostPortTypeRealmAuthenticationMethod);
  JS_PROP_READONLY(realm);
  JS_PROP_READONLY(receivesCredentialSecurely);
  JS_PROP_READONLY(isProxy);
  JS_PROP_READONLY(host);
  JS_PROP_READONLY(port);
  JS_PROP_READONLY(proxyType);
  JS_PROP_READONLY(protocol);
  JS_PROP_READONLY(authenticationMethod);
  JS_PROP_READONLY(distinguishedNames);
  JS_PROP_READONLY(serverTrust);
JS_WRAP_CLASS_END(NSURLProtectionSpace);

#endif /* NNSURLProtectionSpace_h */
