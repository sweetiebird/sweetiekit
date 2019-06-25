//
//  NSCNSceneRenderer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNSceneRenderer.h"

#define instancetype SCNSceneRenderer
#define js_value_instancetype js_value_SCNSceneRenderer

NSCNSceneRenderer::NSCNSceneRenderer() {}
NSCNSceneRenderer::~NSCNSceneRenderer() {}

JS_INIT_PROTOCOL(SCNSceneRenderer, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNSceneRenderer, NSObject);
  // constant values (exports)

  /*!
   @enum SCNAntialiasingMode
   @abstract antialiasing modes for scene renderers
   */
  //typedef NS_ENUM(NSUInteger, SCNAntialiasingMode) {
    JS_ASSIGN_ENUM(SCNAntialiasingModeNone, NSUInteger); //,
    JS_ASSIGN_ENUM(SCNAntialiasingModeMultisampling2X, NSUInteger); //,
    JS_ASSIGN_ENUM(SCNAntialiasingModeMultisampling4X, NSUInteger); //
  //} API_AVAILABLE(macos(10.10));

  /*!
   @enum SCNRenderingAPI
   @abstract rendering API used by SCNView and SCNRenderer.
   @discussion Default preferred API is SCNRenderingAPIMetal on iOS and it depends on the configuration on macOS.
   If Metal is requested but not available then it fallbacks to SCNRenderingAPIOpenGLES2 on iOS and to SCNRenderingAPIOpenGLLegacy on macOS.
   */
  //typedef NS_ENUM(NSUInteger, SCNRenderingAPI) {
    JS_ASSIGN_ENUM(SCNRenderingAPIMetal, NSUInteger); //,
    JS_ASSIGN_ENUM(SCNRenderingAPIOpenGLES2, NSUInteger); //
  //} API_AVAILABLE(macos(10.11), ios(9.0));

  /*!
   @enum SCNDebugOptions
   @abstract Debug options.
   */
  //typedef NS_OPTIONS(NSUInteger, SCNDebugOptions) {
    JS_ASSIGN_ENUM(SCNDebugOptionNone, NSUInteger); //                                                                               = 0,
    JS_ASSIGN_ENUM(SCNDebugOptionShowPhysicsShapes, NSUInteger); //                                                                  = 1 << 0, //show physics shape
    JS_ASSIGN_ENUM(SCNDebugOptionShowBoundingBoxes, NSUInteger); //                                                                  = 1 << 1, //show object bounding boxes
    JS_ASSIGN_ENUM(SCNDebugOptionShowLightInfluences, NSUInteger); //                                                                = 1 << 2, //show objects's light influences
    JS_ASSIGN_ENUM(SCNDebugOptionShowLightExtents, NSUInteger); //                                                                   = 1 << 3, //show light extents
    JS_ASSIGN_ENUM(SCNDebugOptionShowPhysicsFields, NSUInteger); //                                                                  = 1 << 4, //show SCNPhysicsFields forces and extents
    JS_ASSIGN_ENUM(SCNDebugOptionShowWireframe, NSUInteger); //                                                                      = 1 << 5, //show wireframe on top of objects
    JS_ASSIGN_ENUM(SCNDebugOptionRenderAsWireframe, NSUInteger); // API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0)) = 1 << 6, //render objects as wireframe
    JS_ASSIGN_ENUM(SCNDebugOptionShowSkeletons, NSUInteger); //     API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0)) = 1 << 7, //show skinning bones
    JS_ASSIGN_ENUM(SCNDebugOptionShowCreases, NSUInteger); //       API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0)) = 1 << 8, //show subdivision creases
    JS_ASSIGN_ENUM(SCNDebugOptionShowConstraints, NSUInteger); //   API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0)) = 1 << 9, //show slider constraint
    JS_ASSIGN_ENUM(SCNDebugOptionShowCameras, NSUInteger); //       API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0)) = 1 << 10, //show cameras
  //} API_AVAILABLE(macos(10.11), ios(9.0));

JS_INIT_PROTOCOL_END(SCNSceneRenderer, NSObject);

NAN_METHOD(NSCNSceneRenderer::New) {
  JS_RECONSTRUCT(SCNSceneRenderer);
  @autoreleasepool {
    id<SCNSceneRenderer> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<SCNSceneRenderer>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<SCNSceneRenderer> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], SCNSceneRenderer, value);
      self = value;
    }
    if (self) {
      NSCNSceneRenderer *wrapper = new NSCNSceneRenderer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNSceneRenderer::New: invalid arguments");
    }
  }
}
