//
//  NSCNSceneRendererDelegate.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNSceneRendererDelegate.h"

#define instancetype SCNSceneRendererDelegate
#define js_value_instancetype js_value_SCNSceneRendererDelegate

NSCNSceneRendererDelegate::NSCNSceneRendererDelegate() {}
NSCNSceneRendererDelegate::~NSCNSceneRendererDelegate() {}

JS_INIT_CLASS(SCNSceneRendererDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(rendererUpdateAtTime);
  JS_ASSIGN_PROTO_PROP(rendererDidApplyAnimationsAtTime);
  JS_ASSIGN_PROTO_PROP(rendererDidSimulatePhysicsAtTime);
  JS_ASSIGN_PROTO_PROP(rendererDidApplyConstraintsAtTime);
  JS_ASSIGN_PROTO_PROP(rendererWillRenderSceneAtTime);
  JS_ASSIGN_PROTO_PROP(rendererDidRenderSceneAtTime);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNSceneRendererDelegate, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNSceneRendererDelegate, NSObject);

NAN_METHOD(NSCNSceneRendererDelegate::New) {
  JS_RECONSTRUCT(SCNSceneRendererDelegate);
  @autoreleasepool {
    SCNSceneRendererDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNSceneRendererDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNSceneRendererDelegate alloc] init];
    }
    if (self) {
      NSCNSceneRendererDelegate *wrapper = new NSCNSceneRendererDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNSceneRendererDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(SCNSceneRendererDelegate, rendererUpdateAtTime);
DELEGATE_PROP(SCNSceneRendererDelegate, rendererDidApplyAnimationsAtTime);
DELEGATE_PROP(SCNSceneRendererDelegate, rendererDidSimulatePhysicsAtTime);
DELEGATE_PROP(SCNSceneRendererDelegate, rendererDidApplyConstraintsAtTime);
DELEGATE_PROP(SCNSceneRendererDelegate, rendererWillRenderSceneAtTime);
DELEGATE_PROP(SCNSceneRendererDelegate, rendererDidRenderSceneAtTime);

@implementation SCNSceneRendererDelegate

/*!
 @method renderer:updateAtTime:
 @abstract Implement this to perform per-frame game logic. Called exactly once per frame before any animation and actions are evaluated and any physics are simulated.
 @param renderer The renderer that will render the scene.
 @param time The time at which to update the scene.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer updateAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.10))
{
  call_delegate(noop(), rendererUpdateAtTime,
    js_value_id/* <SCNSceneRenderer>*/(renderer),
    js_value_NSTimeInterval(time));
}

/*!
 @method renderer:didApplyAnimationsAtTime:
 @abstract Invoked on the delegate once the scene renderer did apply the animations.
 @param renderer The renderer that did render the scene.
 @param time The time at which the animations were applied.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didApplyAnimationsAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.10))
{
  call_delegate(noop(), rendererDidApplyAnimationsAtTime,
    js_value_id/* <SCNSceneRenderer>*/(renderer),
    js_value_NSTimeInterval(time));
}

/*!
 @method renderer:didSimulatePhysicsAtTime:
 @abstract Invoked on the delegate once the scene renderer did simulate the physics.
 @param renderer The renderer that did render the scene.
 @param time The time at which the physics were simulated.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didSimulatePhysicsAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.10))
{
  call_delegate(noop(), rendererDidSimulatePhysicsAtTime,
    js_value_id/* <SCNSceneRenderer>*/(renderer),
    js_value_NSTimeInterval(time));
}

/*!
 @method renderer:didApplyConstraintsAtTime:
 @abstract Invoked on the delegate once the scene renderer did apply the constraints.
 @param renderer The renderer that did render the scene.
 @param time The time at which the constraints were simulated.
 @discussion All modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didApplyConstraintsAtTime:(NSTimeInterval)time API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0))
{
  call_delegate(noop(), rendererDidApplyConstraintsAtTime,
    js_value_id/* <SCNSceneRenderer>*/(renderer),
    js_value_NSTimeInterval(time));
}

/*!
 @method renderer:willRenderScene:atTime:
 @abstract Invoked on the delegate before the scene renderer renders the scene. At this point the openGL context and the destination framebuffer are bound.
 @param renderer The renderer that will render the scene.
 @param scene The scene to be rendered.
 @param time The time at which the scene is to be rendered.
 @discussion Starting in 10.10 all modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer willRenderScene:(SCNScene *)scene atTime:(NSTimeInterval)time
{
  call_delegate(noop(), rendererWillRenderSceneAtTime,
    js_value_id/* <SCNSceneRenderer>*/(renderer),
    js_value_NSTimeInterval(time));
}

/*!
 @method renderer:didRenderScene:atTime:
 @abstract Invoked on the delegate once the scene renderer did render the scene.
 @param renderer The renderer that did render the scene.
 @param scene The rendered scene.
 @param time The time at which the scene was rendered.
 @discussion Starting in 10.10 all modifications done within this method don't go through the transaction model, they are directly applied on the presentation tree.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didRenderScene:(SCNScene *)scene atTime:(NSTimeInterval)time
{
  call_delegate(noop(), rendererDidRenderSceneAtTime,
    js_value_id/* <SCNSceneRenderer>*/(renderer),
    js_value_NSTimeInterval(time));
}

@end
