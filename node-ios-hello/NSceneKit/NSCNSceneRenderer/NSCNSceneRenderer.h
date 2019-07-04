//
//  NSCNSceneRenderer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNSceneRenderer_h
#define NSCNSceneRenderer_h    

#include "NNSObject.h"

#define js_value_SCNSceneRenderer(x) js_value_wrapper(x, SCNSceneRenderer)
#define to_value_SCNSceneRenderer(x) to_value_wrapper(x, SCNSceneRenderer)
#define is_value_SCNSceneRenderer(x) is_value_wrapper(x, SCNSceneRenderer)

#define js_value_SCNAntialiasingMode(x) JS_ENUM(SCNAntialiasingMode, NSUInteger, x)
#define to_value_SCNAntialiasingMode(x) TO_ENUM(SCNAntialiasingMode, NSUInteger, x)
#define is_value_SCNAntialiasingMode(x) IS_ENUM(SCNAntialiasingMode, NSUInteger, x)

#define js_value_SCNRenderingAPI(x) JS_ENUM(SCNRenderingAPI, NSUInteger, x)
#define to_value_SCNRenderingAPI(x) TO_ENUM(SCNRenderingAPI, NSUInteger, x)
#define is_value_SCNRenderingAPI(x) IS_ENUM(SCNRenderingAPI, NSUInteger, x)

#define js_value_SCNDebugOptions(x) JS_OPTS(SCNDebugOptions, NSUInteger, x)
#define to_value_SCNDebugOptions(x) TO_OPTS(SCNDebugOptions, NSUInteger, x)
#define is_value_SCNDebugOptions(x) IS_OPTS(SCNDebugOptions, NSUInteger, x)

JS_WRAP_PROTOCOL(SCNSceneRenderer, NSObject);
  JS_PROP(presentSceneWithTransitionIncomingPointOfViewCompletionHandler);
  JS_PROP(hitTestOptions);
  JS_PROP(isNodeInsideFrustumWithPointOfView);
  JS_PROP(nodesInsideFrustumWithPointOfView);
  JS_PROP(projectPoint);
  JS_PROP(unprojectPoint);
  JS_PROP(prepareObjectsWithCompletionHandler);
  JS_PROP(scene);
  JS_PROP(sceneTime);
  JS_PROP(delegate);
  JS_PROP(isPlaying);
  JS_PROP(loops);
  JS_PROP(pointOfView);
  JS_PROP(autoenablesDefaultLighting);
  JS_PROP(isJitteringEnabled);
  JS_PROP(showsStatistics);
  JS_PROP(debugOptions);
  JS_PROP(overlaySKScene);
  JS_PROP_READONLY(renderingAPI);
  JS_PROP_READONLY(context);
  JS_PROP_READONLY(currentRenderCommandEncoder);
  JS_PROP_READONLY(device);
  JS_PROP_READONLY(colorPixelFormat);
  JS_PROP_READONLY(depthPixelFormat);
  JS_PROP_READONLY(stencilPixelFormat);
  JS_PROP_READONLY(commandQueue);
  JS_PROP_READONLY(audioEngine);
  JS_PROP_READONLY(audioEnvironmentNode);
  JS_PROP(audioListener);
JS_WRAP_PROTOCOL_END(SCNSceneRenderer, NSObject);

#if __OBJC__
@interface SCNSceneRendererType : NSObject<SCNSceneRenderer>

/*!
 @property scene
 @abstract Specifies the scene of the receiver.
 */
@property(nonatomic, retain, nullable) SCNScene *scene;

/*!
 @method presentScene:withTransition:incomingPointOfView:
 @abstract Present a SCNScene in the receiver, replacing the current scene.
 @param scene The new scene to present.
 @param transition the transition to use when presenting the scene.
 @param pointOfView the point of view to use to render the new scene.
 @param completionHandler the block invoked on completion.
 */
- (void)presentScene:(SCNScene *_Nonnull)scene withTransition:(SKTransition *_Nonnull)transition incomingPointOfView:(nullable SCNNode *)pointOfView completionHandler:(nullable void (^)(void))completionHandler API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property sceneTime
 @abstract Specifies the current "scene time" to display the scene.
 @discussion The scene time only affect scene time based animations (see SCNAnimation.h "usesSceneTimeBase" and SCNSceneSource.h "SCNSceneSourceAnimationImportPolicyKey" for how to create scene time based animations). Scene time based animations and this property are typically used by tools and viewer to ease seeking in time while previewing a scene.
 */
