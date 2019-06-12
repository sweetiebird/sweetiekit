//
//  NMDLCamera.h
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLCamera_h
#define NMDLCamera_h    

#include "NMDLObject.h"

#define js_value_MDLCamera(x) js_value_wrapper(x, MDLCamera)
#define to_value_MDLCamera(x) to_value_wrapper(x, MDLCamera)
#define is_value_MDLCamera(x) is_value_wrapper(x, MDLCamera)

JS_WRAP_CLASS(MDLCamera, MDLObject);
  JS_STATIC_METHOD(cameraWithSCNCamera);
JS_WRAP_CLASS_END(MDLCamera);

#endif /* NMDLCamera_h */
