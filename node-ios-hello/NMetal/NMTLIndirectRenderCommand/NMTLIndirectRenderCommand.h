//
//  NMTLIndirectRenderCommand.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLIndirectRenderCommand_h
#define NMTLIndirectRenderCommand_h    

#include "NNSObject.h"

#define js_value_MTLIndirectRenderCommand(x) js_protocol_wrapper(x, MTLIndirectRenderCommand)
#define to_value_MTLIndirectRenderCommand(x) to_protocol_wrapper(x, MTLIndirectRenderCommand)
#define is_value_MTLIndirectRenderCommand(x) is_protocol_wrapper(x, MTLIndirectRenderCommand)

JS_WRAP_PROTOCOL(MTLIndirectRenderCommand, NSObject);
  JS_METHOD(setRenderPipelineState);
  JS_METHOD(setVertexBufferOffsetAtIndex);
  JS_METHOD(setFragmentBufferOffsetAtIndex);
  JS_METHOD(drawPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetInstanceCountBaseInstanceTessellationFactorBufferTessellationFactorBufferOffsetTessellationFactorBufferInstanceStride);
  JS_METHOD(drawIndexedPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetInstanceCountBaseInstanceTessellationFactorBufferTessellationFactorBufferOffsetTessellationFactorBufferInstanceStride);
  JS_METHOD(drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance);
  JS_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance);
  JS_METHOD(reset);
JS_WRAP_PROTOCOL_END(MTLIndirectRenderCommand, NSObject);

#endif /* NMTLIndirectRenderCommand_h */
