//
//  NSKRenderer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKRenderer_h
#define NSKRenderer_h    

/* SKRenderer is not available for WatchKit apps and the iOS simulator */
#if !TARGET_OS_SIMULATOR

#include "NNSObject.h"

#define js_value_SKRenderer(x) js_value_wrapper(x, SKRenderer)
#define to_value_SKRenderer(x) to_value_wrapper(x, SKRenderer)
#define is_value_SKRenderer(x) is_value_wrapper(x, SKRenderer)

JS_WRAP_CLASS(SKRenderer, NSObject);
  JS_STATIC_METHOD(rendererWithDevice);
  JS_METHOD(renderWithViewportCommandBufferRenderPassDescriptor);
  JS_METHOD(renderWithViewportRenderCommandEncoderRenderPassDescriptorCommandQueue);
  JS_METHOD(updateAtTime);
  JS_PROP(scene);
  JS_PROP(ignoresSiblingOrder);
  JS_PROP(shouldCullNonVisibleNodes);
  JS_PROP(showsDrawCount);
  JS_PROP(showsNodeCount);
  JS_PROP(showsQuadCount);
  JS_PROP(showsPhysics);
  JS_PROP(showsFields);
JS_WRAP_CLASS_END(SKRenderer);

#endif

#endif /* NSKRenderer_h */
