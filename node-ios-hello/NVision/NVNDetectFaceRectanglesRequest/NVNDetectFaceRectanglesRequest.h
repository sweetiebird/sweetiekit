//
//  NVNDetectFaceRectanglesRequest.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNDetectFaceRectanglesRequest_h
#define NVNDetectFaceRectanglesRequest_h    

#include "NVNImageBasedRequest.h"

#define js_value_VNDetectFaceRectanglesRequest(x) js_value_wrapper(x, VNDetectFaceRectanglesRequest)
#define to_value_VNDetectFaceRectanglesRequest(x) to_value_wrapper(x, VNDetectFaceRectanglesRequest)
#define is_value_VNDetectFaceRectanglesRequest(x) is_value_wrapper(x, VNDetectFaceRectanglesRequest)

JS_WRAP_CLASS(VNDetectFaceRectanglesRequest, VNImageBasedRequest);
JS_WRAP_CLASS_END(VNDetectFaceRectanglesRequest);

#endif /* NVNDetectFaceRectanglesRequest_h */
