//
//  NNSOpenGL.mm
//
//  Created by Shawn Presser on 7/15/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#if TARGET_OS_UIKITFORMAC
#define APPKIT_EXTERN extern "C"
#define GL_SILENCE_DEPRECATION 1
#include "NNSOpenGL_uikitformac.h"
#include "NNSOpenGL.h"

JS_INIT_GLOBALS(NSOpenGL);
  // global values (exports)

  /* Option names for NSOpenGLSetOption() and NSOpenGLGetOption() */
  //typedef NS_ENUM(uint32_t, NSOpenGLGlobalOption) {
    JS_ASSIGN_ENUM(NSOpenGLGOFormatCacheSize, uint32_t);
    JS_ASSIGN_CONSTANT("NSOpenGLGOFormatCacheSize", uint32_t, 501); //   NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14) = 501,  /* Set the size of the pixel format cache        */
    JS_ASSIGN_CONSTANT("NSOpenGLGOClearFormatCache", uint32_t, 502); //  NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14) = 502,  /* Reset the pixel format cache if true          */
    JS_ASSIGN_CONSTANT("NSOpenGLGORetainRenderers", uint32_t, 503); //   NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14) = 503,  /* Whether to retain loaded renderers in memory  */
    JS_ASSIGN_CONSTANT("NSOpenGLGOUseBuildCache", uint32_t, 506); //     NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14) = 506,  /* Enable the function compilation block cache.  Off by default.  Must be enabled at startup. */
    
    JS_ASSIGN_CONSTANT("NSOpenGLGOResetLibrary", uint32_t, 504); //      API_DEPRECATED("", macos(10.0,10.4)) = 504
  //} NS_OPENGL_DEPRECATED(10.0, 10.14);

  /*********************
   ** NSOpenGLPixelFormat
   *********************/

  /*
   ** Attribute names for [NSOpenGLPixelFormat initWithAttributes]
   ** and [NSOpenGLPixelFormat getValues:forAttribute:forVirtualScreen].
   */
  //enum {
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAllRenderers", uint32_t, 1); //           NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =   1,  /* choose from all available renderers          */
    JS_ASSIGN_CONSTANT("NSOpenGLPFATripleBuffer", uint32_t, 3); //           NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =   3,  /* choose a triple buffered pixel format        */
    JS_ASSIGN_CONSTANT("NSOpenGLPFADoubleBuffer", uint32_t, 5); //           NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =   5,  /* choose a double buffered pixel format        */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAuxBuffers", uint32_t, 7); //             NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =   7,  /* number of aux buffers                        */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAColorSize", uint32_t, 8); //              NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =   8,  /* number of color buffer bits                  */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAlphaSize", uint32_t, 11); //              NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  11,  /* number of alpha component bits               */
    JS_ASSIGN_CONSTANT("NSOpenGLPFADepthSize", uint32_t, 12); //              NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  12,  /* number of depth buffer bits                  */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAStencilSize", uint32_t, 13); //            NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  13,  /* number of stencil buffer bits                */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAccumSize", uint32_t, 14); //              NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  14,  /* number of accum buffer bits                  */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAMinimumPolicy", uint32_t, 51); //          NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  51,  /* never choose smaller buffers than requested  */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAMaximumPolicy", uint32_t, 52); //          NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  52,  /* choose largest buffers of type requested     */
    JS_ASSIGN_CONSTANT("NSOpenGLPFASampleBuffers", uint32_t, 55); //          NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  55,  /* number of multi sample buffers               */
    JS_ASSIGN_CONSTANT("NSOpenGLPFASamples", uint32_t, 56); //                NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  56,  /* number of samples per multi sample buffer    */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAuxDepthStencil", uint32_t, 57); //        NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  57,  /* each aux buffer has its own depth stencil    */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAColorFloat", uint32_t, 58); //             NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  58,  /* color buffers store floating point pixels    */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAMultisample", uint32_t, 59); //            NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  59,    /* choose multisampling                         */
    JS_ASSIGN_CONSTANT("NSOpenGLPFASupersample", uint32_t, 60); //            NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  60,    /* choose supersampling                         */
    JS_ASSIGN_CONSTANT("NSOpenGLPFASampleAlpha", uint32_t, 61); //            NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  61,    /* request alpha filtering                      */
    JS_ASSIGN_CONSTANT("NSOpenGLPFARendererID", uint32_t, 70); //             NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  70,  /* request renderer by ID                       */
    JS_ASSIGN_CONSTANT("NSOpenGLPFANoRecovery", uint32_t, 72); //             NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  72,  /* disable all failure recovery systems         */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAccelerated", uint32_t, 73); //            NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  73,  /* choose a hardware accelerated renderer       */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAClosestPolicy", uint32_t, 74); //          NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  74,  /* choose the closest color buffer to request   */
    JS_ASSIGN_CONSTANT("NSOpenGLPFABackingStore", uint32_t, 76); //           NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  76,  /* back buffer contents are valid after swap    */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAScreenMask", uint32_t, 84); //             NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  84,  /* bit mask of supported physical screens       */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAllowOfflineRenderers", uint32_t, 96); //  NS_OPENGL_ENUM_DEPRECATED(10.5, 10.14)  =  96,  /* allow use of offline renderers               */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAAcceleratedCompute", uint32_t, 97); //     NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  =  97,  /* choose a hardware accelerated compute device */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAOpenGLProfile", uint32_t, 99); //          NS_OPENGL_ENUM_DEPRECATED(10.7, 10.14)  =  99,    /* specify an OpenGL Profile to use             */
    JS_ASSIGN_CONSTANT("NSOpenGLPFAVirtualScreenCount", uint32_t, 128); //     NS_OPENGL_ENUM_DEPRECATED(10.0, 10.14)  = 128,  /* number of virtual screens in this format     */
    
    JS_ASSIGN_CONSTANT("NSOpenGLPFAStereo", uint32_t, 6); //                 API_DEPRECATED("", macos(10.0,10.12))     =   6,
    JS_ASSIGN_CONSTANT("NSOpenGLPFAOffScreen", uint32_t, 53); //              API_DEPRECATED("", macos(10.0,10.7))      =  53,
    JS_ASSIGN_CONSTANT("NSOpenGLPFAFullScreen", uint32_t, 54); //             API_DEPRECATED("", macos(10.0,10.6))      =  54,
    JS_ASSIGN_CONSTANT("NSOpenGLPFASingleRenderer", uint32_t, 71); //         API_DEPRECATED("", macos(10.0,10.9))      =  71,
    JS_ASSIGN_CONSTANT("NSOpenGLPFARobust", uint32_t, 75); //                 API_DEPRECATED("", macos(10.0,10.5))      =  75,
    JS_ASSIGN_CONSTANT("NSOpenGLPFAMPSafe", uint32_t, 78); //                 API_DEPRECATED("", macos(10.0,10.5))      =  78,
    JS_ASSIGN_CONSTANT("NSOpenGLPFAWindow", uint32_t, 80); //                 API_DEPRECATED("", macos(10.0,10.9))      =  80,
    JS_ASSIGN_CONSTANT("NSOpenGLPFAMultiScreen", uint32_t, 81); //            API_DEPRECATED("", macos(10.0,10.5))      =  81,
    JS_ASSIGN_CONSTANT("NSOpenGLPFACompliant", uint32_t, 83); //              API_DEPRECATED("", macos(10.0,10.9))      =  83,
    JS_ASSIGN_CONSTANT("NSOpenGLPFAPixelBuffer", uint32_t, 90); //            API_DEPRECATED("", macos(10.3,10.7))      =  90,
    JS_ASSIGN_CONSTANT("NSOpenGLPFARemotePixelBuffer", uint32_t, 91); //      API_DEPRECATED("", macos(10.3,10.7))      =  91,
  //};

  /* NSOpenGLPFAOpenGLProfile values */
  //enum {
    JS_ASSIGN_CONSTANT("NSOpenGLProfileVersionLegacy", uint32_t, 0x1000); //      NS_OPENGL_ENUM_DEPRECATED(10.7, 10.14)  = 0x1000,   /* choose a Legacy/Pre-OpenGL 3.0 Implementation */
    JS_ASSIGN_CONSTANT("NSOpenGLProfileVersion3_2Core", uint32_t, 0x3200); //     NS_OPENGL_ENUM_DEPRECATED(10.7, 10.14)  = 0x3200,   /* choose an OpenGL 3.2 Core Implementation      */
    JS_ASSIGN_CONSTANT("NSOpenGLProfileVersion4_1Core", uint32_t, 0x4100); //     NS_OPENGL_ENUM_DEPRECATED(10.10, 10.14) = 0x4100    /* choose an OpenGL 4.1 Core Implementation      */
  //};

