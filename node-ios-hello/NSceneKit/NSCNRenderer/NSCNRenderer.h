//
//  NSCNRenderer.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNRenderer_h
#define NSCNRenderer_h    

#include "NNSObject.h"

#define js_value_SCNRenderer(x) js_value_wrapper(x, SCNRenderer)
#define to_value_SCNRenderer(x) to_value_wrapper(x, SCNRenderer)
#define is_value_SCNRenderer(x) is_value_wrapper(x, SCNRenderer)

JS_WRAP_CLASS(SCNRenderer, NSObject);
  JS_STATIC_METHOD(rendererWithContextOptions);
  JS_STATIC_METHOD(rendererWithDeviceOptions);
  JS_METHOD(renderAtTimeViewportCommandBufferPassDescriptor);
  JS_METHOD(renderAtTime);
  JS_METHOD(updateAtTime);
  JS_METHOD(renderWithViewportCommandBufferPassDescriptor);
  JS_METHOD(snapshotAtTimeWithSizeAntialiasingMode);
  JS_METHOD(updateProbesAtTime);
  JS_METHOD(render);
  JS_PROP(scene);
  JS_PROP_READONLY(nextFrameTime);
JS_WRAP_CLASS_END(SCNRenderer);

#endif /* NSCNRenderer_h */
