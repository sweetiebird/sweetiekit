//
//  NSCNSceneRendererDelegate.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNSceneRendererDelegate_h
#define NSCNSceneRendererDelegate_h    

#include "NNSObject.h"

#define js_value_SCNSceneRendererDelegate(x) js_value_wrapper(x, SCNSceneRendererDelegate)
#define to_value_SCNSceneRendererDelegate(x) to_value_wrapper(x, SCNSceneRendererDelegate)
#define is_value_SCNSceneRendererDelegate(x) is_value_wrapper(x, SCNSceneRendererDelegate)

JS_WRAP_CLASS(SCNSceneRendererDelegate, NSObject);
  JS_PROP(rendererUpdateAtTime);
  JS_PROP(rendererDidApplyAnimationsAtTime);
  JS_PROP(rendererDidSimulatePhysicsAtTime);
  JS_PROP(rendererDidApplyConstraintsAtTime);
  JS_PROP(rendererWillRenderSceneAtTime);
  JS_PROP(rendererDidRenderSceneAtTime);
JS_WRAP_CLASS_END(SCNSceneRendererDelegate);

#if __OBJC__
@interface SCNSceneRendererDelegate : NSObject<SCNSceneRendererDelegate>

/*!
 @method renderer:updateAtTime:
 @abstract Implement this to perform per-frame game logic. Called exactly once per frame before any animation and actions are evaluated and any physics are simulated.
 @param renderer The renderer that will render the scene.
 @param time The time at which to update the scene.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer updateAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.10));

/*!
 @method renderer:didApplyAnimationsAtTime:
 @abstract Invoked on the delegate once the scene renderer did apply the animations.
 @param renderer The renderer that did render the scene.
 @param time The time at which the animations were applied.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didApplyAnimationsAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.10));

/*!
 @method renderer:didSimulatePhysicsAtTime:
 @abstract Invoked on the delegate once the scene renderer did simulate the physics.
 @param renderer The renderer that did render the scene.
 @param time The time at which the physics were simulated.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didSimulatePhysicsAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.10));

/*!
 @method renderer:didApplyConstraintsAtTime:
 @abstract Invoked on the delegate once the scene renderer did apply the constraints.
 @param renderer The renderer that did render the scene.
 @param time The time at which the constraints were simulated.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didApplyConstraintsAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0));

/*!
 @method renderer:willRenderScene:atTime:
 @abstract Invoked on the delegate before the scene renderer renders the scene. At this point the openGL context and the destination framebuffer are bound.
 @param renderer The renderer that will render the scene.
 @param scene The scene to be rendered.
 @param time The time at which the scene is to be rendered.
 @discussion Starting in 10.10 all modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer willRenderScene:(SCNScene *)scene atTime:(NSTimeInterval)time;

/*!
 @method renderer:didRenderScene:atTime:
 @abstract Invoked on the delegate once the scene renderer did render the scene.
 @param renderer The renderer that did render the scene.
 @param scene The rendered scene.
 @param time The time at which the scene was rendered.
 @discussion Starting in 10.10 all modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didRenderScene:(SCNScene *)scene atTime:(NSTimeInterval)time;

@end
#endif

#endif /* NSCNSceneRendererDelegate_h */
