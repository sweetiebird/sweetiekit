//
//  NVNRequest.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNRequest_h
#define NVNRequest_h    

#include "NNSObject.h"

#define js_value_VNRequest(x) js_value_wrapper(x, VNRequest)
#define to_value_VNRequest(x) to_value_wrapper(x, VNRequest)
#define is_value_VNRequest(x) is_value_wrapper(x, VNRequest)

JS_WRAP_CLASS(VNRequest, NSObject);
  JS_METHOD(initWithCompletionHandler);
  JS_METHOD(cancel);
  JS_PROP(preferBackgroundProcessing);
  JS_PROP(usesCPUOnly);
  JS_PROP_READONLY(results);
  JS_PROP_READONLY(completionHandler);
  JS_PROP(revision);
  JS_STATIC_PROP_READONLY(supportedRevisions);
  JS_STATIC_PROP_READONLY(defaultRevision);
  JS_STATIC_PROP_READONLY(currentRevision);
JS_WRAP_CLASS_END(VNRequest);

#endif /* NVNRequest_h */
