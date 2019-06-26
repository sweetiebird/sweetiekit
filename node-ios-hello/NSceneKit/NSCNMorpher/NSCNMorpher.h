//
//  NSCNMorpher.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNMorpher_h
#define NSCNMorpher_h    

#include "NNSObject.h"

#define js_value_SCNMorpher(x) js_value_wrapper(x, SCNMorpher)
#define to_value_SCNMorpher(x) to_value_wrapper(x, SCNMorpher)
#define is_value_SCNMorpher(x) is_value_wrapper(x, SCNMorpher)

#define js_value_SCNMorpherCalculationMode(x) JS_ENUM(SCNMorpherCalculationMode, NSInteger, x)
#define to_value_SCNMorpherCalculationMode(x) TO_ENUM(SCNMorpherCalculationMode, NSInteger, x)
#define is_value_SCNMorpherCalculationMode(x) IS_ENUM(SCNMorpherCalculationMode, NSInteger, x)

JS_WRAP_CLASS(SCNMorpher, NSObject);
  JS_METHOD(setWeightForTargetAtIndex);
  JS_METHOD(weightForTargetAtIndex);
  JS_METHOD(setWeightForTargetNamed);
  JS_METHOD(weightForTargetNamed);
  JS_PROP(targets);
  JS_PROP(weights);
  JS_PROP(calculationMode);
  JS_PROP(unifiesNormals);
JS_WRAP_CLASS_END(SCNMorpher);

#endif /* NSCNMorpher_h */
