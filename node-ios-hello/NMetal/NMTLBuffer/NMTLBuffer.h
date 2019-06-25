//
//  NMTLBuffer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLBuffer_h
#define NMTLBuffer_h    

#include "NMTLResource.h"

#define js_value_MTLBuffer(x) js_protocol_wrapper(x, MTLBuffer)
#define to_value_MTLBuffer(x) to_protocol_wrapper(x, MTLBuffer)
#define is_value_MTLBuffer(x) is_protocol_wrapper(x, MTLBuffer)

JS_WRAP_PROTOCOL(MTLBuffer, MTLResource);
  JS_METHOD(contents);
  JS_METHOD(didModifyRange);
  JS_METHOD(newTextureWithDescriptorOffsetBytesPerRow);
  JS_METHOD(addDebugMarkerRange);
  JS_METHOD(removeAllDebugMarkers);
  JS_PROP_READONLY(length);
JS_WRAP_PROTOCOL_END(MTLBuffer, MTLResource);

#endif /* NMTLBuffer_h */
