//
//  NSCNView.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNView_h
#define NSCNView_h

#include "NUIView.h"

#define js_value_SCNView(x) js_value_wrapper(x, SCNView)
#define to_value_SCNView(x) to_value_wrapper(x, SCNView)
#define is_value_SCNView(x) is_value_wrapper(x, SCNView)

#define js_value_EAGLContext js_value_id
#define to_value_EAGLContext to_value_id

// SceneKit enums
#define js_value_SCNDebugOptions(x) JS_ENUM(SCNDebugOptions, NSUInteger, x)
#define to_value_SCNDebugOptions(x) TO_ENUM(SCNDebugOptions, NSUInteger, x)
#define is_value_SCNDebugOptions(x) IS_ENUM(SCNDebugOptions, NSUInteger, x)

#define js_value_SCNRenderingAPI(x) JS_ENUM(SCNRenderingAPI, NSInteger, x)
#define to_value_SCNRenderingAPI(x) TO_ENUM(SCNRenderingAPI, NSInteger, x)
#define is_value_SCNRenderingAPI(x) IS_ENUM(SCNRenderingAPI, NSInteger, x)

JS_WRAP_CLASS(SCNView, UIView);
  JS_METHOD(hitTest);
  JS_METHOD(projectPoint);
  JS_METHOD(unprojectPoint);
  
  JS_PROP(rendersContinuously);
  JS_PROP(allowsCameraControl);
  JS_PROP_READONLY(cameraControlConfiguration);
  JS_PROP_READONLY(defaultCameraController);
  JS_PROP(preferredFramesPerSecond);
  JS_PROP(eaglContext);
  JS_PROP(antialiasingMode);
  
  JS_PROP(scene);
  JS_PROP(sceneTime);
  JS_PROP(delegate);
  JS_PROP(playing);
  JS_PROP(loops);
  JS_PROP(pointOfView);
  JS_PROP(autoenablesDefaultLighting);
  JS_PROP(jitteringEnabled);
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


JS_WRAP_CLASS_END(SCNView);

#endif /* NSCNView_h */