@property(nonatomic) NSTimeInterval sceneTime API_AVAILABLE(macos(10.10));

/*! 
 @property delegate
 @abstract Specifies the renderer delegate.
 */
@property(nonatomic, weak, nullable) id <SCNSceneRendererDelegate> delegate;

/*!
 @method hitTest:options:
 @abstract Returns an array of SCNHitTestResult for each node that contains a specified point.
 @param point A point in the coordinate system of the receiver.
 @param options Optional parameters (see the "Hit test options" group for the available options).
 */
- (NSArray<SCNHitTestResult *> *_Nonnull)hitTest:(CGPoint)point options:(nullable NSDictionary<SCNHitTestOption, id> *)options;

/*!
 @method isNodeInsideFrustum:withPointOfView:
 @abstract Test whether node is visible from the specified point of view.
 @param node The node to test the visibility of.
 @param pointOfView The point of view used to test the visibility.
 @discussion Return YES if the node is inside or intersects the clipping planes of the point of view. This method doesn't test if 'node' is occluded by another node.
 */
- (BOOL)isNodeInsideFrustum:(SCNNode *_Nonnull)node withPointOfView:(SCNNode *_Nonnull)pointOfView API_AVAILABLE(macos(10.9));

/*!
 @method nodesInsideFrustumWithPointOfView:
 @abstract Returns an array containing the nodes visible from the specified point of view.
 @param pointOfView The point of view used to test the visibility.
 @discussion Returns an array of all the nodes that are inside or intersects the clipping planes of the point of view. Starting in macOS10.13/iOS11 this method work with the presentation tree.
 */
- (NSArray<SCNNode *> *_Nonnull)nodesInsideFrustumWithPointOfView:(SCNNode *_Nonnull)pointOfView API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @method projectPoint
 @abstract Projects a point in the world coordinate system using the receiver's current point of view and viewport.
 @param point The world position to be projected.
 @discussion A point projected from the near (resp. far) clip plane will have a z component of 0 (resp. 1).
 */
- (SCNVector3)projectPoint:(SCNVector3)point API_AVAILABLE(macos(10.9));

/*!
 @method unprojectPoint
 @abstract Unprojects a screenspace 2D point with depth info using the receiver's current point of view and viewport.
 @param point The screenspace position to be unprojected.
 @discussion A point whose z component is 0 (resp. 1) is unprojected on the near (resp. far) clip plane.
 */
- (SCNVector3)unprojectPoint:(SCNVector3)point API_AVAILABLE(macos(10.9));

/*! 
 @property playing
 @abstract Returns YES if the scene is playing, NO otherwise.
 */
@property(getter=isPlaying) BOOL playing;

/*! 
 @property loops
 @abstract Indicates whether the receiver restarts playback when it reaches the end of its content. Default: YES.
 @discussion YES when the receiver restarts playback when it finishes, NO otherwise.
 */
@property(nonatomic) BOOL loops;

/*! 
 @property pointOfView
 @abstract Specifies the point of view used to render the scene. 
 @discussion A point of view must have either a camera or a spot light attached.
 */
@property(nonatomic, retain, nullable) SCNNode *pointOfView;

/*! 
 @property autoenablesDefaultLighting
 @abstract Specifies whether the receiver should automatically light up scenes that have no light source. The default is NO.
 @discussion When enabled, a diffuse light is automatically added and placed while rendering scenes that have no light or only ambient lights.
 */
@property(nonatomic) BOOL autoenablesDefaultLighting;

/*! 
 @property jitteringEnabled
 @abstract Specifies whether the receiver should jitter the rendered scene to reduce aliasing artifacts. 
 @discussion When enabled, the jittering is performed asynchronously and automatically by SCNView and SCNLayer. It is done synchronously by SCNRenderer.
 */
@property(nonatomic, getter=isJitteringEnabled) BOOL jitteringEnabled;

/*!
 @method prepareObject:shouldAbortBlock:
 @abstract Prepare the specified object for drawing.
 @param object The object to prepare. It can be an instance of SCNScene, SCNNode, SCNGeometry, or SCNMaterial
 @param block This block will be called repeatedly while the object is prepared. Return YES if you want the operation to abort.
 @discussion Returns YES if the object was prepared successfully, NO if it was canceled. This method may be triggered from a secondary thread. This method is observable using NSProgress.
 */
- (BOOL)prepareObject:(id _Nonnull)object shouldAbortBlock:(nullable NS_NOESCAPE BOOL (^)(void))block API_AVAILABLE(macos(10.9));

