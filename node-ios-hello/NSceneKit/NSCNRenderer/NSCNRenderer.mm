//
//  NSCNRenderer.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNRenderer.h"

#define instancetype SCNRenderer
#define js_value_instancetype js_value_SCNRenderer

NSCNRenderer::NSCNRenderer() {}
NSCNRenderer::~NSCNRenderer() {}

JS_INIT_CLASS(SCNRenderer, SCNSceneRenderer);
#if __IPHONEOS__
  JS_ASSIGN_STATIC_METHOD(rendererWithContextOptions);
#endif
  JS_ASSIGN_STATIC_METHOD(rendererWithDeviceOptions);
  JS_ASSIGN_PROTO_METHOD(renderAtTimeViewportCommandBufferPassDescriptor);
  JS_ASSIGN_PROTO_METHOD(renderAtTime);
  JS_ASSIGN_PROTO_METHOD(updateAtTime);
  JS_ASSIGN_PROTO_METHOD(renderWithViewportCommandBufferPassDescriptor);
  JS_ASSIGN_PROTO_METHOD(snapshotAtTimeWithSizeAntialiasingMode);
  JS_ASSIGN_PROTO_METHOD(updateProbesAtTime);
#ifdef __IPHONEOS__
  JS_ASSIGN_PROTO_METHOD(render);
#endif
  JS_ASSIGN_PROTO_PROP(scene);
  JS_ASSIGN_PROTO_PROP_READONLY(nextFrameTime);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNRenderer, SCNSceneRenderer);
  // constant values (exports)
JS_INIT_CLASS_END(SCNRenderer, SCNSceneRenderer);

NAN_METHOD(NSCNRenderer::New) {
  JS_RECONSTRUCT(SCNRenderer);
  @autoreleasepool {
    SCNRenderer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNRenderer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNRenderer alloc] init];
    }
    if (self) {
      NSCNRenderer *wrapper = new NSCNRenderer();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNRenderer::New: invalid arguments");
    }
  }
}

#include "NEAGLContext.h"

#if __IPHONEOS__
NAN_METHOD(NSCNRenderer::rendererWithContextOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(EAGLContext, context);
    declare_nullable_pointer(NSDictionary, options);
    JS_SET_RETURN(js_value_instancetype([SCNRenderer rendererWithContext: context options: options]));
  }
}
#endif

#include "NMTLDevice.h"

NAN_METHOD(NSCNRenderer::rendererWithDeviceOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLDevice, device);
    declare_nullable_pointer(NSDictionary, options);
    JS_SET_RETURN(js_value_instancetype([SCNRenderer rendererWithDevice: device options: options]));
  }
}

#include "NMTLCommandBuffer.h"
#include "NMTLRenderPassDescriptor.h"

NAN_METHOD(NSCNRenderer::renderAtTimeViewportCommandBufferPassDescriptor) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, time);
    declare_value(CGRect, viewport);
    declare_protocol(MTLCommandBuffer, commandBuffer);
    declare_pointer(MTLRenderPassDescriptor, renderPassDescriptor);
    [self renderAtTime: time viewport: viewport commandBuffer: commandBuffer passDescriptor: renderPassDescriptor];
  }
}

NAN_METHOD(NSCNRenderer::renderAtTime) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, time);
    [self renderAtTime: time];
  }
}

NAN_METHOD(NSCNRenderer::updateAtTime) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, time);
    [self updateAtTime: time];
  }
}

NAN_METHOD(NSCNRenderer::renderWithViewportCommandBufferPassDescriptor) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, viewport);
    declare_protocol(MTLCommandBuffer, commandBuffer);
    declare_pointer(MTLRenderPassDescriptor, renderPassDescriptor);
    [self renderWithViewport: viewport commandBuffer: commandBuffer passDescriptor: renderPassDescriptor];
  }
}

#include "NUIImage.h"
#include "NSCNSceneRenderer.h"

NAN_METHOD(NSCNRenderer::snapshotAtTimeWithSizeAntialiasingMode) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, time);
    declare_value(CGSize, size);
    declare_value(SCNAntialiasingMode, antialiasingMode);
    JS_SET_RETURN(js_value_UIImage([self snapshotAtTime: time withSize: size antialiasingMode: antialiasingMode]));
  }
}

NAN_METHOD(NSCNRenderer::updateProbesAtTime) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SCNNode*>, lightProbes);
    declare_value(CFTimeInterval, time);
    [self updateProbes: lightProbes atTime: time];
  }
}

#if __IPHONEOS__
NAN_METHOD(NSCNRenderer::render) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    [self render];
  }
}
#endif

#include "NSCNScene.h"

NAN_GETTER(NSCNRenderer::sceneGetter) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNScene([self scene]));
  }
}

NAN_SETTER(NSCNRenderer::sceneSetter) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNScene, input);
    [self setScene: input];
  }
}

NAN_GETTER(NSCNRenderer::nextFrameTimeGetter) {
  JS_UNWRAP(SCNRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self nextFrameTime]));
  }
}

