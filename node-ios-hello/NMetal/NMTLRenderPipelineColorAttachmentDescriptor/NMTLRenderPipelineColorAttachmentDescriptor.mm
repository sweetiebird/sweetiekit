//
//  NMTLRenderPipelineColorAttachmentDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineColorAttachmentDescriptor.h"

#define instancetype MTLRenderPipelineColorAttachmentDescriptor
#define js_value_instancetype js_value_MTLRenderPipelineColorAttachmentDescriptor

NMTLRenderPipelineColorAttachmentDescriptor::NMTLRenderPipelineColorAttachmentDescriptor() {}
NMTLRenderPipelineColorAttachmentDescriptor::~NMTLRenderPipelineColorAttachmentDescriptor() {}

JS_INIT_CLASS(MTLRenderPipelineColorAttachmentDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(pixelFormat);
  JS_ASSIGN_PROTO_PROP(isBlendingEnabled);
  JS_ASSIGN_PROTO_PROP(sourceRGBBlendFactor);
  JS_ASSIGN_PROTO_PROP(destinationRGBBlendFactor);
  JS_ASSIGN_PROTO_PROP(rgbBlendOperation);
  JS_ASSIGN_PROTO_PROP(sourceAlphaBlendFactor);
  JS_ASSIGN_PROTO_PROP(destinationAlphaBlendFactor);
  JS_ASSIGN_PROTO_PROP(alphaBlendOperation);
  JS_ASSIGN_PROTO_PROP(writeMask);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineColorAttachmentDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPipelineColorAttachmentDescriptor, NSObject);

NAN_METHOD(NMTLRenderPipelineColorAttachmentDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPipelineColorAttachmentDescriptor);
  @autoreleasepool {
    MTLRenderPipelineColorAttachmentDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPipelineColorAttachmentDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPipelineColorAttachmentDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPipelineColorAttachmentDescriptor *wrapper = new NMTLRenderPipelineColorAttachmentDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineColorAttachmentDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLPixelFormat.h"

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::pixelFormatGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self pixelFormat]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::pixelFormatSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPixelFormat, input);
    [self setPixelFormat: input];
  }
}

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::isBlendingEnabledGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBlendingEnabled]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::isBlendingEnabledSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBlendingEnabled: input];
  }
}

#include "NMTLRenderPipeline.h"

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::sourceRGBBlendFactorGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBlendFactor([self sourceRGBBlendFactor]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::sourceRGBBlendFactorSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLBlendFactor, input);
    [self setSourceRGBBlendFactor: input];
  }
}

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::destinationRGBBlendFactorGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBlendFactor([self destinationRGBBlendFactor]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::destinationRGBBlendFactorSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLBlendFactor, input);
    [self setDestinationRGBBlendFactor: input];
  }
}

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::rgbBlendOperationGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBlendOperation([self rgbBlendOperation]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::rgbBlendOperationSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLBlendOperation, input);
    [self setRgbBlendOperation: input];
  }
}

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::sourceAlphaBlendFactorGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBlendFactor([self sourceAlphaBlendFactor]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::sourceAlphaBlendFactorSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLBlendFactor, input);
    [self setSourceAlphaBlendFactor: input];
  }
}

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::destinationAlphaBlendFactorGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBlendFactor([self destinationAlphaBlendFactor]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::destinationAlphaBlendFactorSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLBlendFactor, input);
    [self setDestinationAlphaBlendFactor: input];
  }
}

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::alphaBlendOperationGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBlendOperation([self alphaBlendOperation]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::alphaBlendOperationSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLBlendOperation, input);
    [self setAlphaBlendOperation: input];
  }
}

NAN_GETTER(NMTLRenderPipelineColorAttachmentDescriptor::writeMaskGetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLColorWriteMask([self writeMask]));
  }
}

NAN_SETTER(NMTLRenderPipelineColorAttachmentDescriptor::writeMaskSetter) {
  JS_UNWRAP(MTLRenderPipelineColorAttachmentDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLColorWriteMask, input);
    [self setWriteMask: input];
  }
}
