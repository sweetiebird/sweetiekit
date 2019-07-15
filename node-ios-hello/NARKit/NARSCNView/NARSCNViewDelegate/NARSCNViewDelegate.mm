//
//  NARSCNViewDelegate.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSCNViewDelegate.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define instancetype ARSCNViewDelegate
#define js_value_instancetype js_value_ARSCNViewDelegate

#include "NARSession.h"
#include "NARAnchor.h"
#include "NSCNView.h"
#include "NSCNNode.h"

NARSCNViewDelegate::NARSCNViewDelegate () {}
NARSCNViewDelegate::~NARSCNViewDelegate () {}

#include "NSCNSceneRenderer.h"

JS_INIT_PROTOCOL(ARSCNViewDelegate, SCNSceneRendererDelegate);
  JS_ASSIGN_PROTO_PROP(rendererNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(rendererDidAddNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(rendererWillUpdateNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(rendererDidUpdateNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(rendererDidRemoveNodeForAnchor);

  JS_ASSIGN_PROTO_PROP(sessionDidFailWithError);
  JS_ASSIGN_PROTO_PROP(sessionCameraDidChangeTrackingState);
  JS_ASSIGN_PROTO_PROP(sessionWasInterrupted);
  JS_ASSIGN_PROTO_PROP(sessionInterruptionEnded);
  JS_ASSIGN_PROTO_PROP(sessionShouldAttemptRelocalization);
  JS_ASSIGN_PROTO_PROP(sessionDidOutputAudioSampleBuffer);
  JS_ASSIGN_PROTO_PROP(sessionDidOutputCollaborationData);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSCNViewDelegate, SCNSceneRendererDelegate);
  // constant values (exports)

  //typedef SCNDebugOptions ARSCNDebugOptions API_AVAILABLE(ios(11.0));

  /** Show the world origin in the scene. */
  // API_AVAILABLE(ios(11.0))
  JS_ASSIGN_ENUM(ARSCNDebugOptionShowWorldOrigin, SCNDebugOptions); // NS_SWIFT_NAME(ARSCNDebugOptions.showWorldOrigin);

  /** Show detected 3D feature points in the world. */
  // API_AVAILABLE(ios(11.0))
  JS_ASSIGN_ENUM(ARSCNDebugOptionShowFeaturePoints, SCNDebugOptions); // NS_SWIFT_NAME(ARSCNDebugOptions.showFeaturePoints);
  
JS_INIT_PROTOCOL_END(ARSCNViewDelegate, SCNSceneRendererDelegate);

NAN_METHOD(NARSCNViewDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(ARSCNViewDelegate);
  @autoreleasepool {
    id<ARSCNViewDelegate> self = nil;

    if (info[0]->IsExternal()) {
      self = (__bridge id<ARSCNViewDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[ARSCNViewDelegateType alloc] init];
    }
    if (self) {
      NARSCNViewDelegate *wrapper = new NARSCNViewDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSCNViewDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, rendererNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, rendererDidAddNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, rendererWillUpdateNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, rendererDidUpdateNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, rendererDidRemoveNodeForAnchor);

DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, sessionDidFailWithError);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, sessionCameraDidChangeTrackingState);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, sessionWasInterrupted);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, sessionInterruptionEnded);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, sessionShouldAttemptRelocalization);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, sessionDidOutputAudioSampleBuffer);
DELEGATE_PROTOCOL_PROP(ARSCNViewDelegate, sessionDidOutputCollaborationData);

#include "NARSession.h"
#include "NNSError.h"
#include "NARCamera.h"
#include "NCMSampleBuffer.h"
#include "NARCollaborationData.h"

@implementation ARSCNViewDelegateType

/**
 Implement this to provide a custom node for the given anchor.
 
 @discussion This node will automatically be added to the scene graph.
 If this method is not implemented, a node will be automatically created.
 If nil is returned the anchor will be ignored.
 @param renderer The renderer that will render the scene.
 @param anchor The added anchor.
 @return Node that will be mapped to the anchor or nil.
 */
