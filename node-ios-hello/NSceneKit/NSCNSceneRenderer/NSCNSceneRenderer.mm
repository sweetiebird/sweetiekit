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
  JS_ASSIGN_PROTO_PROP(presentSceneWithTransitionIncomingPointOfViewCompletionHandler);
  JS_ASSIGN_PROTO_PROP(hitTestOptions);
  JS_ASSIGN_PROTO_PROP(isNodeInsideFrustumWithPointOfView);
  JS_ASSIGN_PROTO_PROP(nodesInsideFrustumWithPointOfView);
  JS_ASSIGN_PROTO_PROP(projectPoint);
  JS_ASSIGN_PROTO_PROP(unprojectPoint);
  JS_ASSIGN_PROTO_PROP(prepareObjectShouldAbortBlock);
  JS_ASSIGN_PROTO_PROP(prepareObjectsWithCompletionHandler);
  JS_ASSIGN_PROTO_PROP(scene);
  JS_ASSIGN_PROTO_PROP(sceneTime);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(isPlaying);
  JS_ASSIGN_PROTO_PROP(loops);
  JS_ASSIGN_PROTO_PROP(pointOfView);
  JS_ASSIGN_PROTO_PROP(autoenablesDefaultLighting);
  JS_ASSIGN_PROTO_PROP(isJitteringEnabled);
  JS_ASSIGN_PROTO_PROP(showsStatistics);
  JS_ASSIGN_PROTO_PROP(debugOptions);
  JS_ASSIGN_PROTO_PROP(overlaySKScene);
  JS_ASSIGN_PROTO_PROP_READONLY(renderingAPI);
#if SCN_ENABLE_OPENGL
  JS_ASSIGN_PROTO_PROP_READONLY(context);
#endif
#if SCN_ENABLE_METAL
  JS_ASSIGN_PROTO_PROP_READONLY(currentRenderCommandEncoder);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP_READONLY(colorPixelFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(depthPixelFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(stencilPixelFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(commandQueue);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(audioEngine);
  JS_ASSIGN_PROTO_PROP_READONLY(audioEnvironmentNode);
  JS_ASSIGN_PROTO_PROP(audioListener);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNSceneRenderer, NSObject);
  // constant values (exports)

  /*!
   @enum SCNAntialiasingMode
   @abstract antialiasing modes for scene renderers
   */
  //typedef NS_ENUM(NSUInteger, SCNAntialiasingMode) {
    JS_ASSIGN_ENUM(SCNAntialiasingModeNone, NSUInteger);
    JS_ASSIGN_ENUM(SCNAntialiasingModeMultisampling2X, NSUInteger);
    JS_ASSIGN_ENUM(SCNAntialiasingModeMultisampling4X, NSUInteger);
  //} API_AVAILABLE(macos(10.10));

  /*!
   @enum SCNRenderingAPI
   @abstract rendering API used by SCNView and SCNRenderer.
   @discussion Default preferred API is SCNRenderingAPIMetal on iOS and it depends on the configuration on macOS.
   If Metal is requested but not available then it fallbacks to SCNRenderingAPIOpenGLES2 on iOS and to SCNRenderingAPIOpenGLLegacy on macOS.
   */
  //typedef NS_ENUM(NSUInteger, SCNRenderingAPI) {
    JS_ASSIGN_ENUM(SCNRenderingAPIMetal, NSUInteger);
#ifdef __IPHONEOS__
    JS_ASSIGN_ENUM(SCNRenderingAPIOpenGLES2, NSUInteger);
#endif
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
  JS_RECONSTRUCT_PROTOCOL(SCNSceneRenderer);
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

#include "NSCNScene.h"

NAN_GETTER(NSCNSceneRenderer::sceneGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNScene([self scene]));
  }
}

NAN_SETTER(NSCNSceneRenderer::sceneSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNScene, input);
    [self setScene: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::sceneTimeGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self sceneTime]));
  }
}