JS_INIT_GLOBALS_END(NSOpenGL);

#define instancetype NSOpenGLContext
#define js_value_instancetype js_value_NSOpenGLContext

NNSOpenGLContext::NNSOpenGLContext() {}
NNSOpenGLContext::~NNSOpenGLContext() {}

JS_INIT_CLASS(NSOpenGLContext, NSObject);
  JS_ASSIGN_STATIC_METHOD(clearCurrentContext);
  JS_ASSIGN_PROTO_METHOD(initWithFormatShareContext);
  JS_ASSIGN_PROTO_METHOD(initWithCGLContextObj);
  JS_ASSIGN_PROTO_METHOD(setView);
  JS_ASSIGN_PROTO_METHOD(setFullScreen);
  JS_ASSIGN_PROTO_METHOD(setOffScreenWidthHeightRowbytes);
  JS_ASSIGN_PROTO_METHOD(clearDrawable);
  JS_ASSIGN_PROTO_METHOD(update);
  JS_ASSIGN_PROTO_METHOD(flushBuffer);
  JS_ASSIGN_PROTO_METHOD(makeCurrentContext);
  JS_ASSIGN_PROTO_METHOD(copyAttributesFromContextWithMask);
  JS_ASSIGN_PROTO_METHOD(setValuesForParameter);
  JS_ASSIGN_PROTO_METHOD(getValuesForParameter);
  JS_ASSIGN_PROTO_METHOD(createTextureFromViewInternalFormat);
  JS_ASSIGN_PROTO_METHOD(setPixelBufferCubeMapFaceMipMapLevelCurrentVirtualScreen);
  JS_ASSIGN_PROTO_METHOD(pixelBuffer);
  JS_ASSIGN_PROTO_METHOD(pixelBufferCubeMapFace);
  JS_ASSIGN_PROTO_METHOD(pixelBufferMipMapLevel);
  JS_ASSIGN_PROTO_METHOD(setTextureImageToPixelBufferColorBuffer);
  JS_ASSIGN_PROTO_PROP_READONLY(pixelFormat);
  JS_ASSIGN_PROTO_PROP(view);
  JS_ASSIGN_STATIC_PROP_READONLY(currentContext);
  JS_ASSIGN_PROTO_PROP(currentVirtualScreen);
  JS_ASSIGN_PROTO_PROP_READONLY(CGLContextObj);
