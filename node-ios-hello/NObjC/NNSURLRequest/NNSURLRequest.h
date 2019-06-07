//
//  NNSURLRequest.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSURLRequest_h
#define NNSURLRequest_h    

#include "NNSObject.h"

#define js_value_NSURLRequest(x) js_value_wrapper(x, NSURLRequest)
#define to_value_NSURLRequest(x) to_value_wrapper(x, NSURLRequest)
#define is_value_NSURLRequest(x) is_value_wrapper(x, NSURLRequest)

// SpriteKit enums
#define js_value_NSURLRequestCachePolicy(x) JS_ENUM(NSURLRequestCachePolicy, NSInteger, x)
#define to_value_NSURLRequestCachePolicy(x) TO_ENUM(NSURLRequestCachePolicy, NSInteger, x)
#define is_value_NSURLRequestCachePolicy(x) IS_ENUM(NSURLRequestCachePolicy, NSInteger, x)

#define js_value_NSURLRequestNetworkServiceType(x) JS_ENUM(NSURLRequestNetworkServiceType, NSInteger, x)
#define to_value_NSURLRequestNetworkServiceType(x) TO_ENUM(NSURLRequestNetworkServiceType, NSInteger, x)
#define is_value_NSURLRequestNetworkServiceType(x) IS_ENUM(NSURLRequestNetworkServiceType, NSInteger, x)

JS_WRAP_CLASS(NSURLRequest, NSObject);
  JS_STATIC_METHOD(requestWithURL);
  JS_STATIC_METHOD(requestWithURLCachePolicyTimeoutInterval);
  JS_STATIC_METHOD(initWithURL);
  JS_STATIC_METHOD(initWithURLCachePolicyTimeoutInterval);
  JS_METHOD(valueForHTTPHeaderField);
  JS_STATIC_PROP_READONLY(supportsSecureCoding);
  JS_PROP_READONLY(URL);
  JS_PROP_READONLY(cachePolicy);
  JS_PROP_READONLY(timeoutInterval);
  JS_PROP_READONLY(mainDocumentURL);
  JS_PROP_READONLY(networkServiceType);
  JS_PROP_READONLY(allowsCellularAccess);
  JS_PROP_READONLY(HTTPMethod);
  JS_PROP_READONLY(allHTTPHeaderFields);
  JS_PROP_READONLY(HTTPBody);
  JS_PROP_READONLY(HTTPBodyStream);
  JS_PROP_READONLY(HTTPShouldHandleCookies);
  JS_PROP_READONLY(HTTPShouldUsePipelining);

JS_WRAP_CLASS_END(NSURLRequest);

#endif /* NNSURLRequest_h */
