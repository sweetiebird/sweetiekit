//
//  NARSessionDelegate.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSessionDelegate.h"

#define instancetype ARSessionDelegate
#define js_value_instancetype js_value_ARSessionDelegate

NARSessionDelegate::NARSessionDelegate() {}
NARSessionDelegate::~NARSessionDelegate() {}

JS_INIT_PROTOCOL(ARSessionDelegate, ARSessionObserver);
  JS_ASSIGN_PROTO_PROP(sessionDidUpdateFrame);
  JS_ASSIGN_PROTO_PROP(sessionDidAddAnchors);
  JS_ASSIGN_PROTO_PROP(sessionDidUpdateAnchors);
  JS_ASSIGN_PROTO_PROP(sessionDidRemoveAnchors);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSessionDelegate, ARSessionObserver);
  // constant values (exports)
JS_INIT_PROTOCOL_END(ARSessionDelegate, ARSessionObserver);

NAN_METHOD(NARSessionDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(ARSessionDelegate);
  @autoreleasepool {
    id<ARSessionDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<ARSessionDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<ARSessionDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], ARSessionDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[ARSessionDelegateType alloc] init];
    }
    if (self) {
      NARSessionDelegate *wrapper = new NARSessionDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSessionDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(ARSessionDelegate, sessionDidUpdateFrame);
DELEGATE_PROTOCOL_PROP(ARSessionDelegate, sessionDidAddAnchors);
DELEGATE_PROTOCOL_PROP(ARSessionDelegate, sessionDidUpdateAnchors);
DELEGATE_PROTOCOL_PROP(ARSessionDelegate, sessionDidRemoveAnchors);

#include "NARSession.h"
#include "NARFrame.h"
#include "NARAnchor.h"

@implementation ARSessionDelegateType

/**
 This is called when a new frame has been updated.
 
 @param session The session being run.
 @param frame The frame that has been updated.
 */
- (void)session:(ARSession *)session didUpdateFrame:(ARFrame *)frame
{
  call_delegate_async(noop(), sessionDidUpdateFrame,
    js_value_ARSession(session),
    js_value_ARFrame(frame));
}

/**
 This is called when new anchors are added to the session.
 
 @param session The session being run.
 @param anchors An array of added anchors.
 */
- (void)session:(ARSession *)session didAddAnchors:(NSArray<__kindof ARAnchor*>*)anchors
{
  call_delegate_async(noop(), sessionDidAddAnchors,
    js_value_ARSession(session),
    js_value_NSArray<ARAnchor*>(anchors));
}

/**
 This is called when anchors are updated.
 
 @param session The session being run.
 @param anchors An array of updated anchors.
 */
- (void)session:(ARSession *)session didUpdateAnchors:(NSArray<__kindof ARAnchor*>*)anchors
{
  call_delegate_async(noop(), sessionDidUpdateAnchors,
    js_value_ARSession(session),
    js_value_NSArray<ARAnchor*>(anchors));
}

/**
 This is called when anchors are removed from the session.
 
 @param session The session being run.
 @param anchors An array of removed anchors.
 */
- (void)session:(ARSession *)session didRemoveAnchors:(NSArray<__kindof ARAnchor*>*)anchors
{
  call_delegate_async(noop(), sessionDidRemoveAnchors,
    js_value_ARSession(session),
    js_value_NSArray<ARAnchor*>(anchors));
}

@end