JS_INIT_CLASS_END(NSOpenGLContext, NSObject)

NAN_METHOD(NNSOpenGLContext::New) {
  JS_RECONSTRUCT(NSOpenGLContext);
  @autoreleasepool {
    NSOpenGLContext* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSOpenGLContext *)(info[0].As<External>()->Value());
    }
    if (self) {
      NNSOpenGLContext *wrapper = new NNSOpenGLContext();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSOpenGLContext::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSOpenGLContext::clearCurrentContext) {
  declare_autoreleasepool {
    [NSOpenGLContext clearCurrentContext];
  }
}

NAN_METHOD(NNSOpenGLContext::initWithFormatShareContext) {
  JS_UNWRAP_OR_ALLOC(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSOpenGLPixelFormat, format);
    declare_nullable_pointer(NSOpenGLContext, share);
    JS_SET_RETURN(js_value_instancetype([self initWithFormat: format shareContext: share]));
  }
}

#define js_value_CGLContextObject(x) Nan::New<External>((void*)x)
#define to_value_CGLContextObject(x) (struct _CGLContextObject*)((x).As<External>()->Value())
#define is_value_CGLContextObject(x) (x)->IsExternal()
typedef struct _CGLContextObject CGLContextObject;

NAN_METHOD(NNSOpenGLContext::initWithCGLContextObj) {
  JS_UNWRAP_OR_ALLOC(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CGLContextObject, context);
    JS_SET_RETURN(js_value_NSOpenGLContext([self initWithCGLContextObj: context]));
  }
}