NAN_SETTER(NSCNSceneRenderer::sceneTimeSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setSceneTime: input];
  }
}

#include "NSCNSceneRendererDelegate.h"

NAN_GETTER(NSCNSceneRenderer::delegateGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNSceneRendererDelegate([self delegate]));
  }
}

NAN_SETTER(NSCNSceneRenderer::delegateSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(SCNSceneRendererDelegate, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::isPlayingGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPlaying]));
  }
}

NAN_SETTER(NSCNSceneRenderer::isPlayingSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPlaying: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::loopsGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self loops]));
  }
}

NAN_SETTER(NSCNSceneRenderer::loopsSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLoops: input];
  }
}

#include "NSCNNode.h"

NAN_GETTER(NSCNSceneRenderer::pointOfViewGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self pointOfView]));
  }
}

NAN_SETTER(NSCNSceneRenderer::pointOfViewSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNNode, input);
    [self setPointOfView: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::autoenablesDefaultLightingGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self autoenablesDefaultLighting]));
  }
}

NAN_SETTER(NSCNSceneRenderer::autoenablesDefaultLightingSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutoenablesDefaultLighting: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::isJitteringEnabledGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isJitteringEnabled]));
  }
}

NAN_SETTER(NSCNSceneRenderer::isJitteringEnabledSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setJitteringEnabled: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::showsStatisticsGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsStatistics]));
  }
}

NAN_SETTER(NSCNSceneRenderer::showsStatisticsSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsStatistics: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::debugOptionsGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNDebugOptions([self debugOptions]));
  }
}

NAN_SETTER(NSCNSceneRenderer::debugOptionsSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNDebugOptions, input);
    [self setDebugOptions: input];
  }
}

#include "NSKScene.h"

NAN_GETTER(NSCNSceneRenderer::overlaySKSceneGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKScene([self overlaySKScene]));
  }
}

NAN_SETTER(NSCNSceneRenderer::overlaySKSceneSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SKScene, input);
    [self setOverlaySKScene: input];
  }
}

NAN_GETTER(NSCNSceneRenderer::renderingAPIGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNRenderingAPI([self renderingAPI]));
  }
}

#if SCN_ENABLE_OPENGL
NAN_GETTER(NSCNSceneRenderer::contextGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_void_pointer([self context]));
  }
}
#endif

#if SCN_ENABLE_METAL

#include "NMTLRenderCommandEncoder.h"

NAN_GETTER(NSCNSceneRenderer::currentRenderCommandEncoderGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLRenderCommandEncoder([self currentRenderCommandEncoder]));
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NSCNSceneRenderer::deviceGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

#include "NMTLPixelFormat.h"

NAN_GETTER(NSCNSceneRenderer::colorPixelFormatGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self colorPixelFormat]));
  }
}

NAN_GETTER(NSCNSceneRenderer::depthPixelFormatGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self depthPixelFormat]));
  }
}

NAN_GETTER(NSCNSceneRenderer::stencilPixelFormatGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self stencilPixelFormat]));
  }
}

#include "NMTLCommandQueue.h"

NAN_GETTER(NSCNSceneRenderer::commandQueueGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCommandQueue([self commandQueue]));
  }
}
#endif // #if SCN_ENABLE_METAL

#include "NAVAudioEngine.h"

NAN_GETTER(NSCNSceneRenderer::audioEngineGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioEngine([self audioEngine]));
  }
}

#include "NAVAudioEnvironmentNode.h"

NAN_GETTER(NSCNSceneRenderer::audioEnvironmentNodeGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioEnvironmentNode([self audioEnvironmentNode]));
  }
}

NAN_GETTER(NSCNSceneRenderer::audioListenerGetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self audioListener]));
  }
}

NAN_SETTER(NSCNSceneRenderer::audioListenerSetter) {
  JS_UNWRAP_PROTOCOL(SCNSceneRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNNode, input);
    [self setAudioListener: input];
  }
}


DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, presentSceneWithTransitionIncomingPointOfViewCompletionHandler);
DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, hitTestOptions);
DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, isNodeInsideFrustumWithPointOfView);
DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, nodesInsideFrustumWithPointOfView);
DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, projectPoint);
DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, unprojectPoint);
DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, prepareObjectShouldAbortBlock);
DELEGATE_PROTOCOL_PROP(SCNSceneRenderer, prepareObjectsWithCompletionHandler);

#include "NSKTransition.h"

@implementation SCNSceneRendererType

/*!
 @method presentScene:withTransition:incomingPointOfView:
 @abstract Present a SCNScene in the receiver, replacing the current scene.
 @param scene The new scene to present.
 @param transition the transition to use when presenting the scene.
 @param pointOfView the point of view to use to render the new scene.
 @param completionHandler the block invoked on completion.
 */
- (void)presentScene:(SCNScene *_Nonnull)scene withTransition:(SKTransition *_Nonnull)transition incomingPointOfView:(nullable SCNNode *)pointOfView completionHandler:(nullable void (^)(void))completionHandler API_AVAILABLE(macos(10.11), ios(9.0))
{
  dispatch_main(^{
    Local<Value> completionHandlerCallback(sweetiekit::FromBlock("presentSceneWithTransitionIncomingPointOfViewCompletionHandler::completionHandler", ^(JSInfo info) {
      if (completionHandler) {
        completionHandler();
      }
    }));
    call_delegate(noop(), presentSceneWithTransitionIncomingPointOfViewCompletionHandler,
      js_value_SCNScene(scene),
      js_value_SKTransition(transition),
      js_value_SCNNode(pointOfView),
      completionHandlerCallback);
  });
}

/*!
 @method hitTest:options:
 @abstract Returns an array of SCNHitTestResult for each node that contains a specified point.
 @param point A point in the coordinate system of the receiver.
 @param options Optional parameters (see the "Hit test options" group for the available options).
 */
- (NSArray<SCNHitTestResult *> *_Nonnull)hitTest:(CGPoint)point options:(nullable NSDictionary<SCNHitTestOption, id> *)options
{
  __block NSArray<SCNHitTestResult *> *_Nonnull result = @[];
  call_delegate(result = is_value_NSArray<SCNHitTestResult *>(JS_RESULT) ? to_value_NSArray<SCNHitTestResult *>(JS_RESULT) : result, hitTestOptions,
    js_value_CGPoint(point),
    js_value_NSDictionary/* <SCNHitTestOption, id>*/(options));
  return result;
}

/*!
 @method isNodeInsideFrustum:withPointOfView:
 @abstract Test whether node is visible from the specified point of view.
 @param node The node to test the visibility of.
 @param pointOfView The point of view used to test the visibility.
 @discussion Return YES if the node is inside or intersects the clipping planes of the point of view. This method doesn't test if 'node' is occluded by another node.
 */
- (BOOL)isNodeInsideFrustum:(SCNNode *_Nonnull)node withPointOfView:(SCNNode *_Nonnull)pointOfView API_AVAILABLE(macos(10.9))
{
  __block BOOL result = YES;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, isNodeInsideFrustumWithPointOfView,
    js_value_SCNNode(node),
    js_value_SCNNode(pointOfView));
  return result;
}

/*!
 @method nodesInsideFrustumWithPointOfView:
 @abstract Returns an array containing the nodes visible from the specified point of view.
 @param pointOfView The point of view used to test the visibility.
 @discussion Returns an array of all the nodes that are inside or intersects the clipping planes of the point of view. Starting in macOS10.13/iOS11 this method work with the presentation tree.
 */
