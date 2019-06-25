//
//  NMTLRenderPipelineDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineDescriptor.h"

#define instancetype MTLRenderPipelineDescriptor
#define js_value_instancetype js_value_MTLRenderPipelineDescriptor

NMTLRenderPipelineDescriptor::NMTLRenderPipelineDescriptor() {}
NMTLRenderPipelineDescriptor::~NMTLRenderPipelineDescriptor() {}

JS_INIT_CLASS(MTLRenderPipelineDescriptor, NSObject);
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_PROP(label);
  JS_ASSIGN_PROTO_PROP(vertexFunction);
  JS_ASSIGN_PROTO_PROP(fragmentFunction);
  JS_ASSIGN_PROTO_PROP(vertexDescriptor);
  JS_ASSIGN_PROTO_PROP(sampleCount);
  JS_ASSIGN_PROTO_PROP(rasterSampleCount);
  JS_ASSIGN_PROTO_PROP(isAlphaToCoverageEnabled);
  JS_ASSIGN_PROTO_PROP(isAlphaToOneEnabled);
  JS_ASSIGN_PROTO_PROP(isRasterizationEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(colorAttachments);
  JS_ASSIGN_PROTO_PROP(depthAttachmentPixelFormat);
  JS_ASSIGN_PROTO_PROP(stencilAttachmentPixelFormat);
  JS_ASSIGN_PROTO_PROP(inputPrimitiveTopology);
  JS_ASSIGN_PROTO_PROP(tessellationPartitionMode);
  JS_ASSIGN_PROTO_PROP(maxTessellationFactor);
  JS_ASSIGN_PROTO_PROP(isTessellationFactorScaleEnabled);
  JS_ASSIGN_PROTO_PROP(tessellationFactorFormat);
  JS_ASSIGN_PROTO_PROP(tessellationControlPointIndexType);
  JS_ASSIGN_PROTO_PROP(tessellationFactorStepFunction);
  JS_ASSIGN_PROTO_PROP(tessellationOutputWindingOrder);
  JS_ASSIGN_PROTO_PROP_READONLY(vertexBuffers);
  JS_ASSIGN_PROTO_PROP_READONLY(fragmentBuffers);
  JS_ASSIGN_PROTO_PROP(supportIndirectCommandBuffers);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineDescriptor, NSObject);
  // constant values (exports)

//typedef NS_ENUM(NSUInteger, MTLBlendFactor) {
  JS_ASSIGN_ENUM(MTLBlendFactorZero, NSUInteger); // = 0,
  JS_ASSIGN_ENUM(MTLBlendFactorOne, NSUInteger); // = 1,
  JS_ASSIGN_ENUM(MTLBlendFactorSourceColor, NSUInteger); // = 2,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSourceColor, NSUInteger); // = 3,
  JS_ASSIGN_ENUM(MTLBlendFactorSourceAlpha, NSUInteger); // = 4,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSourceAlpha, NSUInteger); // = 5,
  JS_ASSIGN_ENUM(MTLBlendFactorDestinationColor, NSUInteger); // = 6,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusDestinationColor, NSUInteger); // = 7,
  JS_ASSIGN_ENUM(MTLBlendFactorDestinationAlpha, NSUInteger); // = 8,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusDestinationAlpha, NSUInteger); // = 9,
  JS_ASSIGN_ENUM(MTLBlendFactorSourceAlphaSaturated, NSUInteger); // = 10,
  JS_ASSIGN_ENUM(MTLBlendFactorBlendColor, NSUInteger); // = 11,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusBlendColor, NSUInteger); // = 12,
  JS_ASSIGN_ENUM(MTLBlendFactorBlendAlpha, NSUInteger); // = 13,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusBlendAlpha, NSUInteger); // = 14,
  JS_ASSIGN_ENUM(MTLBlendFactorSource1Color, NSUInteger); //              API_AVAILABLE(macos(10.12), ios(10.11)) = 15,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSource1Color, NSUInteger); //      API_AVAILABLE(macos(10.12), ios(10.11)) = 16,
  JS_ASSIGN_ENUM(MTLBlendFactorSource1Alpha, NSUInteger); //              API_AVAILABLE(macos(10.12), ios(10.11)) = 17,
  JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSource1Alpha, NSUInteger); //      API_AVAILABLE(macos(10.12), ios(10.11)) = 18,
//} API_AVAILABLE(macos(10.11), ios(8.0));

