//
//  NSKRenderer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKRenderer.h"

#import <SpriteKit/SKRenderer.h>

#define instancetype SKRenderer
#define js_value_instancetype js_value_SKRenderer

NSKRenderer::NSKRenderer() {}
NSKRenderer::~NSKRenderer() {}

JS_INIT_CLASS(SKRenderer, NSObject);
  JS_ASSIGN_STATIC_METHOD(rendererWithDevice);
  JS_ASSIGN_PROTO_METHOD(renderWithViewportCommandBufferRenderPassDescriptor);
  JS_ASSIGN_PROTO_METHOD(renderWithViewportRenderCommandEncoderRenderPassDescriptorCommandQueue);
  JS_ASSIGN_PROTO_METHOD(updateAtTime);
  JS_ASSIGN_PROTO_PROP(scene);
  JS_ASSIGN_PROTO_PROP(ignoresSiblingOrder);
  JS_ASSIGN_PROTO_PROP(shouldCullNonVisibleNodes);
  JS_ASSIGN_PROTO_PROP(showsDrawCount);
  JS_ASSIGN_PROTO_PROP(showsNodeCount);
  JS_ASSIGN_PROTO_PROP(showsQuadCount);
  JS_ASSIGN_PROTO_PROP(showsPhysics);
  JS_ASSIGN_PROTO_PROP(showsFields);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKRenderer, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SKRenderer, NSObject);

NAN_METHOD(NSKRenderer::New) {
  JS_RECONSTRUCT(SKRenderer);
  @autoreleasepool {
    SKRenderer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKRenderer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKRenderer alloc] init];
    }
    if (self) {
      NSKRenderer *wrapper = new NSKRenderer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKRenderer::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSKRenderer::rendererWithDevice) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MTLDevice>*/, device);
    JS_SET_RETURN(js_value_SKRenderer([SKRenderer rendererWithDevice: device]));
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_METHOD(NSKRenderer::renderWithViewportCommandBufferRenderPassDescriptor) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, viewport);
    declare_value(id/* <MTLCommandBuffer>*/, commandBuffer);
    declare_pointer(MTLRenderPassDescriptor, renderPassDescriptor);
    [self renderWithViewport: viewport commandBuffer: commandBuffer renderPassDescriptor: renderPassDescriptor];
  }
}

NAN_METHOD(NSKRenderer::renderWithViewportRenderCommandEncoderRenderPassDescriptorCommandQueue) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, viewport);
    declare_value(id/* <MTLRenderCommandEncoder>*/, renderCommandEncoder);
    declare_pointer(MTLRenderPassDescriptor, renderPassDescriptor);
    declare_value(id/* <MTLCommandQueue>*/, commandQueue);
    [self renderWithViewport: viewport renderCommandEncoder: renderCommandEncoder renderPassDescriptor: renderPassDescriptor commandQueue: commandQueue];
  }
}

NAN_METHOD(NSKRenderer::updateAtTime) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, currentTime);
    [self updateAtTime: currentTime];
  }
}

#include "NSKScene.h"

NAN_GETTER(NSKRenderer::sceneGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKScene([self scene]));
  }
}

NAN_SETTER(NSKRenderer::sceneSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SKScene, input);
    [self setScene: input];
  }
}

NAN_GETTER(NSKRenderer::ignoresSiblingOrderGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self ignoresSiblingOrder]));
  }
}

NAN_SETTER(NSKRenderer::ignoresSiblingOrderSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setIgnoresSiblingOrder: input];
  }
}

NAN_GETTER(NSKRenderer::shouldCullNonVisibleNodesGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldCullNonVisibleNodes]));
  }
}

NAN_SETTER(NSKRenderer::shouldCullNonVisibleNodesSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldCullNonVisibleNodes: input];
  }
}

NAN_GETTER(NSKRenderer::showsDrawCountGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsDrawCount]));
  }
}

NAN_SETTER(NSKRenderer::showsDrawCountSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsDrawCount: input];
  }
}

NAN_GETTER(NSKRenderer::showsNodeCountGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsNodeCount]));
  }
}

NAN_SETTER(NSKRenderer::showsNodeCountSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsNodeCount: input];
  }
}

NAN_GETTER(NSKRenderer::showsQuadCountGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsQuadCount]));
  }
}

NAN_SETTER(NSKRenderer::showsQuadCountSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsQuadCount: input];
  }
}

NAN_GETTER(NSKRenderer::showsPhysicsGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsPhysics]));
  }
}

NAN_SETTER(NSKRenderer::showsPhysicsSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsPhysics: input];
  }
}

NAN_GETTER(NSKRenderer::showsFieldsGetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsFields]));
  }
}

NAN_SETTER(NSKRenderer::showsFieldsSetter) {
  JS_UNWRAP(SKRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsFields: input];
  }
}

