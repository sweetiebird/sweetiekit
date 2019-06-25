//
//  NMTKView.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTKView.h"

#define instancetype MTKView
#define js_value_instancetype js_value_MTKView

NMTKView::NMTKView() {}
NMTKView::~NMTKView() {}

JS_INIT_CLASS(MTKView, UIView);
  JS_ASSIGN_PROTO_METHOD(initWithFrameDevice);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(releaseDrawables);
  JS_ASSIGN_PROTO_METHOD(draw);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(device);
  JS_ASSIGN_PROTO_PROP_READONLY(currentDrawable);
  JS_ASSIGN_PROTO_PROP(framebufferOnly);
  JS_ASSIGN_PROTO_PROP(presentsWithTransaction);
  JS_ASSIGN_PROTO_PROP(colorPixelFormat);
  JS_ASSIGN_PROTO_PROP(depthStencilPixelFormat);
  JS_ASSIGN_PROTO_PROP(sampleCount);
  JS_ASSIGN_PROTO_PROP(clearColor);
  JS_ASSIGN_PROTO_PROP(clearDepth);
  JS_ASSIGN_PROTO_PROP(clearStencil);
  JS_ASSIGN_PROTO_PROP_READONLY(depthStencilTexture);
  JS_ASSIGN_PROTO_PROP_READONLY(multisampleColorTexture);
  JS_ASSIGN_PROTO_PROP_READONLY(currentRenderPassDescriptor);
  JS_ASSIGN_PROTO_PROP(preferredFramesPerSecond);
  JS_ASSIGN_PROTO_PROP(enableSetNeedsDisplay);
  JS_ASSIGN_PROTO_PROP(autoResizeDrawable);
  JS_ASSIGN_PROTO_PROP(drawableSize);
  JS_ASSIGN_PROTO_PROP(isPaused);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP(colorspace);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTKView, UIView);
  // constant values (exports)
JS_INIT_CLASS_END(MTKView, UIView);

NAN_METHOD(NMTKView::New) {
  JS_RECONSTRUCT(MTKView);
  @autoreleasepool {
    MTKView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTKView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[MTKView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[MTKView alloc] init];
    }
    if (self) {
      NMTKView *wrapper = new NMTKView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTKView::New: invalid arguments");
    }
  }
}

#include "NMTLDevice.h"

NAN_METHOD(NMTKView::initWithFrameDevice) {
  JS_UNWRAP_OR_ALLOC(MTKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frameRect);
    declare_nullable_protocol(MTLDevice, device);
    JS_SET_RETURN(js_value_instancetype([self initWithFrame: frameRect device: device]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NMTKView::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(MTKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: coder]));
  }
}

NAN_METHOD(NMTKView::releaseDrawables) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    [self releaseDrawables];
  }
}

NAN_METHOD(NMTKView::draw) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    [self draw];
  }
}

#include "NMTKViewDelegate.h"

NAN_GETTER(NMTKView::delegateGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTKViewDelegate([self delegate]));
  }
}

NAN_SETTER(NMTKView::delegateSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(MTKViewDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NMTKView::delegate"];
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTKView::deviceGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

NAN_SETTER(NMTKView::deviceSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(MTLDevice, input);
    [self setDevice: input];
  }
}

#include "NCAMetalDrawable.h"

NAN_GETTER(NMTKView::currentDrawableGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAMetalDrawable([self currentDrawable]));
  }
}

NAN_GETTER(NMTKView::framebufferOnlyGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self framebufferOnly]));
  }
}

NAN_SETTER(NMTKView::framebufferOnlySetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setFramebufferOnly: input];
  }
}

NAN_GETTER(NMTKView::presentsWithTransactionGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self presentsWithTransaction]));
  }
}

NAN_SETTER(NMTKView::presentsWithTransactionSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPresentsWithTransaction: input];
  }
}

#include "NMTLPixelFormat.h"

NAN_GETTER(NMTKView::colorPixelFormatGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self colorPixelFormat]));
  }
}

NAN_SETTER(NMTKView::colorPixelFormatSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPixelFormat, input);
    [self setColorPixelFormat: input];
  }
}

NAN_GETTER(NMTKView::depthStencilPixelFormatGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self depthStencilPixelFormat]));
  }
}

NAN_SETTER(NMTKView::depthStencilPixelFormatSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPixelFormat, input);
    [self setDepthStencilPixelFormat: input];
  }
}

NAN_GETTER(NMTKView::sampleCountGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self sampleCount]));
  }
}

NAN_SETTER(NMTKView::sampleCountSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSampleCount: input];
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_GETTER(NMTKView::clearColorGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLClearColor([self clearColor]));
  }
}

NAN_SETTER(NMTKView::clearColorSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLClearColor, input);
    [self setClearColor: input];
  }
}

NAN_GETTER(NMTKView::clearDepthGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self clearDepth]));
  }
}

NAN_SETTER(NMTKView::clearDepthSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(double, input);
    [self setClearDepth: input];
  }
}

NAN_GETTER(NMTKView::clearStencilGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self clearStencil]));
  }
}

NAN_SETTER(NMTKView::clearStencilSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(uint32_t, input);
    [self setClearStencil: input];
  }
}

#include "NMTLTexture.h"

NAN_GETTER(NMTKView::depthStencilTextureGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTexture([self depthStencilTexture]));
  }
}

NAN_GETTER(NMTKView::multisampleColorTextureGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTexture([self multisampleColorTexture]));
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_GETTER(NMTKView::currentRenderPassDescriptorGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLRenderPassDescriptor([self currentRenderPassDescriptor]));
  }
}

NAN_GETTER(NMTKView::preferredFramesPerSecondGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self preferredFramesPerSecond]));
  }
}

NAN_SETTER(NMTKView::preferredFramesPerSecondSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setPreferredFramesPerSecond: input];
  }
}

NAN_GETTER(NMTKView::enableSetNeedsDisplayGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self enableSetNeedsDisplay]));
  }
}

NAN_SETTER(NMTKView::enableSetNeedsDisplaySetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnableSetNeedsDisplay: input];
  }
}

NAN_GETTER(NMTKView::autoResizeDrawableGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self autoResizeDrawable]));
  }
}

NAN_SETTER(NMTKView::autoResizeDrawableSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutoResizeDrawable: input];
  }
}

NAN_GETTER(NMTKView::drawableSizeGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self drawableSize]));
  }
}

NAN_SETTER(NMTKView::drawableSizeSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setDrawableSize: input];
  }
}

NAN_GETTER(NMTKView::isPausedGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_SETTER(NMTKView::isPausedSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPaused: input];
  }
}

#if !TARGET_OS_IPHONE
NAN_GETTER(NMTKView::colorspaceGetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorSpaceRef([self colorspace]));
  }
}

NAN_SETTER(NMTKView::colorspaceSetter) {
  JS_UNWRAP(MTKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGColorSpaceRef, input);
    [self setColorspace: input];
  }
}
#endif