/*!
 @method prepareObjects:withCompletionHandler:
 @abstract Prepare the specified objects for drawing on the background.
 @param objects The objects to prepare. It can be one or more instances of SCNScene, SCNNode, SCNGeometry, or SCNMaterial
 @param completionHandler This block will be called when all objects has been prepared, or on failure.
 @discussion This method is observable using NSProgress.
 */
- (void)prepareObjects:(NSArray *_Nonnull)objects withCompletionHandler:(nullable void (^)(BOOL success))completionHandler API_AVAILABLE(macos(10.10));

/*!
 @property showsStatistics
 @abstract Determines whether the receiver should display statistics info like FPS. Defaults to NO.
 @discussion  When set to YES, statistics are displayed in a overlay on top of the rendered scene.
 */
@property(nonatomic) BOOL showsStatistics API_AVAILABLE(macos(10.9));

/*!
 @property debugOptions
 @abstract Specifies the debug options of the receiver. Defaults to SCNDebugOptionNone.
 */
@property(nonatomic) SCNDebugOptions debugOptions API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property overlaySKScene
 @abstract Specifies the overlay of the receiver as a SpriteKit scene instance. Defaults to nil.
 */
@property(nonatomic, retain, nullable) SKScene *overlaySKScene API_AVAILABLE(macos(10.10));

/*!
 @property renderingAPI
 @abstract Specifies the rendering API associated to the receiver.
 @discussion This is the rendering API effectively used by the receiver. You can specify a preferred rendering API when initializing a view programmatically (see SCNPreferredRenderingAPI in SCNSceneRenderer.h) or using Interface Builder's SCNView inspector.
 */
@property(nonatomic, readonly) SCNRenderingAPI renderingAPI API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property context
 @abstract A Core OpenGL render context that is used as the render target (a CGLContextObj on macOS, an EAGLContext on iOS).
 */
@property(nonatomic, readonly, nullable) void *context;

#if SCN_ENABLE_METAL

/*!
 @property currentRenderCommandEncoder
 @abstract The current render command encoder if any. This property is only valid within the SCNSceneRendererDelegate methods and when renderering with Metal. Otherwise it is set to nil.
 */
@property(nonatomic, readonly, nullable) id <MTLRenderCommandEncoder> currentRenderCommandEncoder API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property device
 @abstract The metal device of the renderer. This property is only valid on a renderer created with a Metal device. Otherwise it is set to nil.
 */
@property(nonatomic, readonly, nullable) id <MTLDevice> device API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property colorPixelFormat
 @abstract The pixel format of the color attachment 0 of the renderer. This property is only valid on a renderer created with a Metal device.
 */
@property(nonatomic, readonly) MTLPixelFormat colorPixelFormat API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property depthPixelFormat
 @abstract The pixel format of the depth attachment of the renderer. This property is only valid on a renderer created with a Metal device.
 */
@property(nonatomic, readonly) MTLPixelFormat depthPixelFormat API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property stencilPixelFormat
 @abstract The pixel format of the stencil attachment of the renderer. This property is only valid on a renderer created with a Metal device.
 */
@property(nonatomic, readonly) MTLPixelFormat stencilPixelFormat API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property commandQueue
 @abstract The command queue of the renderer. This property is only valid on a renderer created with a Metal device. Otherwise it is set to nil.
 */
@property(nonatomic, readonly, nullable) id <MTLCommandQueue> commandQueue API_AVAILABLE(macos(10.11), ios(9.0));

#endif

/*!
 @property audioEngine
 @abstract Contains the instance of audio engine used by the scene.
 @discussion The audio engine can be used to add custom nodes to the audio graph.
 */
@property(nonatomic, readonly) AVAudioEngine * _Null_unspecified audioEngine API_AVAILABLE(macos(10.11), ios(9.0));

/*!
 @property audioEnvironmentNode
 @abstract Contains the instance of audio environment node used by the scene to spacialize sounds.
 */
@property(nonatomic, readonly) AVAudioEnvironmentNode * _Null_unspecified audioEnvironmentNode API_AVAILABLE(macos(10.11), ios(9.0)) API_UNAVAILABLE(watchos);

/*!
 @property audioListener
 @abstract Use this property to set the audio node to use as the listener position and orientation when rendering positional audio for this scene. The default is nil which means that the current point of view will be used dynamically.
 */
@property(nonatomic, retain, nullable) SCNNode *audioListener API_AVAILABLE(macos(10.11), ios(9.0));



@end
#endif

#endif /* NSCNSceneRenderer_h */
