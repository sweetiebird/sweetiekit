//
//  NGLKView.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGLKView_h
#define NGLKView_h    

#include "NUIView.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define js_value_GLKView(x) js_value_wrapper(x, GLKView)
#define to_value_GLKView(x) to_value_wrapper(x, GLKView)
#define is_value_GLKView(x) is_value_wrapper(x, GLKView)

#define js_value_GLint js_value_int32_t
#define to_value_GLint to_value_int32_t
#define is_value_GLint is_value_int32_t

#define js_value_GLKViewDrawableColorFormat(x) JS_ENUM(GLKViewDrawableColorFormat, GLint, x)
#define to_value_GLKViewDrawableColorFormat(x) TO_ENUM(GLKViewDrawableColorFormat, GLint, x)
#define is_value_GLKViewDrawableColorFormat(x) IS_ENUM(GLKViewDrawableColorFormat, GLint, x)

#define js_value_GLKViewDrawableDepthFormat(x) JS_ENUM(GLKViewDrawableDepthFormat, GLint, x)
#define to_value_GLKViewDrawableDepthFormat(x) TO_ENUM(GLKViewDrawableDepthFormat, GLint, x)
#define is_value_GLKViewDrawableDepthFormat(x) IS_ENUM(GLKViewDrawableDepthFormat, GLint, x)

#define js_value_GLKViewDrawableStencilFormat(x) JS_ENUM(GLKViewDrawableStencilFormat, GLint, x)
#define to_value_GLKViewDrawableStencilFormat(x) TO_ENUM(GLKViewDrawableStencilFormat, GLint, x)
#define is_value_GLKViewDrawableStencilFormat(x) IS_ENUM(GLKViewDrawableStencilFormat, GLint, x)

#define js_value_GLKViewDrawableMultisample(x) JS_ENUM(GLKViewDrawableMultisample, GLint, x)
#define to_value_GLKViewDrawableMultisample(x) TO_ENUM(GLKViewDrawableMultisample, GLint, x)
#define is_value_GLKViewDrawableMultisample(x) IS_ENUM(GLKViewDrawableMultisample, GLint, x)

JS_WRAP_CLASS(GLKView, UIView);
  JS_METHOD(initWithFrameContext);
  JS_METHOD(bindDrawable);
  JS_METHOD(deleteDrawable);
  JS_METHOD(display);
  JS_PROP(delegate);
  JS_PROP(context);
  JS_PROP_READONLY(drawableWidth);
  JS_PROP_READONLY(drawableHeight);
  JS_PROP(drawableColorFormat);
  JS_PROP(drawableDepthFormat);
  JS_PROP(drawableStencilFormat);
  JS_PROP(drawableMultisample);
  JS_PROP_READONLY(snapshot);
  JS_PROP(enableSetNeedsDisplay);
JS_WRAP_CLASS_END(GLKView);

#endif

#endif /* NGLKView_h */
