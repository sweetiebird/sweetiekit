//
//  NSCNParticlePropertyController.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNParticlePropertyController_h
#define NSCNParticlePropertyController_h    

#include "NNSObject.h"

#define js_value_SCNParticlePropertyController(x) js_value_wrapper(x, SCNParticlePropertyController)
#define to_value_SCNParticlePropertyController(x) to_value_wrapper(x, SCNParticlePropertyController)
#define is_value_SCNParticlePropertyController(x) is_value_wrapper(x, SCNParticlePropertyController)

JS_WRAP_CLASS(SCNParticlePropertyController, NSObject);
  JS_STATIC_METHOD(controllerWithAnimation);
  JS_PROP(animation);
  JS_PROP(inputMode);
  JS_PROP(inputScale);
  JS_PROP(inputBias);
  JS_PROP(inputOrigin);
  JS_PROP(inputProperty);
JS_WRAP_CLASS_END(SCNParticlePropertyController);

#endif /* NSCNParticlePropertyController_h */