//typedef NS_ENUM(NSUInteger, MTLBlendOperation) {
  JS_ASSIGN_ENUM(MTLBlendOperationAdd, NSUInteger); // = 0,
  JS_ASSIGN_ENUM(MTLBlendOperationSubtract, NSUInteger); // = 1,
  JS_ASSIGN_ENUM(MTLBlendOperationReverseSubtract, NSUInteger); // = 2,
  JS_ASSIGN_ENUM(MTLBlendOperationMin, NSUInteger); // = 3,
  JS_ASSIGN_ENUM(MTLBlendOperationMax, NSUInteger); // = 4,
//} API_AVAILABLE(macos(10.11), ios(8.0));

//typedef NS_OPTIONS(NSUInteger, MTLColorWriteMask) {
  JS_ASSIGN_ENUM(MTLColorWriteMaskNone, NSUInteger); //  = 0,
  JS_ASSIGN_ENUM(MTLColorWriteMaskRed, NSUInteger); //   = 0x1 << 3,
  JS_ASSIGN_ENUM(MTLColorWriteMaskGreen, NSUInteger); // = 0x1 << 2,
  JS_ASSIGN_ENUM(MTLColorWriteMaskBlue, NSUInteger); //  = 0x1 << 1,
  JS_ASSIGN_ENUM(MTLColorWriteMaskAlpha, NSUInteger); // = 0x1 << 0,
  JS_ASSIGN_ENUM(MTLColorWriteMaskAll, NSUInteger); //   = 0xf
//} API_AVAILABLE(macos(10.11), ios(8.0));

//typedef NS_ENUM(NSUInteger, MTLPrimitiveTopologyClass) {
  JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassUnspecified, NSUInteger); // = 0,
  JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassPoint, NSUInteger); // = 1,
  JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassLine, NSUInteger); // = 2,
  JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassTriangle, NSUInteger); // = 3,
//} API_AVAILABLE(macos(10.11), ios(12.0));

//typedef NS_ENUM(NSUInteger, MTLTessellationPartitionMode) {
  JS_ASSIGN_ENUM(MTLTessellationPartitionModePow2, NSUInteger); // = 0,
  JS_ASSIGN_ENUM(MTLTessellationPartitionModeInteger, NSUInteger); // = 1,
  JS_ASSIGN_ENUM(MTLTessellationPartitionModeFractionalOdd, NSUInteger); // = 2,
  JS_ASSIGN_ENUM(MTLTessellationPartitionModeFractionalEven, NSUInteger); // = 3,
//} API_AVAILABLE(macos(10.12), ios(10.0));

//typedef NS_ENUM(NSUInteger, MTLTessellationFactorStepFunction) {
  JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionConstant, NSUInteger); // = 0,
  JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionPerPatch, NSUInteger); // = 1,
  JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionPerInstance, NSUInteger); // = 2,
  JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionPerPatchAndPerInstance, NSUInteger); // = 3,
//} API_AVAILABLE(macos(10.12), ios(10.0));

//typedef NS_ENUM(NSUInteger, MTLTessellationFactorFormat) {
  JS_ASSIGN_ENUM(MTLTessellationFactorFormatHalf, NSUInteger); // = 0,
//} API_AVAILABLE(macos(10.12), ios(10.0));

//typedef NS_ENUM(NSUInteger, MTLTessellationControlPointIndexType) {
  JS_ASSIGN_ENUM(MTLTessellationControlPointIndexTypeNone, NSUInteger); // = 0,
  JS_ASSIGN_ENUM(MTLTessellationControlPointIndexTypeUInt16, NSUInteger); // = 1,
  JS_ASSIGN_ENUM(MTLTessellationControlPointIndexTypeUInt32, NSUInteger); // = 2,
//} API_AVAILABLE(macos(10.12), ios(10.0));


JS_INIT_CLASS_END(MTLRenderPipelineDescriptor, NSObject);

NAN_METHOD(NMTLRenderPipelineDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPipelineDescriptor);
  @autoreleasepool {
    MTLRenderPipelineDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPipelineDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPipelineDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPipelineDescriptor *wrapper = new NMTLRenderPipelineDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineDescriptor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLRenderPipelineDescriptor::reset) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    [self reset];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::labelGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::labelSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}

#include "NMTLFunction.h"

