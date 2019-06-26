//
//  NSCNSkinner.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNSkinner_h
#define NSCNSkinner_h    

#include "NNSObject.h"

#define js_value_SCNSkinner(x) js_value_wrapper(x, SCNSkinner)
#define to_value_SCNSkinner(x) to_value_wrapper(x, SCNSkinner)
#define is_value_SCNSkinner(x) is_value_wrapper(x, SCNSkinner)

JS_WRAP_CLASS(SCNSkinner, NSObject);
  JS_STATIC_METHOD(skinnerWithBaseGeometryBonesBoneInverseBindTransformsBoneWeightsBoneIndices);
  JS_PROP(skeleton);
  JS_PROP(baseGeometry);
  JS_PROP(baseGeometryBindTransform);
  JS_PROP_READONLY(boneInverseBindTransforms);
  JS_PROP_READONLY(bones);
  JS_PROP_READONLY(boneWeights);
  JS_PROP_READONLY(boneIndices);
JS_WRAP_CLASS_END(SCNSkinner);

#endif /* NSCNSkinner_h */
