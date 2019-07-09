//
//  NVNDetectFaceLandmarksRequest.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNDetectFaceLandmarksRequest_h
#define NVNDetectFaceLandmarksRequest_h    

#include "NVNImageBasedRequest.h"

#define js_value_VNRequestFaceLandmarksConstellation(x) JS_ENUM(VNRequestFaceLandmarksConstellation, NSUInteger, x)
#define to_value_VNRequestFaceLandmarksConstellation(x) TO_ENUM(VNRequestFaceLandmarksConstellation, NSUInteger, x)
#define is_value_VNRequestFaceLandmarksConstellation(x) IS_ENUM(VNRequestFaceLandmarksConstellation, NSUInteger, x)

#define js_value_VNDetectFaceLandmarksRequest(x) js_value_wrapper(x, VNDetectFaceLandmarksRequest)
#define to_value_VNDetectFaceLandmarksRequest(x) to_value_wrapper(x, VNDetectFaceLandmarksRequest)
#define is_value_VNDetectFaceLandmarksRequest(x) is_value_wrapper(x, VNDetectFaceLandmarksRequest)

JS_WRAP_CLASS(VNDetectFaceLandmarksRequest, VNImageBasedRequest);
  JS_STATIC_METHOD(revisionSupportsConstellation);
  JS_PROP(constellation);
JS_WRAP_CLASS_END(VNDetectFaceLandmarksRequest);

#endif /* NVNDetectFaceLandmarksRequest_h */