- (nullable SCNNode *)renderer:(id <SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor
{
  __block SCNNode* result = nil;
  call_delegate(result = is_value_SCNNode(JS_RESULT) ? to_value_SCNNode(JS_RESULT) : result, rendererNodeForAnchor,
    js_value_SCNSceneRenderer(renderer),
    js_value_ARAnchor(anchor));
  return result;
}

/**
 Called when a new node has been mapped to the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that maps to the anchor.
 @param anchor The added anchor.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate_async(noop(), rendererDidAddNodeForAnchor,
    js_value_SCNSceneRenderer(renderer),
    js_value_SCNNode(node),
    js_value_ARAnchor(anchor));
}

/**
 Called when a node will be updated with data from the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that will be updated.
 @param anchor The anchor that was updated.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer willUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate_async(noop(), rendererWillUpdateNodeForAnchor,
    js_value_SCNSceneRenderer(renderer),
    js_value_SCNNode(node),
    js_value_ARAnchor(anchor));
}

/**
 Called when a node has been updated with data from the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that was updated.
 @param anchor The anchor that was updated.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate_async(noop(), rendererDidUpdateNodeForAnchor,
    js_value_SCNSceneRenderer(renderer),
    js_value_SCNNode(node),
    js_value_ARAnchor(anchor));
}

/**
 Called when a mapped node has been removed from the scene graph for the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that was removed.
 @param anchor The anchor that was removed.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didRemoveNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate_async(noop(), rendererDidRemoveNodeForAnchor,
    js_value_SCNSceneRenderer(renderer),
    js_value_SCNNode(node),
    js_value_ARAnchor(anchor));
}


//
// ARSessionObserver
//

/**
 This is called when a session fails.
 
 @discussion On failure the session will be paused.
 @param session The session that failed.
 @param error The error being reported (see ARError.h).
 */
- (void)session:(ARSession *)session didFailWithError:(NSError *)error
{
  call_delegate_async(noop(), sessionDidFailWithError,
    js_value_ARSession(session),
    js_value_NSError(error));
}

/**
 This is called when the camera’s tracking state has changed.
 
 @param session The session being run.
 @param camera The camera that changed tracking states.
 */
- (void)session:(ARSession *)session cameraDidChangeTrackingState:(ARCamera *)camera
{
  call_delegate_async(noop(), sessionCameraDidChangeTrackingState,
    js_value_ARSession(session),
    js_value_ARCamera(camera));
}

/**
 This is called when a session is interrupted.
 
 @discussion A session will be interrupted and no longer able to track when
 it fails to receive required sensor data. This happens when video capture is interrupted,
 for example when the application is sent to the background or when there are
 multiple foreground applications (see AVCaptureSessionInterruptionReason).
 No additional frame updates will be delivered until the interruption has ended.
 @param session The session that was interrupted.
 */
- (void)sessionWasInterrupted:(ARSession *)session
{
  call_delegate_async(noop(), sessionWasInterrupted,
    js_value_ARSession(session));
}

/**
 This is called when a session interruption has ended.
 
 @discussion A session will continue running from the last known state once
 the interruption has ended. If the device has moved, anchors will be misaligned.
 To avoid this, some applications may want to reset tracking (see ARSessionRunOptions)
 or attempt to relocalize (see `-[ARSessionObserver sessionShouldAttemptRelocalization:]`).
 @param session The session that was interrupted.
 */
- (void)sessionInterruptionEnded:(ARSession *)session
{
  call_delegate_async(noop(), sessionInterruptionEnded,
    js_value_ARSession(session));
}

/**
 This is called after a session resumes from a pause or interruption to determine
 whether or not the session should attempt to relocalize.
 
 @discussion To avoid misaligned anchors, apps may wish to attempt a relocalization after
 a session pause or interruption. If YES is returned: the session will begin relocalizing
 and tracking state will switch to limited with reason relocalizing. If successful, the
 session's tracking state will return to normal. Because relocalization depends on
 the user's location, it can run indefinitely. Apps that wish to give up on relocalization
 may call run with `ARSessionRunOptionResetTracking` at any time.
 @param session The session to relocalize.
 @return Return YES to begin relocalizing.
 */
- (BOOL)sessionShouldAttemptRelocalization:(ARSession *)session API_AVAILABLE(ios(11.3))
{
  __block BOOL result = NO; // TODO: unsure about this default value.
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_bool(JS_RESULT) : result, sessionInterruptionEnded,
    js_value_ARSession(session));
  return result;
}

/**
 This is called when the session outputs a new audio sample buffer.
 
 @param session The session being run.
 @param audioSampleBuffer The captured audio sample buffer.
 */
- (void)session:(ARSession *)session didOutputAudioSampleBuffer:(CMSampleBufferRef)audioSampleBuffer
{
  call_delegate_async(noop(), sessionDidOutputAudioSampleBuffer,
    js_value_ARSession(session),
    js_value_CMSampleBufferRef(audioSampleBuffer));
}

/**
 This is called when the session generated new collaboration data.
 
 @discussion This data should be sent to all participants.
 
 @param session The session that produced world tracking collaboration data.
 @param data Collaboration data to be sent to participants.
 @see ARCollaborationData
 */
#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_13_0)
- (void)session:(ARSession *)session didOutputCollaborationData:(ARCollaborationData *)data API_AVAILABLE(ios(13.0))
{
  call_delegate_async(noop(), sessionDidOutputCollaborationData,
    js_value_ARSession(session),
    js_value_ARCollaborationData(data));
}
#endif

@end

#endif
