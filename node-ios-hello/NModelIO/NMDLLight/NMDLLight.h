//
//  NMDLLight.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLLight_h
#define NMDLLight_h    

#include "NMDLObject.h"

#define js_value_MDLLight(x) js_value_wrapper(x, MDLLight)
#define to_value_MDLLight(x) to_value_wrapper(x, MDLLight)
#define is_value_MDLLight(x) is_value_wrapper(x, MDLLight)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLLight, MDLObject);
  JS_STATIC_METHOD(lightWithSCNLight);
JS_WRAP_CLASS_END(MDLLight);

#endif /* NMDLLight_h */