NAN_GETTER(NMTLRenderPipelineDescriptor::vertexFunctionGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLFunction([self vertexFunction]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::vertexFunctionSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(MTLFunction, input);
    [self setVertexFunction: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::fragmentFunctionGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLFunction([self fragmentFunction]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::fragmentFunctionSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(MTLFunction, input);
    [self setFragmentFunction: input];
  }
}

#include "NMTLVertexDescriptor.h"

NAN_GETTER(NMTLRenderPipelineDescriptor::vertexDescriptorGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLVertexDescriptor([self vertexDescriptor]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::vertexDescriptorSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MTLVertexDescriptor, input);
    [self setVertexDescriptor: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::sampleCountGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self sampleCount]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::sampleCountSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSampleCount: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::rasterSampleCountGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self rasterSampleCount]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::rasterSampleCountSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setRasterSampleCount: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::isAlphaToCoverageEnabledGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAlphaToCoverageEnabled]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::isAlphaToCoverageEnabledSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAlphaToCoverageEnabled: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::isAlphaToOneEnabledGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAlphaToOneEnabled]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::isAlphaToOneEnabledSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAlphaToOneEnabled: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::isRasterizationEnabledGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRasterizationEnabled]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::isRasterizationEnabledSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRasterizationEnabled: input];
  }
}

#include "NMTLRenderPipelineColorAttachmentDescriptorArray.h"

NAN_GETTER(NMTLRenderPipelineDescriptor::colorAttachmentsGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLRenderPipelineColorAttachmentDescriptorArray([self colorAttachments]));
  }
}

#include "NMTLPixelFormat.h"

NAN_GETTER(NMTLRenderPipelineDescriptor::depthAttachmentPixelFormatGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self depthAttachmentPixelFormat]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::depthAttachmentPixelFormatSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPixelFormat, input);
    [self setDepthAttachmentPixelFormat: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::stencilAttachmentPixelFormatGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self stencilAttachmentPixelFormat]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::stencilAttachmentPixelFormatSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPixelFormat, input);
    [self setStencilAttachmentPixelFormat: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::inputPrimitiveTopologyGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPrimitiveTopologyClass([self inputPrimitiveTopology]));
  }
}

#include "NMTLRenderPipeline.h"

NAN_SETTER(NMTLRenderPipelineDescriptor::inputPrimitiveTopologySetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPrimitiveTopologyClass, input);
    [self setInputPrimitiveTopology: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::tessellationPartitionModeGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTessellationPartitionMode([self tessellationPartitionMode]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::tessellationPartitionModeSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTessellationPartitionMode, input);
    [self setTessellationPartitionMode: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::maxTessellationFactorGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxTessellationFactor]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::maxTessellationFactorSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMaxTessellationFactor: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::isTessellationFactorScaleEnabledGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTessellationFactorScaleEnabled]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::isTessellationFactorScaleEnabledSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setTessellationFactorScaleEnabled: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::tessellationFactorFormatGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTessellationFactorFormat([self tessellationFactorFormat]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::tessellationFactorFormatSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTessellationFactorFormat, input);
    [self setTessellationFactorFormat: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::tessellationControlPointIndexTypeGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTessellationControlPointIndexType([self tessellationControlPointIndexType]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::tessellationControlPointIndexTypeSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTessellationControlPointIndexType, input);
    [self setTessellationControlPointIndexType: input];
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::tessellationFactorStepFunctionGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTessellationFactorStepFunction([self tessellationFactorStepFunction]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::tessellationFactorStepFunctionSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTessellationFactorStepFunction, input);
    [self setTessellationFactorStepFunction: input];
  }
}

#include "NMTLRenderCommandEncoder.h"

NAN_GETTER(NMTLRenderPipelineDescriptor::tessellationOutputWindingOrderGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLWinding([self tessellationOutputWindingOrder]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::tessellationOutputWindingOrderSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLWinding, input);
    [self setTessellationOutputWindingOrder: input];
  }
}

#include "NMTLPipelineBufferDescriptorArray.h"

NAN_GETTER(NMTLRenderPipelineDescriptor::vertexBuffersGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPipelineBufferDescriptorArray([self vertexBuffers]));
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::fragmentBuffersGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPipelineBufferDescriptorArray([self fragmentBuffers]));
  }
}

NAN_GETTER(NMTLRenderPipelineDescriptor::supportIndirectCommandBuffersGetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self supportIndirectCommandBuffers]));
  }
}

NAN_SETTER(NMTLRenderPipelineDescriptor::supportIndirectCommandBuffersSetter) {
  JS_UNWRAP(MTLRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSupportIndirectCommandBuffers: input];
  }
}
