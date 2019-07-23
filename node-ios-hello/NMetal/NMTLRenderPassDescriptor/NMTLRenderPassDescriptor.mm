//
//  NMTLRenderPassDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPassDescriptor.h"

#define instancetype MTLRenderPassDescriptor
#define js_value_instancetype js_value_MTLRenderPassDescriptor

Local<Value> js_value_MTLClearColor(const MTLClearColor& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("red"), js_value_double(value.red));
  result->Set(JS_STR("green"), js_value_double(value.green));
  result->Set(JS_STR("blue"), js_value_double(value.blue));
  result->Set(JS_STR("alpha"), js_value_double(value.alpha));
  return scope.Escape(result);
}

MTLClearColor to_value_MTLClearColor(const Local<Value>& value, bool * _Nullable failed) {
  MTLClearColor result(MTLClearColorMake(0,0,0,1));
  if (failed) {
    *failed = false;
  }
  if (!is_value_MTLClearColor(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected CGColor");
    }
    return result;
  }
  result.red = to_value_double(JS_OBJ(value)->Get(JS_STR("red")));
  result.green = to_value_double(JS_OBJ(value)->Get(JS_STR("green")));
  result.blue = to_value_double(JS_OBJ(value)->Get(JS_STR("blue")));
  if (is_value_double(JS_OBJ(value)->Get(JS_STR("alpha")))) {
    result.alpha = to_value_double(JS_OBJ(value)->Get(JS_STR("alpha")));
  }
  return result;
}

bool is_value_MTLClearColor(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("red"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("green"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("blue"))->IsNumber()) {
    return false;
  }
  return true;
}

NMTLRenderPassDescriptor::NMTLRenderPassDescriptor() {}
NMTLRenderPassDescriptor::~NMTLRenderPassDescriptor() {}

JS_INIT_CLASS(MTLRenderPassDescriptor, NSObject);
  JS_ASSIGN_STATIC_METHOD(renderPassDescriptor);
  JS_ASSIGN_PROTO_METHOD(setSamplePositionsCount);
  JS_ASSIGN_PROTO_METHOD(getSamplePositionsCount);
  JS_ASSIGN_PROTO_PROP_READONLY(colorAttachments);
  JS_ASSIGN_PROTO_PROP(depthAttachment);
  JS_ASSIGN_PROTO_PROP(stencilAttachment);
  JS_ASSIGN_PROTO_PROP(visibilityResultBuffer);
  JS_ASSIGN_PROTO_PROP(renderTargetArrayLength);
#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_PROP(imageblockSampleLength);
  JS_ASSIGN_PROTO_PROP(threadgroupMemoryLength);
  JS_ASSIGN_PROTO_PROP(tileWidth);
  JS_ASSIGN_PROTO_PROP(tileHeight);
#endif
  JS_ASSIGN_PROTO_PROP(defaultRasterSampleCount);
  JS_ASSIGN_PROTO_PROP(renderTargetWidth);
  JS_ASSIGN_PROTO_PROP(renderTargetHeight);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPassDescriptor, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLLoadAction) {
    JS_ASSIGN_ENUM(MTLLoadActionDontCare, NSInteger); // = 0,
    JS_ASSIGN_ENUM(MTLLoadActionLoad, NSInteger); // = 1,
    JS_ASSIGN_ENUM(MTLLoadActionClear, NSInteger); // = 2,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLStoreAction) {
    JS_ASSIGN_ENUM(MTLStoreActionDontCare, NSInteger); // = 0,
    JS_ASSIGN_ENUM(MTLStoreActionStore, NSInteger); // = 1,
    JS_ASSIGN_ENUM(MTLStoreActionMultisampleResolve, NSInteger); // = 2,
    JS_ASSIGN_ENUM(MTLStoreActionStoreAndMultisampleResolve, NSInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 3,
    JS_ASSIGN_ENUM(MTLStoreActionUnknown, NSInteger); // API_AVAILABLE(macos(10.12), ios(10.0)) = 4,
    JS_ASSIGN_ENUM(MTLStoreActionCustomSampleDepthStore, NSInteger); // API_AVAILABLE(macos(10.13), ios(11.0)) = 5,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_OPTIONS(NSUInteger, MTLStoreActionOptions) {
    JS_ASSIGN_ENUM(MTLStoreActionOptionNone, NSInteger); //                  = 0,
    JS_ASSIGN_ENUM(MTLStoreActionOptionCustomSamplePositions, NSInteger); // = 1 << 0,
  //} API_AVAILABLE(macos(10.13), ios(11.0));

  /*!
   @enum MTLMultisampleDepthResolveFilter
   @abstract Controls the MSAA depth resolve operation. Supported on iOS GPU Family 3 and later.
   */
  //typedef NS_ENUM(NSUInteger, MTLMultisampleDepthResolveFilter) {
    JS_ASSIGN_ENUM(MTLMultisampleDepthResolveFilterSample0, NSInteger); // = 0,
    JS_ASSIGN_ENUM(MTLMultisampleDepthResolveFilterMin, NSInteger); // = 1,
    JS_ASSIGN_ENUM(MTLMultisampleDepthResolveFilterMax, NSInteger); // = 2,
  //} API_AVAILABLE(macos(10.14), ios(9.0));

  /*!
   @enum MTLMultisampleStencilResolveFilter
   @abstract Controls the MSAA stencil resolve operation.
   */
  //typedef NS_ENUM(NSUInteger, MTLMultisampleStencilResolveFilter) {
    /*!
     @constant MTLMultisampleStencilResolveFilterSample0
     @abstract The stencil sample corresponding to sample 0. This is the default behavior.
     */
    JS_ASSIGN_ENUM(MTLMultisampleStencilResolveFilterSample0, NSInteger); //               = 0,

    /*!
     @constant MTLMultisampleStencilResolveFilterDepthResolvedSample
     @abstract The stencil sample corresponding to whichever depth sample is selected by the depth resolve filter. If depth resolve is not enabled, the stencil sample is chosen based on what a depth resolve filter would have selected.
     */
    JS_ASSIGN_ENUM(MTLMultisampleStencilResolveFilterDepthResolvedSample, NSInteger); //   = 1,
  //} API_AVAILABLE(macos(10.14), ios(12.0));

JS_INIT_CLASS_END(MTLRenderPassDescriptor, NSObject);

NAN_METHOD(NMTLRenderPassDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPassDescriptor);
  @autoreleasepool {
    MTLRenderPassDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPassDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPassDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPassDescriptor *wrapper = new NMTLRenderPassDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPassDescriptor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLRenderPassDescriptor::renderPassDescriptor) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLRenderPassDescriptor([MTLRenderPassDescriptor renderPassDescriptor]));
  }
}

