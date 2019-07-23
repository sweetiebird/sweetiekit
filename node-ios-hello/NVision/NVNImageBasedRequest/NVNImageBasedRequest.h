//
//  NVNImageBasedRequest.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNImageBasedRequest_h
#define NVNImageBasedRequest_h    

#include "NVNRequest.h"

#define js_value_VNImageBasedRequest(x) js_value_wrapper(x, VNImageBasedRequest)
#define to_value_VNImageBasedRequest(x) to_value_wrapper(x, VNImageBasedRequest)
#define is_value_VNImageBasedRequest(x) is_value_wrapper(x, VNImageBasedRequest)

JS_WRAP_CLASS(VNImageBasedRequest, VNRequest);
  JS_PROP(regionOfInterest);
JS_WRAP_CLASS_END(VNImageBasedRequest);

#endif /* NVNImageBasedRequest_h */
