//
//  NARSession.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSession_h
#define NARSession_h

#include "NNSObject.h"

#if TARGET_OS_IPHONE

#define js_value_ARSessionRunOptions(x) JS_ENUM(ARSessionRunOptions, NSUInteger, x)
#define to_value_ARSessionRunOptions(x) TO_ENUM(ARSessionRunOptions, NSUInteger, x)
#define is_value_ARSessionRunOptions(x) IS_ENUM(ARSessionRunOptions, NSUInteger, x)

#define js_value_ARSession(x) js_value_wrapper(x, ARSession)
#define to_value_ARSession(x) to_value_wrapper(x, ARSession)
#define is_value_ARSession(x) is_value_wrapper(x, ARSession)

JS_WRAP_CLASS(ARSession, NSObject);
  // old
  JS_METHOD(run);
  JS_METHOD(add);
  JS_METHOD(remove);

  JS_METHOD(runWithConfiguration);
  JS_METHOD(runWithConfigurationOptions);
  JS_METHOD(pause);
  JS_METHOD(addAnchor);
  JS_METHOD(removeAnchor);
  JS_METHOD(setWorldOrigin);
  JS_METHOD(getCurrentWorldMapWithCompletionHandler);
  JS_METHOD(createReferenceObjectWithTransformCenterExtentCompletionHandler);
  JS_METHOD(raycast);
  JS_METHOD(trackedRaycastUpdateHandler);
  JS_METHOD(updateWithCollaborationData);
  JS_PROP_READONLY(identifier);
  JS_PROP(delegate);
  JS_PROP(delegateQueue);
  JS_PROP_READONLY(currentFrame);
  JS_PROP_READONLY(configuration);
JS_WRAP_CLASS_END(ARSession);

#endif

#endif /* NARSession_h */
