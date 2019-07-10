//
//  NARSessionDelegate.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSessionDelegate_h
#define NARSessionDelegate_h    

#include "NARSessionObserver.h"

#if __OBJC__
@protocol ARSessionDelegate;
@protocol ARSessionObserver;
@class ARSession;
@class ARFrame;
@class ARAnchor;
#endif

#define js_value_ARSessionDelegate(x) js_protocol_wrapper(x, ARSessionDelegate)
#define to_value_ARSessionDelegate(x) to_protocol_wrapper(x, ARSessionDelegate)
#define is_value_ARSessionDelegate(x) is_protocol_wrapper(x, ARSessionDelegate)

JS_WRAP_PROTOCOL(ARSessionDelegate, ARSessionObserver);
  JS_PROP(sessionDidUpdateFrame);
  JS_PROP(sessionDidAddAnchors);
  JS_PROP(sessionDidUpdateAnchors);
  JS_PROP(sessionDidRemoveAnchors);
JS_WRAP_PROTOCOL_END(ARSessionDelegate, ARSessionObserver);

#if __OBJC__
@interface ARSessionDelegateType : ARSessionObserverType<ARSessionDelegate>

/**
 This is called when a new frame has been updated.
 
 @param session The session being run.
 @param frame The frame that has been updated.
 */
- (void)session:(ARSession *)session didUpdateFrame:(ARFrame *)frame;

/**
 This is called when new anchors are added to the session.
 
 @param session The session being run.
 @param anchors An array of added anchors.
 */
- (void)session:(ARSession *)session didAddAnchors:(NSArray<__kindof ARAnchor*>*)anchors;

/**
 This is called when anchors are updated.
 
 @param session The session being run.
 @param anchors An array of updated anchors.
 */
- (void)session:(ARSession *)session didUpdateAnchors:(NSArray<__kindof ARAnchor*>*)anchors;

/**
 This is called when anchors are removed from the session.
 
 @param session The session being run.
 @param anchors An array of removed anchors.
 */
- (void)session:(ARSession *)session didRemoveAnchors:(NSArray<__kindof ARAnchor*>*)anchors;

@end
#endif

#endif /* NARSessionDelegate_h */
