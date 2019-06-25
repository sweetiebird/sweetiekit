//
//  NMTKView.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTKView_h
#define NMTKView_h    

#include "NUIView.h"

#define js_value_MTKView(x) js_value_wrapper(x, MTKView)
#define to_value_MTKView(x) to_value_wrapper(x, MTKView)
#define is_value_MTKView(x) is_value_wrapper(x, MTKView)

JS_WRAP_CLASS(MTKView, UIView);
  JS_METHOD(initWithFrameDevice);
  JS_METHOD(initWithCoder);
  JS_METHOD(releaseDrawables);
  JS_METHOD(draw);
  JS_PROP(delegate);
  JS_PROP(device);
  JS_PROP_READONLY(currentDrawable);
  JS_PROP(framebufferOnly);
  JS_PROP(presentsWithTransaction);
  JS_PROP(colorPixelFormat);
  JS_PROP(depthStencilPixelFormat);
  JS_PROP(sampleCount);
  JS_PROP(clearColor);
  JS_PROP(clearDepth);
  JS_PROP(clearStencil);
  JS_PROP_READONLY(depthStencilTexture);
  JS_PROP_READONLY(multisampleColorTexture);
  JS_PROP_READONLY(currentRenderPassDescriptor);
  JS_PROP(preferredFramesPerSecond);
  JS_PROP(enableSetNeedsDisplay);
  JS_PROP(autoResizeDrawable);
  JS_PROP(drawableSize);
  JS_PROP(isPaused);
  JS_PROP(colorspace);
JS_WRAP_CLASS_END(MTKView);

#endif /* NMTKView_h */