- (NSArray<SCNNode *> *_Nonnull)nodesInsideFrustumWithPointOfView:(SCNNode *_Nonnull)pointOfView API_AVAILABLE(macos(10.11), ios(9.0))
{
  __block NSArray<SCNNode *> *_Nonnull result = @[];
  call_delegate(result = is_value_NSArray<SCNNode *>(JS_RESULT) ? to_value_NSArray<SCNNode *>(JS_RESULT) : result, nodesInsideFrustumWithPointOfView,
    js_value_SCNNode(pointOfView));
  return result;
}

/*!
 @method projectPoint
 @abstract Projects a point in the world coordinate system using the receiver's current point of view and viewport.
 @param point The world position to be projected.
 @discussion A point projected from the near (resp. far) clip plane will have a z component of 0 (resp. 1).
 */
- (SCNVector3)projectPoint:(SCNVector3)point API_AVAILABLE(macos(10.9))
{
  __block SCNVector3 result(SCNVector3Zero);
  call_delegate(result = is_value_SCNVector3(JS_RESULT) ? to_value_SCNVector3(JS_RESULT) : result, projectPoint,
    js_value_SCNVector3(point));
  return result;
}

/*!
 @method unprojectPoint
 @abstract Unprojects a screenspace 2D point with depth info using the receiver's current point of view and viewport.
 @param point The screenspace position to be unprojected.
 @discussion A point whose z component is 0 (resp. 1) is unprojected on the near (resp. far) clip plane.
 */
- (SCNVector3)unprojectPoint:(SCNVector3)point API_AVAILABLE(macos(10.9))
{
  __block SCNVector3 result(SCNVector3Zero);
  call_delegate(result = is_value_SCNVector3(JS_RESULT) ? to_value_SCNVector3(JS_RESULT) : result, unprojectPoint,
    js_value_SCNVector3(point));
  return result;
}

/*!
 @method prepareObject:shouldAbortBlock:
 @abstract Prepare the specified object for drawing.
 @param object The object to prepare. It can be an instance of SCNScene, SCNNode, SCNGeometry, or SCNMaterial
 @param block This block will be called repeatedly while the object is prepared. Return YES if you want the operation to abort.
 @discussion Returns YES if the object was prepared successfully, NO if it was canceled. This method may be triggered from a secondary thread. This method is observable using NSProgress.
 */
- (BOOL)prepareObject:(id _Nonnull)object shouldAbortBlock:(nullable NS_NOESCAPE BOOL (^)(void))block API_AVAILABLE(macos(10.9))
{
  __block BOOL result = YES;
  dispatch_main(^{
    Local<Value> blockCallback(sweetiekit::FromBlock("prepareObjectShouldAbortBlock::block", ^(JSInfo info) {
      __block BOOL result = NO;
      if (block) {
        result = block();
      }
      JS_SET_RETURN(js_value_BOOL(result));
    }));
    call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, prepareObjectShouldAbortBlock,
      js_value_id(object),
      blockCallback);
  });
  return result;
}

/*!
 @method prepareObjects:withCompletionHandler:
 @abstract Prepare the specified objects for drawing on the background.
 @param objects The objects to prepare. It can be one or more instances of SCNScene, SCNNode, SCNGeometry, or SCNMaterial
 @param completionHandler This block will be called when all objects has been prepared, or on failure.
 @discussion This method is observable using NSProgress.
 */
- (void)prepareObjects:(NSArray *_Nonnull)objects withCompletionHandler:(nullable void (^)(BOOL success))completionHandler API_AVAILABLE(macos(10.10))
{
  dispatch_main(^{
    Local<Value> completionHandlerCallback(sweetiekit::FromBlock("prepareObjectsWithCompletionHandler::completionHandler", ^(JSInfo info) {
      if (completionHandler) {
        declare_args();
        declare_value(BOOL, success);
        completionHandler(success);
      }
    }));
    call_delegate(noop(), prepareObjectsWithCompletionHandler,
      js_value_NSArray(objects),
      completionHandlerCallback);
  });
}

@end