#define js_value_NSView(x) js_value_wrapper_unknown(x, NSView)
#define to_value_NSView(x) to_value_wrapper_unknown(x, NSView)
#define is_value_NSView(x) is_value_wrapper_unknown(x, NSView)

NAN_METHOD(NNSOpenGLContext::setView) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSView, view);
    [self setView: view];
  }
}

NAN_METHOD(NNSOpenGLContext::setFullScreen) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    [self setFullScreen];
  }
}

NAN_METHOD(NNSOpenGLContext::setOffScreenWidthHeightRowbytes) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(void, baseaddr);
    declare_value(GLsizei, width);
    declare_value(GLsizei, height);
    declare_value(GLint, rowbytes);
    [self setOffScreen: baseaddr width: width height: height rowbytes: rowbytes];
    #endif
  }
}

NAN_METHOD(NNSOpenGLContext::clearDrawable) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    [self clearDrawable];
  }
}

NAN_METHOD(NNSOpenGLContext::update) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    [self update];
  }
}

NAN_METHOD(NNSOpenGLContext::flushBuffer) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    [self flushBuffer];
  }
}

NAN_METHOD(NNSOpenGLContext::makeCurrentContext) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    [self makeCurrentContext];
  }
}

NAN_METHOD(NNSOpenGLContext::copyAttributesFromContextWithMask) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSOpenGLContext, context);
    declare_value(GLbitfield, mask);
    [self copyAttributesFromContext: context withMask: mask];
  }
}

NAN_METHOD(NNSOpenGLContext::setValuesForParameter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(const-GLint, vals);
    declare_value(NSOpenGLContextParameter, param);
    [self setValues: vals forParameter: param];
    #endif
  }
}

NAN_METHOD(NNSOpenGLContext::getValuesForParameter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(GLint, vals);
    declare_value(NSOpenGLContextParameter, param);
    [self getValues: vals forParameter: param];
    #endif
  }
}

NAN_METHOD(NNSOpenGLContext::createTextureFromViewInternalFormat) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(GLenum, target);
    declare_pointer(NSView, view);
    declare_value(GLenum, format);
    [self createTexture: target fromView: view internalFormat: format];
  }
}

NAN_METHOD(NNSOpenGLContext::setPixelBufferCubeMapFaceMipMapLevelCurrentVirtualScreen) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSOpenGLPixelBuffer, pixelBuffer);
    declare_value(GLenum, face);
    declare_value(GLint, level);
    declare_value(GLint, screen);
    [self setPixelBuffer: pixelBuffer cubeMapFace: face mipMapLevel: level currentVirtualScreen: screen];
  }
}

NAN_METHOD(NNSOpenGLContext::pixelBuffer) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSOpenGLPixelBuffer([self pixelBuffer]));
  }
}

NAN_METHOD(NNSOpenGLContext::pixelBufferCubeMapFace) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLenum([self pixelBufferCubeMapFace]));
  }
}

NAN_METHOD(NNSOpenGLContext::pixelBufferMipMapLevel) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLint([self pixelBufferMipMapLevel]));
  }
}

NAN_METHOD(NNSOpenGLContext::setTextureImageToPixelBufferColorBuffer) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSOpenGLPixelBuffer, pixelBuffer);
    declare_value(GLenum, source);
    [self setTextureImageToPixelBuffer: pixelBuffer colorBuffer: source];
  }
}

NAN_GETTER(NNSOpenGLContext::pixelFormatGetter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSOpenGLPixelFormat([self pixelFormat]));
  }
}

NAN_GETTER(NNSOpenGLContext::viewGetter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSView([self view]));
  }
}

NAN_SETTER(NNSOpenGLContext::viewSetter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSView, input);
    [self setView: input];
  }
}

NAN_GETTER(NNSOpenGLContext::currentContextGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSOpenGLContext([NSOpenGLContext currentContext]));
  }
}

NAN_GETTER(NNSOpenGLContext::currentVirtualScreenGetter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLint([self currentVirtualScreen]));
  }
}

