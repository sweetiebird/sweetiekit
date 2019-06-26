//
//  NMTLRenderPipelineState.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineState.h"

#define instancetype MTLRenderPipelineState
#define js_value_instancetype js_value_MTLRenderPipelineState

NMTLRenderPipelineState::NMTLRenderPipelineState() {}
NMTLRenderPipelineState::~NMTLRenderPipelineState() {}

JS_INIT_PROTOCOL(MTLRenderPipelineState, NSObject);
  JS_ASSIGN_PROTO_METHOD(imageblockMemoryLengthForDimensions);
  JS_ASSIGN_PROTO_PROP_READONLY(label);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP_READONLY(maxTotalThreadsPerThreadgroup);
  JS_ASSIGN_PROTO_PROP_READONLY(threadgroupSizeMatchesTileSize);
  JS_ASSIGN_PROTO_PROP_READONLY(imageblockSampleLength);
  JS_ASSIGN_PROTO_PROP_READONLY(supportIndirectCommandBuffers);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineState, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLRenderPipelineState, NSObject);

NAN_METHOD(NMTLRenderPipelineState::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLRenderPipelineState);
  @autoreleasepool {
    id<MTLRenderPipelineState> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLRenderPipelineState>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLRenderPipelineState> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLRenderPipelineState, value);
      self = value;
    }
    if (self) {
      NMTLRenderPipelineState *wrapper = new NMTLRenderPipelineState();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineState::New: invalid arguments");
    }
  }
}

#include "NMTLTypes.h"

NAN_METHOD(NMTLRenderPipelineState::imageblockMemoryLengthForDimensions) {
  JS_UNWRAP_PROTOCOL(MTLRenderPipelineState, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLSize, imageblockDimensions);
    JS_SET_RETURN(js_value_NSUInteger([self imageblockMemoryLengthForDimensions: imageblockDimensions]));
  }
}

NAN_GETTER(NMTLRenderPipelineState::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderPipelineState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLRenderPipelineState::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderPipelineState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

NAN_GETTER(NMTLRenderPipelineState::maxTotalThreadsPerThreadgroupGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderPipelineState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxTotalThreadsPerThreadgroup]));
  }
}

NAN_GETTER(NMTLRenderPipelineState::threadgroupSizeMatchesTileSizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderPipelineState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self threadgroupSizeMatchesTileSize]));
  }
}

NAN_GETTER(NMTLRenderPipelineState::imageblockSampleLengthGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderPipelineState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self imageblockSampleLength]));
  }
}

NAN_GETTER(NMTLRenderPipelineState::supportIndirectCommandBuffersGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderPipelineState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self supportIndirectCommandBuffers]));
  }
}
