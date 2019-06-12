//
//  NMDLTextureSampler.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLTextureSampler_h
#define NMDLTextureSampler_h    

#include "NNSObject.h"

#define js_value_MDLTextureSampler(x) js_value_wrapper(x, MDLTextureSampler)
#define to_value_MDLTextureSampler(x) to_value_wrapper(x, MDLTextureSampler)
#define is_value_MDLTextureSampler(x) is_value_wrapper(x, MDLTextureSampler)

JS_WRAP_CLASS(MDLTextureSampler, NSObject);
  JS_PROP(texture);
  JS_PROP(hardwareFilter);
  JS_PROP(transform);
JS_WRAP_CLASS_END(MDLTextureSampler);

#endif /* NMDLTextureSampler_h */