NAN_SETTER(NNSOpenGLContext::currentVirtualScreenSetter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(GLint, input);
    [self setCurrentVirtualScreen: input];
  }
}

NAN_GETTER(NNSOpenGLContext::CGLContextObjGetter) {
  JS_UNWRAP(NSOpenGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGLContextObject([self CGLContextObj]));
  }
}



#undef instancetype
#undef js_value_instancetype

#define instancetype NSOpenGLPixelFormat
#define js_value_instancetype js_value_NSOpenGLPixelFormat

NNSOpenGLPixelFormat::NNSOpenGLPixelFormat() {}
NNSOpenGLPixelFormat::~NNSOpenGLPixelFormat() {}

JS_INIT_CLASS(NSOpenGLPixelFormat, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithCGLPixelFormatObj);
  JS_ASSIGN_PROTO_METHOD(initWithAttributes);
  JS_ASSIGN_PROTO_METHOD(initWithData);
  JS_ASSIGN_PROTO_METHOD(attributes);
  JS_ASSIGN_PROTO_METHOD(setAttributes);
  JS_ASSIGN_PROTO_METHOD(getValuesForAttributeForVirtualScreen);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfVirtualScreens);
  JS_ASSIGN_PROTO_PROP_READONLY(CGLPixelFormatObj);
JS_INIT_CLASS_END(NSOpenGLPixelFormat, NSObject)

NAN_METHOD(NNSOpenGLPixelFormat::New) {
  JS_RECONSTRUCT(NSOpenGLPixelFormat);
  @autoreleasepool {
    NSOpenGLPixelFormat* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSOpenGLPixelFormat *)(info[0].As<External>()->Value());
    }
    if (self) {
      NNSOpenGLPixelFormat *wrapper = new NNSOpenGLPixelFormat();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSOpenGLPixelFormat::New: invalid arguments");
    }
  }
}

#define js_value_CGLPixelFormatObject(x) Nan::New<External>((void*)x)
#define to_value_CGLPixelFormatObject(x) (struct _CGLPixelFormatObject*)((x).As<External>()->Value())
#define is_value_CGLPixelFormatObject(x) (x)->IsExternal()
typedef struct _CGLPixelFormatObject CGLPixelFormatObject;

NAN_METHOD(NNSOpenGLPixelFormat::initWithCGLPixelFormatObj) {
  JS_UNWRAP_OR_ALLOC(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CGLPixelFormatObject, format);
    JS_SET_RETURN(js_value_NSOpenGLPixelFormat([self initWithCGLPixelFormatObj: format]));
  }
}

#include "SWTUtils.h"

NAN_METHOD(NNSOpenGLPixelFormat::initWithAttributes) {
  JS_UNWRAP_OR_ALLOC(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(const_uint32_t_ptr, attribs);
    
    JS_SET_RETURN(js_value_instancetype([self initWithAttributes: attribs]));
  }
}

NAN_METHOD(NNSOpenGLPixelFormat::initWithData) {
  JS_UNWRAP_OR_ALLOC(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, attribs);
    JS_SET_RETURN(js_value_id([self initWithData: attribs]));
  }
}

NAN_METHOD(NNSOpenGLPixelFormat::attributes) {
  JS_UNWRAP(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self attributes]));
  }
}

NAN_METHOD(NNSOpenGLPixelFormat::setAttributes) {
  JS_UNWRAP(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, attribs);
    [self setAttributes: attribs];
  }
}

NAN_METHOD(NNSOpenGLPixelFormat::getValuesForAttributeForVirtualScreen) {
  JS_UNWRAP(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(GLint, vals);
    declare_value(NSOpenGLPixelFormatAttribute, attrib);
    declare_value(GLint, screen);
    [self getValues: vals forAttribute: attrib forVirtualScreen: screen];
    #endif
  }
}

NAN_GETTER(NNSOpenGLPixelFormat::numberOfVirtualScreensGetter) {
  JS_UNWRAP(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLint([self numberOfVirtualScreens]));
  }
}

NAN_GETTER(NNSOpenGLPixelFormat::CGLPixelFormatObjGetter) {
  JS_UNWRAP(NSOpenGLPixelFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGLPixelFormatObject([self CGLPixelFormatObj]));
  }
}



