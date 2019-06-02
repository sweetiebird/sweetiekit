//
//  NSCNHitTestResult.h
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNHitTestResult_h
#define NSCNHitTestResult_h    

#include "NNSObject.h"

#define js_value_SCNHitTestResult(x) js_value_wrapper(x, SCNHitTestResult)
#define to_value_SCNHitTestResult(x) to_value_wrapper(x, SCNHitTestResult)
#define is_value_SCNHitTestResult(x) is_value_wrapper(x, SCNHitTestResult)

JS_WRAP_CLASS(SCNHitTestResult, NSObject);
  JS_PROP_READONLY(node);
  JS_PROP_READONLY(geometryIndex);
  JS_PROP_READONLY(faceIndex);
  JS_PROP_READONLY(localCoordinates);
  JS_PROP_READONLY(worldCoordinates);
  JS_PROP_READONLY(localNormal);
  JS_PROP_READONLY(worldNormal);
  JS_PROP_READONLY(modelTransform);
  JS_PROP_READONLY(boneNode);
JS_WRAP_CLASS_END(SCNHitTestResult);

#endif /* NSCNHitTestResult_h */
