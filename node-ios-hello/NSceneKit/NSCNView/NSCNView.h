//
//  NSCNView.h
//  node-ios-hello
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
#define js_value_SCNAntialiasingMode(x) JS_ENUM(SCNAntialiasingMode, NSInteger, x)
#define to_value_SCNAntialiasingMode(x) TO_ENUM(SCNAntialiasingMode, NSInteger, x)
#define is_value_SCNAntialiasingMode(x) IS_ENUM(SCNAntialiasingMode, NSInteger, x)

JS_WRAP_CLASS(SCNView, UIView);
  JS_PROP(autoenablesDefaultLighting);
  JS_PROP(playing);
  
  JS_PROP(scene);
  JS_PROP(rendersContinuously);
  JS_PROP(allowsCameraControl);
  JS_PROP_READONLY(cameraControlConfiguration);
  JS_PROP_READONLY(defaultCameraController);
  JS_PROP(preferredFramesPerSecond);
  JS_PROP(eaglContext);
  JS_PROP(antialiasingMode);

JS_WRAP_CLASS_END(SCNView);

#endif /* NSCNView_h */
