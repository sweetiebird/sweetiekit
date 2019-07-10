//
//  NARSCNViewDelegate.h
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSCNViewDelegate_h
#define NARSCNViewDelegate_h

#if TARGET_OS_IPHONE

#include "NSCNSceneRendererDelegate.h"

#if __OBJC__
@protocol ARSCNViewDelegate;
@protocol ARSessionObserver;
#endif

#define js_value_ARSCNViewDelegate(x) js_protocol_wrapper(x, ARSCNViewDelegate)
#define to_value_ARSCNViewDelegate(x) to_protocol_wrapper(x, ARSCNViewDelegate)
#define is_value_ARSCNViewDelegate(x) is_protocol_wrapper(x, ARSCNViewDelegate)

#define js_value_ARSCNDebugOptions(x) JS_ENUM(ARSCNDebugOptions, SCNDebugOptions, x)
#define to_value_ARSCNDebugOptions(x) TO_ENUM(ARSCNDebugOptions, SCNDebugOptions, x)
#define is_value_ARSCNDebugOptions(x) IS_ENUM(ARSCNDebugOptions, SCNDebugOptions, x)

JS_WRAP_PROTOCOL(ARSCNViewDelegate, SCNSceneRendererDelegate);
  JS_PROP(rendererNodeForAnchor);
  JS_PROP(rendererDidAddNodeForAnchor);
  JS_PROP(rendererWillUpdateNodeForAnchor);
  JS_PROP(rendererDidUpdateNodeForAnchor);
  JS_PROP(rendererDidRemoveNodeForAnchor);

  JS_PROP(sessionDidFailWithError);
  JS_PROP(sessionCameraDidChangeTrackingState);
  JS_PROP(sessionWasInterrupted);
  JS_PROP(sessionInterruptionEnded);
  JS_PROP(sessionShouldAttemptRelocalization);
  JS_PROP(sessionDidOutputAudioSampleBuffer);
  JS_PROP(sessionDidOutputCollaborationData);
JS_WRAP_PROTOCOL_END(ARSCNViewDelegate, SCNSceneRendererDelegate);

#if __OBJC__
@class SCNNode;
@class ARAnchor;
@protocol SCNSceneRenderer;
@protocol ARSessionObserver;
@class NSError;
@class ARCamera;
@class ARSession;
@class ARCollaborationData;

@interface ARSCNViewDelegateType : SCNSceneRendererDelegateType<ARSCNViewDelegate, ARSessionObserver>

/**
 Implement this to provide a custom node for the given anchor.
 
 @discussion This node will automatically be added to the scene graph.
 If this method is not implemented, a node will be automatically created.
 If nil is returned the anchor will be ignored.
 @param renderer The renderer that will render the scene.
 @param anchor The added anchor.
 @return Node that will be mapped to the anchor or nil.
 */
- (nullable SCNNode *)renderer:(id <SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor;

/**
 Called when a new node has been mapped to the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that maps to the anchor.
 @param anchor The added anchor.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor;

/**
 Called when a node will be updated with data from the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that will be updated.
 @param anchor The anchor that was updated.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer willUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor;

/**
 Called when a node has been updated with data from the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that was updated.
 @param anchor The anchor that was updated.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor;

/**
 Called when a mapped node has been removed from the scene graph for the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that was removed.
 @param anchor The anchor that was removed.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer didRemoveNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor;


//
// ARSessionObserver
//

/**
 This is called when a session fails.
 
 @discussion On failure the session will be paused.
 @param session The session that failed.
 @param error The error being reported (see ARError.h).
 */
- (void)session:(ARSession *)session didFailWithError:(NSError *)error;

/**
 This is called when the camera’s tracking state has changed.
 
 @param session The session being run.
 @param camera The camera that changed tracking states.
 */
- (void)session:(ARSession *)session cameraDidChangeTrackingState:(ARCamera *)camera;

/**
 This is called when a session is interrupted.
 
 @discussion A session will be interrupted and no longer able to track when
 it fails to receive required sensor data. This happens when video capture is interrupted,
 for example when the application is sent to the background or when there are
 multiple foreground applications (see AVCaptureSessionInterruptionReason).
 No additional frame updates will be delivered until the interruption has ended.
 @param session The session that was interrupted.
 */
- (void)sessionWasInterrupted:(ARSession *)session;

/**
 This is called when a session interruption has ended.
 
 @discussion A session will continue running from the last known state once
 the interruption has ended. If the device has moved, anchors will be misaligned.
 To avoid this, some applications may want to reset tracking (see ARSessionRunOptions)
 or attempt to relocalize (see `-[ARSessionObserver sessionShouldAttemptRelocalization:]`).
 @param session The session that was interrupted.
 */
- (void)sessionInterruptionEnded:(ARSession *)session;

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
- (BOOL)sessionShouldAttemptRelocalization:(ARSession *)session API_AVAILABLE(ios(11.3));

/**
 This is called when the session outputs a new audio sample buffer.
 
 @param session The session being run.
 @param audioSampleBuffer The captured audio sample buffer.
 */
- (void)session:(ARSession *)session didOutputAudioSampleBuffer:(CMSampleBufferRef)audioSampleBuffer;

/**
 This is called when the session generated new collaboration data.
 
 @discussion This data should be sent to all participants.
 
 @param session The session that produced world tracking collaboration data.
 @param data Collaboration data to be sent to participants.
 @see ARCollaborationData
 */
- (void)session:(ARSession *)session didOutputCollaborationData:(ARCollaborationData *)data API_AVAILABLE(ios(13.0));


@end
#endif
#endif

#endif /* NARSCNViewDelegate_h */
