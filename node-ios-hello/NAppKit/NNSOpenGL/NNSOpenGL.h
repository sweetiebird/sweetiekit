//
//  NNSOpenGL.h
//
//  Created by Shawn Presser on 7/15/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSOpenGL_h
#define NNSOpenGL_h    

#include "NNSObject.h"

#define js_value_NSOpenGLGlobalOption(x) JS_ENUM(NSOpenGLGlobalOption, uint32_t, x)
#define to_value_NSOpenGLGlobalOption(x) TO_ENUM(NSOpenGLGlobalOption, uint32_t, x)
#define is_value_NSOpenGLGlobalOption(x) IS_ENUM(NSOpenGLGlobalOption, uint32_t, x)

#define js_value_NSOpenGLPixelFormatAttribute(x) JS_ENUM(NSOpenGLPixelFormatAttribute, uint32_t, x)
#define to_value_NSOpenGLPixelFormatAttribute(x) TO_ENUM(NSOpenGLPixelFormatAttribute, uint32_t, x)
#define is_value_NSOpenGLPixelFormatAttribute(x) IS_ENUM(NSOpenGLPixelFormatAttribute, uint32_t, x)

JS_WRAP_GLOBALS(NSOpenGL);
JS_WRAP_GLOBALS_END(NSOpenGL);

#define js_value_NSOpenGLContext(x) js_value_wrapper(x, NSOpenGLContext)
#define to_value_NSOpenGLContext(x) to_value_wrapper(x, NSOpenGLContext)
#define is_value_NSOpenGLContext(x) is_value_wrapper(x, NSOpenGLContext)

#define js_value_GLbitfield js_value_uint32_t
#define to_value_GLbitfield is_value_uint32_t
#define is_value_GLbitfield to_value_uint32_t

#define js_value_GLboolean js_value_uint8_t
#define to_value_GLboolean is_value_uint8_t
#define is_value_GLboolean to_value_uint8_t

#define js_value_GLbyte js_value_int8_t
#define to_value_GLbyte is_value_int8_t
#define is_value_GLbyte to_value_int8_t

#define js_value_GLclampf js_value_float
#define to_value_GLclampf is_value_float
#define is_value_GLclampf to_value_float

#define js_value_GLenum js_value_uint32_t
#define to_value_GLenum is_value_uint32_t
#define is_value_GLenum to_value_uint32_t

#define js_value_GLfloat js_value_float
#define to_value_GLfloat is_value_float
#define is_value_GLfloat to_value_float

#define js_value_GLint js_value_int32_t
#define to_value_GLint is_value_int32_t
#define is_value_GLint to_value_int32_t

#define js_value_GLshort js_value_int16_t
#define to_value_GLshort is_value_int16_t
#define is_value_GLshort to_value_int16_t

#define js_value_GLsizei js_value_int32_t
#define to_value_GLsizei is_value_int32_t
#define is_value_GLsizei to_value_int32_t

#define js_value_GLubyte js_value_uint8_t
#define to_value_GLubyte is_value_uint8_t
#define is_value_GLubyte to_value_uint8_t

#define js_value_GLuint js_value_uint32_t
#define to_value_GLuint is_value_uint32_t
#define is_value_GLuint to_value_uint32_t

#define js_value_GLushort js_value_uint16_t
#define to_value_GLushort is_value_uint16_t
#define is_value_GLushort to_value_uint16_t

#define js_value_GLvoid js_value_void
#define to_value_GLvoid is_value_void
#define is_value_GLvoid to_value_void


JS_WRAP_CLASS(NSOpenGLContext, NSObject);
  JS_STATIC_METHOD(clearCurrentContext);
  JS_METHOD(initWithFormatShareContext);
  JS_METHOD(initWithCGLContextObj);
  JS_METHOD(setView);
  JS_METHOD(setFullScreen);
  JS_METHOD(setOffScreenWidthHeightRowbytes);
  JS_METHOD(clearDrawable);
  JS_METHOD(update);
  JS_METHOD(flushBuffer);
  JS_METHOD(makeCurrentContext);
  JS_METHOD(copyAttributesFromContextWithMask);
  JS_METHOD(setValuesForParameter);
  JS_METHOD(getValuesForParameter);
  JS_METHOD(createTextureFromViewInternalFormat);
  JS_METHOD(setPixelBufferCubeMapFaceMipMapLevelCurrentVirtualScreen);
  JS_METHOD(pixelBuffer);
  JS_METHOD(pixelBufferCubeMapFace);
  JS_METHOD(pixelBufferMipMapLevel);
  JS_METHOD(setTextureImageToPixelBufferColorBuffer);
  JS_PROP_READONLY(pixelFormat);
  JS_PROP(view);
  JS_STATIC_PROP_READONLY(currentContext);
  JS_PROP(currentVirtualScreen);
  JS_PROP_READONLY(CGLContextObj);
JS_WRAP_CLASS_END(NSOpenGLContext);

#define js_value_NSOpenGLPixelFormat(x) js_value_wrapper(x, NSOpenGLPixelFormat)
#define to_value_NSOpenGLPixelFormat(x) to_value_wrapper(x, NSOpenGLPixelFormat)
#define is_value_NSOpenGLPixelFormat(x) is_value_wrapper(x, NSOpenGLPixelFormat)

JS_WRAP_CLASS(NSOpenGLPixelFormat, NSObject);
  JS_METHOD(initWithCGLPixelFormatObj);
  JS_METHOD(initWithAttributes);
  JS_METHOD(initWithData);
  JS_METHOD(attributes);
  JS_METHOD(setAttributes);
  JS_METHOD(getValuesForAttributeForVirtualScreen);
  JS_PROP_READONLY(numberOfVirtualScreens);
  JS_PROP_READONLY(CGLPixelFormatObj);
JS_WRAP_CLASS_END(NSOpenGLPixelFormat);

#define js_value_NSOpenGLPixelBuffer(x) js_value_wrapper(x, NSOpenGLPixelBuffer)
#define to_value_NSOpenGLPixelBuffer(x) to_value_wrapper(x, NSOpenGLPixelBuffer)
#define is_value_NSOpenGLPixelBuffer(x) is_value_wrapper(x, NSOpenGLPixelBuffer)

JS_WRAP_CLASS(NSOpenGLPixelBuffer, NSObject);
  JS_METHOD(initWithTextureTargetTextureInternalFormatTextureMaxMipMapLevelPixelsWidePixelsHigh);
  JS_METHOD(initWithCGLPBufferObj);
  JS_METHOD(CGLPBufferObj);
  JS_METHOD(pixelsWide);
  JS_METHOD(pixelsHigh);
  JS_METHOD(textureTarget);
  JS_METHOD(textureInternalFormat);
  JS_METHOD(textureMaxMipMapLevel);
JS_WRAP_CLASS_END(NSOpenGLPixelBuffer);

#endif /* NNSOpenGL_h */
