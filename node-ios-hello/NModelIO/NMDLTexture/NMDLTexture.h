//
//  NMDLTexture.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLTexture_h
#define NMDLTexture_h    

#include "NNSObject.h"

#define js_value_MDLTexture(x) js_value_wrapper(x, MDLTexture)
#define to_value_MDLTexture(x) to_value_wrapper(x, MDLTexture)
#define is_value_MDLTexture(x) is_value_wrapper(x, MDLTexture)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MDLTexture, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MDLTexture);

#endif /* NMDLTexture_h */