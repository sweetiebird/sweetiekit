//
//  NVNDetectTextRectanglesRequest.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNDetectTextRectanglesRequest_h
#define NVNDetectTextRectanglesRequest_h    

#include "NVNImageBasedRequest.h"

#define js_value_VNDetectTextRectanglesRequest(x) js_value_wrapper(x, VNDetectTextRectanglesRequest)
#define to_value_VNDetectTextRectanglesRequest(x) to_value_wrapper(x, VNDetectTextRectanglesRequest)
#define is_value_VNDetectTextRectanglesRequest(x) is_value_wrapper(x, VNDetectTextRectanglesRequest)

JS_WRAP_CLASS(VNDetectTextRectanglesRequest, VNImageBasedRequest);
  JS_PROP(reportCharacterBoxes);
JS_WRAP_CLASS_END(VNDetectTextRectanglesRequest);

#endif /* NVNDetectTextRectanglesRequest_h */
