//
//  NNSURLResponse.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSURLResponse_h
#define NNSURLResponse_h    

#include "NNSObject.h"

#define js_value_NSURLResponse(x) js_value_wrapper(x, NSURLResponse)
#define to_value_NSURLResponse(x) to_value_wrapper(x, NSURLResponse)
#define is_value_NSURLResponse(x) is_value_wrapper(x, NSURLResponse)

JS_WRAP_CLASS(NSURLResponse, NSObject);
  JS_METHOD(initWithURLMIMETypeExpectedContentLengthTextEncodingName);
  JS_PROP_READONLY(URL);
  JS_PROP_READONLY(MIMEType);
  JS_PROP_READONLY(expectedContentLength);
  JS_PROP_READONLY(textEncodingName);
  JS_PROP_READONLY(suggestedFilename);
JS_WRAP_CLASS_END(NSURLResponse);

#endif /* NNSURLResponse_h */