#undef instancetype
#undef js_value_instancetype

#define instancetype NSOpenGLPixelBuffer
#define js_value_instancetype js_value_NSOpenGLPixelBuffer

NNSOpenGLPixelBuffer::NNSOpenGLPixelBuffer() {}
NNSOpenGLPixelBuffer::~NNSOpenGLPixelBuffer() {}

JS_INIT_CLASS(NSOpenGLPixelBuffer, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithTextureTargetTextureInternalFormatTextureMaxMipMapLevelPixelsWidePixelsHigh);
  JS_ASSIGN_PROTO_METHOD(initWithCGLPBufferObj);
  JS_ASSIGN_PROTO_METHOD(CGLPBufferObj);
  JS_ASSIGN_PROTO_METHOD(pixelsWide);
  JS_ASSIGN_PROTO_METHOD(pixelsHigh);
  JS_ASSIGN_PROTO_METHOD(textureTarget);
  JS_ASSIGN_PROTO_METHOD(textureInternalFormat);
  JS_ASSIGN_PROTO_METHOD(textureMaxMipMapLevel);
JS_INIT_CLASS_END(NSOpenGLPixelBuffer, NSObject)

NAN_METHOD(NNSOpenGLPixelBuffer::New) {
  JS_RECONSTRUCT(NSOpenGLPixelBuffer);
  @autoreleasepool {
    NSOpenGLPixelBuffer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSOpenGLPixelBuffer *)(info[0].As<External>()->Value());
    }
    if (self) {
      NNSOpenGLPixelBuffer *wrapper = new NNSOpenGLPixelBuffer();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSOpenGLPixelBuffer::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSOpenGLPixelBuffer::initWithTextureTargetTextureInternalFormatTextureMaxMipMapLevelPixelsWidePixelsHigh) {
  JS_UNWRAP_OR_ALLOC(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(GLenum, target);
    declare_value(GLenum, format);
    declare_value(GLint, maxLevel);
    declare_value(GLsizei, pixelsWide);
    declare_value(GLsizei, pixelsHigh);
    JS_SET_RETURN(js_value_instancetype([self initWithTextureTarget: target textureInternalFormat: format textureMaxMipMapLevel: maxLevel pixelsWide: pixelsWide pixelsHigh: pixelsHigh]));
  }
}

#define js_value_CGLPBufferObject(x) Nan::New<External>((void*)x)
#define to_value_CGLPBufferObject(x) (struct _CGLPBufferObject*)((x).As<External>()->Value())
#define is_value_CGLPBufferObject(x) (x)->IsExternal()
typedef struct _CGLPBufferObject CGLPBufferObject;

NAN_METHOD(NNSOpenGLPixelBuffer::initWithCGLPBufferObj) {
  JS_UNWRAP_OR_ALLOC(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CGLPBufferObject, pbuffer);
    JS_SET_RETURN(js_value_NSOpenGLPixelBuffer([self initWithCGLPBufferObj: pbuffer]));
  }
}

NAN_METHOD(NNSOpenGLPixelBuffer::CGLPBufferObj) {
  JS_UNWRAP(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGLPBufferObject([self CGLPBufferObj]));
  }
}

NAN_METHOD(NNSOpenGLPixelBuffer::pixelsWide) {
  JS_UNWRAP(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLsizei([self pixelsWide]));
  }
}

NAN_METHOD(NNSOpenGLPixelBuffer::pixelsHigh) {
  JS_UNWRAP(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLsizei([self pixelsHigh]));
  }
}

NAN_METHOD(NNSOpenGLPixelBuffer::textureTarget) {
  JS_UNWRAP(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLenum([self textureTarget]));
  }
}

NAN_METHOD(NNSOpenGLPixelBuffer::textureInternalFormat) {
  JS_UNWRAP(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLenum([self textureInternalFormat]));
  }
}

NAN_METHOD(NNSOpenGLPixelBuffer::textureMaxMipMapLevel) {
  JS_UNWRAP(NSOpenGLPixelBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLint([self textureMaxMipMapLevel]));
  }
}


#include <AppKit/NSOpenGL.h>
#endif
