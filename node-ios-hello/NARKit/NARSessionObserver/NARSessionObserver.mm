//
//  NARSessionObserver.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSessionObserver.h"

#define instancetype ARSessionObserver
#define js_value_instancetype js_value_ARSessionObserver

NARSessionObserver::NARSessionObserver() {}
NARSessionObserver::~NARSessionObserver() {}

JS_INIT_PROTOCOL(ARSessionObserver, NSObject);
  JS_ASSIGN_PROTO_PROP(sessionDidFailWithError);
  JS_ASSIGN_PROTO_PROP(sessionCameraDidChangeTrackingState);
  JS_ASSIGN_PROTO_PROP(sessionWasInterrupted);
  JS_ASSIGN_PROTO_PROP(sessionInterruptionEnded);
  JS_ASSIGN_PROTO_PROP(sessionShouldAttemptRelocalization);
  JS_ASSIGN_PROTO_PROP(sessionDidOutputAudioSampleBuffer);
  JS_ASSIGN_PROTO_PROP(sessionDidOutputCollaborationData);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSessionObserver, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(ARSessionObserver, NSObject);

NAN_METHOD(NARSessionObserver::New) {
  JS_RECONSTRUCT_PROTOCOL(ARSessionObserver);
  @autoreleasepool {
    id<ARSessionObserver> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<ARSessionObserver>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<ARSessionObserver> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], ARSessionObserver, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[ARSessionObserverType alloc] init];
    }
    if (self) {
      NARSessionObserver *wrapper = new NARSessionObserver();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSessionObserver::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(ARSessionObserver, sessionDidFailWithError);
DELEGATE_PROTOCOL_PROP(ARSessionObserver, sessionCameraDidChangeTrackingState);
DELEGATE_PROTOCOL_PROP(ARSessionObserver, sessionWasInterrupted);
DELEGATE_PROTOCOL_PROP(ARSessionObserver, sessionInterruptionEnded);
DELEGATE_PROTOCOL_PROP(ARSessionObserver, sessionShouldAttemptRelocalization);
DELEGATE_PROTOCOL_PROP(ARSessionObserver, sessionDidOutputAudioSampleBuffer);
DELEGATE_PROTOCOL_PROP(ARSessionObserver, sessionDidOutputCollaborationData);

#include "NARSession.h"
#include "NNSError.h"
#include "NARCamera.h"
#include "NCMSampleBuffer.h"
#include "NARCollaborationData.h"

@implementation ARSessionObserverType

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
- (void)session:(ARSession *)session didOutputCollaborationData:(ARCollaborationData *)data API_AVAILABLE(ios(13.0))
{
  call_delegate_async(noop(), sessionDidOutputCollaborationData,
    js_value_ARSession(session),
    js_value_ARCollaborationData(data));
}

@end