NAN_METHOD(NMTLRenderPassDescriptor::setSamplePositionsCount) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (!info[data_argument_index]->IsNullOrUndefined() && !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const MTLSamplePosition* positions = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const MTLSamplePosition*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, count);
    [self setSamplePositions: positions count: count];
  }
}

NAN_METHOD(NMTLRenderPassDescriptor::getSamplePositionsCount) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (!info[data_argument_index]->IsNullOrUndefined() && !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    MTLSamplePosition* positions = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (MTLSamplePosition*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, count);
    JS_SET_RETURN(js_value_NSUInteger([self getSamplePositions: positions count: count]));
  }
}

#include "NMTLRenderPassColorAttachmentDescriptorArray.h"

NAN_GETTER(NMTLRenderPassDescriptor::colorAttachmentsGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLRenderPassColorAttachmentDescriptorArray([self colorAttachments]));
  }
}

#include "NMTLRenderPassDepthAttachmentDescriptor.h"

NAN_GETTER(NMTLRenderPassDescriptor::depthAttachmentGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLRenderPassDepthAttachmentDescriptor([self depthAttachment]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::depthAttachmentSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MTLRenderPassDepthAttachmentDescriptor, input);
    [self setDepthAttachment: input];
  }
}

#include "NMTLRenderPassStencilAttachmentDescriptor.h"

NAN_GETTER(NMTLRenderPassDescriptor::stencilAttachmentGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLRenderPassStencilAttachmentDescriptor([self stencilAttachment]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::stencilAttachmentSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MTLRenderPassStencilAttachmentDescriptor, input);
    [self setStencilAttachment: input];
  }
}

NAN_GETTER(NMTLRenderPassDescriptor::visibilityResultBufferGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MTLBuffer>*/([self visibilityResultBuffer]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::visibilityResultBufferSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MTLBuffer>*/, input);
    [self setVisibilityResultBuffer: input];
  }
}

NAN_GETTER(NMTLRenderPassDescriptor::renderTargetArrayLengthGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self renderTargetArrayLength]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::renderTargetArrayLengthSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setRenderTargetArrayLength: input];
  }
}

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
NAN_GETTER(NMTLRenderPassDescriptor::imageblockSampleLengthGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self imageblockSampleLength]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::imageblockSampleLengthSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setImageblockSampleLength: input];
  }
}

NAN_GETTER(NMTLRenderPassDescriptor::threadgroupMemoryLengthGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self threadgroupMemoryLength]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::threadgroupMemoryLengthSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setThreadgroupMemoryLength: input];
  }
}

NAN_GETTER(NMTLRenderPassDescriptor::tileWidthGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self tileWidth]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::tileWidthSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setTileWidth: input];
  }
}

NAN_GETTER(NMTLRenderPassDescriptor::tileHeightGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self tileHeight]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::tileHeightSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setTileHeight: input];
  }
}
#endif

NAN_GETTER(NMTLRenderPassDescriptor::defaultRasterSampleCountGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self defaultRasterSampleCount]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::defaultRasterSampleCountSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setDefaultRasterSampleCount: input];
  }
}

NAN_GETTER(NMTLRenderPassDescriptor::renderTargetWidthGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self renderTargetWidth]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::renderTargetWidthSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setRenderTargetWidth: input];
  }
}

NAN_GETTER(NMTLRenderPassDescriptor::renderTargetHeightGetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self renderTargetHeight]));
  }
}

NAN_SETTER(NMTLRenderPassDescriptor::renderTargetHeightSetter) {
  JS_UNWRAP(MTLRenderPassDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setRenderTargetHeight: input];
  }
}
