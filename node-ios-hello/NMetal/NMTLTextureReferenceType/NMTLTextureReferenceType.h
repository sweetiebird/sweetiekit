//
//  NMTLTextureReferenceType.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTextureReferenceType_h
#define NMTLTextureReferenceType_h    

#include "NMTLType.h"

#define js_value_MTLTextureReferenceType(x) js_value_wrapper(x, MTLTextureReferenceType)
#define to_value_MTLTextureReferenceType(x) to_value_wrapper(x, MTLTextureReferenceType)
#define is_value_MTLTextureReferenceType(x) is_value_wrapper(x, MTLTextureReferenceType)

JS_WRAP_CLASS(MTLTextureReferenceType, MTLType);
  // TODO: declare MTLTextureReferenceType methods and properties
JS_WRAP_CLASS_END(MTLTextureReferenceType);

#endif /* NMTLTextureReferenceType_h */