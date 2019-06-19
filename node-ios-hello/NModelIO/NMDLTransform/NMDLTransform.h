//
//  NMDLTransform.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLTransform_h
#define NMDLTransform_h    

#include "NNSObject.h"

#define js_value_MDLTransform(x) js_value_wrapper(x, MDLTransform)
#define to_value_MDLTransform(x) to_value_wrapper(x, MDLTransform)
#define is_value_MDLTransform(x) is_value_wrapper(x, MDLTransform)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLTransform, NSObject);
#if TODO
// MDLTransformComponent
  JS_STATIC_METHOD(globalTransformWithObjectAtTime);
  JS_METHOD(setLocalTransformForTime);
  JS_METHOD(setLocalTransform);
  JS_METHOD(localTransformAtTime);
#endif
// MDLTransform
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithIdentity);
  JS_METHOD(initWithTransformComponent);
  JS_METHOD(initWithMatrix);
  JS_METHOD(initWithMatrixResetsTransform);
  JS_METHOD(setIdentity);
  JS_METHOD(translationAtTime);
  JS_METHOD(rotationAtTime);
  JS_METHOD(shearAtTime);
  JS_METHOD(scaleAtTime);
  JS_METHOD(setMatrixForTime);
  JS_METHOD(setTranslationForTime);
  JS_METHOD(setRotationForTime);
  JS_METHOD(setShearForTime);
  JS_METHOD(setScaleForTime);
  JS_METHOD(rotationMatrixAtTime);
#if TODO
// MDLTransformComponent
  JS_PROP(matrix);
  JS_PROP(resetsTransform);
  JS_PROP_READONLY(minimumTime);
  JS_PROP_READONLY(maximumTime);
  JS_PROP_READONLY(keyTimes);
#endif
// MDLTransform
  JS_PROP(translation);
  JS_PROP(rotation);
  JS_PROP(shear);
  JS_PROP(scale);
JS_WRAP_CLASS_END(MDLTransform);

#endif /* NMDLTransform_h */
