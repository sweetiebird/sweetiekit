//
//  NNSHTTPURLResponse.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSHTTPURLResponse_h
#define NNSHTTPURLResponse_h    

#include "NNSURLResponse.h"

#define js_value_NSHTTPURLResponse(x) js_value_wrapper(x, NSHTTPURLResponse)
#define to_value_NSHTTPURLResponse(x) to_value_wrapper(x, NSHTTPURLResponse)
#define is_value_NSHTTPURLResponse(x) is_value_wrapper(x, NSHTTPURLResponse)

JS_WRAP_CLASS(NSHTTPURLResponse, NSURLResponse);
  JS_STATIC_METHOD(localizedStringForStatusCode);
  JS_METHOD(initWithURLStatusCode_HTTPVersionHeaderFields);
  JS_PROP_READONLY(statusCode);
  JS_PROP_READONLY(allHeaderFields);
JS_WRAP_CLASS_END(NSHTTPURLResponse);

#endif /* NNSHTTPURLResponse_h */
