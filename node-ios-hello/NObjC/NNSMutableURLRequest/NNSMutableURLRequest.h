//
//  NNSMutableURLRequest.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMutableURLRequest_h
#define NNSMutableURLRequest_h    

#include "NNSURLRequest.h"

#define js_value_NSMutableURLRequest(x) js_value_wrapper(x, NSMutableURLRequest)
#define to_value_NSMutableURLRequest(x) to_value_wrapper(x, NSMutableURLRequest)
#define is_value_NSMutableURLRequest(x) is_value_wrapper(x, NSMutableURLRequest)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(NSMutableURLRequest, NSURLRequest);
  JS_METHOD(setValueForHTTPHeaderField);
  JS_METHOD(addValueForHTTPHeaderField);
  JS_PROP(URL);
  JS_PROP(cachePolicy);
  JS_PROP(timeoutInterval);
  JS_PROP(mainDocumentURL);
  JS_PROP(networkServiceType);
  JS_PROP(allowsCellularAccess);
  JS_PROP(HTTPMethod);
  JS_PROP(allHTTPHeaderFields);
  JS_PROP(HTTPBody);
  JS_PROP(HTTPBodyStream);
  JS_PROP(HTTPShouldHandleCookies);
  JS_PROP(HTTPShouldUsePipelining);
JS_WRAP_CLASS_END(NSMutableURLRequest);

#endif /* NNSMutableURLRequest_h */
