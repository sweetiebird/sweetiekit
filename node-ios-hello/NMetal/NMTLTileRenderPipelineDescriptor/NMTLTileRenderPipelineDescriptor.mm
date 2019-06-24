//
//  NMTLTileRenderPipelineDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTileRenderPipelineDescriptor.h"

#define instancetype MTLTileRenderPipelineDescriptor
#define js_value_instancetype js_value_MTLTileRenderPipelineDescriptor

NMTLTileRenderPipelineDescriptor::NMTLTileRenderPipelineDescriptor() {}
NMTLTileRenderPipelineDescriptor::~NMTLTileRenderPipelineDescriptor() {}

JS_INIT_CLASS(MTLTileRenderPipelineDescriptor, NSObject);
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_PROP(label);
  JS_ASSIGN_PROTO_PROP(tileFunction);
  JS_ASSIGN_PROTO_PROP(rasterSampleCount);
  JS_ASSIGN_PROTO_PROP_READONLY(colorAttachments);
  JS_ASSIGN_PROTO_PROP(threadgroupSizeMatchesTileSize);
  JS_ASSIGN_PROTO_PROP_READONLY(tileBuffers);
  JS_ASSIGN_PROTO_PROP(maxTotalThreadsPerThreadgroup);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTileRenderPipelineDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLTileRenderPipelineDescriptor, NSObject);

NAN_METHOD(NMTLTileRenderPipelineDescriptor::New) {
  JS_RECONSTRUCT(MTLTileRenderPipelineDescriptor);
  @autoreleasepool {
    MTLTileRenderPipelineDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLTileRenderPipelineDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLTileRenderPipelineDescriptor alloc] init];
    }
    if (self) {
      NMTLTileRenderPipelineDescriptor *wrapper = new NMTLTileRenderPipelineDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTileRenderPipelineDescriptor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLTileRenderPipelineDescriptor::reset) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    [self reset];
  }
}

NAN_GETTER(NMTLTileRenderPipelineDescriptor::labelGetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLTileRenderPipelineDescriptor::labelSetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}

#include "NMTLFunction.h"

NAN_GETTER(NMTLTileRenderPipelineDescriptor::tileFunctionGetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLFunction([self tileFunction]));
  }
}

NAN_SETTER(NMTLTileRenderPipelineDescriptor::tileFunctionSetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(MTLFunction, input);
    [self setTileFunction: input];
  }
}

NAN_GETTER(NMTLTileRenderPipelineDescriptor::rasterSampleCountGetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self rasterSampleCount]));
  }
}

NAN_SETTER(NMTLTileRenderPipelineDescriptor::rasterSampleCountSetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setRasterSampleCount: input];
  }
}

#include "NMTLTileRenderPipelineColorAttachmentDescriptorArray.h"

NAN_GETTER(NMTLTileRenderPipelineDescriptor::colorAttachmentsGetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTileRenderPipelineColorAttachmentDescriptorArray([self colorAttachments]));
  }
}

NAN_GETTER(NMTLTileRenderPipelineDescriptor::threadgroupSizeMatchesTileSizeGetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self threadgroupSizeMatchesTileSize]));
  }
}

NAN_SETTER(NMTLTileRenderPipelineDescriptor::threadgroupSizeMatchesTileSizeSetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setThreadgroupSizeMatchesTileSize: input];
  }
}

#include "NMTLPipelineBufferDescriptorArray.h"

NAN_GETTER(NMTLTileRenderPipelineDescriptor::tileBuffersGetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPipelineBufferDescriptorArray([self tileBuffers]));
  }
}

NAN_GETTER(NMTLTileRenderPipelineDescriptor::maxTotalThreadsPerThreadgroupGetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxTotalThreadsPerThreadgroup]));
  }
}

NAN_SETTER(NMTLTileRenderPipelineDescriptor::maxTotalThreadsPerThreadgroupSetter) {
  JS_UNWRAP(MTLTileRenderPipelineDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMaxTotalThreadsPerThreadgroup: input];
  }
}
