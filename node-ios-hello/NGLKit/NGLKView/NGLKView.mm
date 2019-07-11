//
//  NGLKView.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGLKView.h"

#if TARGET_OS_IPHONE

#define instancetype GLKView
#define js_value_instancetype js_value_GLKView

NGLKView::NGLKView() {}
NGLKView::~NGLKView() {}

JS_INIT_CLASS(GLKView, UIView);
  JS_ASSIGN_PROTO_METHOD(initWithFrameContext);
  JS_ASSIGN_PROTO_METHOD(bindDrawable);
  JS_ASSIGN_PROTO_METHOD(deleteDrawable);
  JS_ASSIGN_PROTO_METHOD(display);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(context);
  JS_ASSIGN_PROTO_PROP_READONLY(drawableWidth);
  JS_ASSIGN_PROTO_PROP_READONLY(drawableHeight);
  JS_ASSIGN_PROTO_PROP(drawableColorFormat);
  JS_ASSIGN_PROTO_PROP(drawableDepthFormat);
  JS_ASSIGN_PROTO_PROP(drawableStencilFormat);
  JS_ASSIGN_PROTO_PROP(drawableMultisample);
  JS_ASSIGN_PROTO_PROP_READONLY(snapshot);
  JS_ASSIGN_PROTO_PROP(enableSetNeedsDisplay);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GLKView, UIView);
  // constant values (exports)

  //typedef NS_ENUM(GLint, GLKViewDrawableColorFormat) {
    JS_ASSIGN_ENUM(GLKViewDrawableColorFormatRGBA8888, GLint); //  = 0,
    JS_ASSIGN_ENUM(GLKViewDrawableColorFormatRGB565, GLint);
    JS_ASSIGN_ENUM(GLKViewDrawableColorFormatSRGBA8888, GLint);
  //} NS_ENUM_AVAILABLE(10_8, 5_0);

  //typedef NS_ENUM(GLint, GLKViewDrawableDepthFormat) {
    JS_ASSIGN_ENUM(GLKViewDrawableDepthFormatNone, GLint); //  = 0,
    JS_ASSIGN_ENUM(GLKViewDrawableDepthFormat16, GLint);
    JS_ASSIGN_ENUM(GLKViewDrawableDepthFormat24, GLint);
  //} NS_ENUM_AVAILABLE(10_8, 5_0);

  //typedef NS_ENUM(GLint, GLKViewDrawableStencilFormat) {
    JS_ASSIGN_ENUM(GLKViewDrawableStencilFormatNone, GLint); //  = 0,
    JS_ASSIGN_ENUM(GLKViewDrawableStencilFormat8, GLint);
  //} NS_ENUM_AVAILABLE(10_8, 5_0);

  //typedef NS_ENUM(GLint, GLKViewDrawableMultisample) {
    JS_ASSIGN_ENUM(GLKViewDrawableMultisampleNone, GLint); //  = 0,
    JS_ASSIGN_ENUM(GLKViewDrawableMultisample4X, GLint);
  //} NS_ENUM_AVAILABLE(10_8, 5_0);

JS_INIT_CLASS_END(GLKView, UIView);

NAN_METHOD(NGLKView::New) {
  JS_RECONSTRUCT(GLKView);
  @autoreleasepool {
    GLKView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GLKView *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GLKView alloc] init];
    }
    if (self) {
      NGLKView *wrapper = new NGLKView();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GLKView::New: invalid arguments");
    }
  }
}

#include "NEAGLContext.h"

NAN_METHOD(NGLKView::initWithFrameContext) {
  JS_UNWRAP_OR_ALLOC(GLKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    declare_pointer(EAGLContext, context);
    JS_SET_RETURN(js_value_instancetype([self initWithFrame: frame context: context]));
  }
}

NAN_METHOD(NGLKView::bindDrawable) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    [self bindDrawable];
  }
}

NAN_METHOD(NGLKView::deleteDrawable) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    [self deleteDrawable];
  }
}

NAN_METHOD(NGLKView::display) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    [self display];
  }
}

#include "NGLKViewDelegate.h"

NAN_GETTER(NGLKView::delegateGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLKViewDelegate([self delegate]));
  }
}

NAN_SETTER(NGLKView::delegateSetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(GLKViewDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NGLKView::delegate"];
  }
}

NAN_GETTER(NGLKView::contextGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_EAGLContext([self context]));
  }
}

NAN_SETTER(NGLKView::contextSetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(EAGLContext, input);
    [self setContext: input];
  }
}

NAN_GETTER(NGLKView::drawableWidthGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self drawableWidth]));
  }
}

NAN_GETTER(NGLKView::drawableHeightGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self drawableHeight]));
  }
}

NAN_GETTER(NGLKView::drawableColorFormatGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLKViewDrawableColorFormat([self drawableColorFormat]));
  }
}

NAN_SETTER(NGLKView::drawableColorFormatSetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(GLKViewDrawableColorFormat, input);
    [self setDrawableColorFormat: input];
  }
}

NAN_GETTER(NGLKView::drawableDepthFormatGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLKViewDrawableDepthFormat([self drawableDepthFormat]));
  }
}

NAN_SETTER(NGLKView::drawableDepthFormatSetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(GLKViewDrawableDepthFormat, input);
    [self setDrawableDepthFormat: input];
  }
}

NAN_GETTER(NGLKView::drawableStencilFormatGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLKViewDrawableStencilFormat([self drawableStencilFormat]));
  }
}

NAN_SETTER(NGLKView::drawableStencilFormatSetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(GLKViewDrawableStencilFormat, input);
    [self setDrawableStencilFormat: input];
  }
}

NAN_GETTER(NGLKView::drawableMultisampleGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLKViewDrawableMultisample([self drawableMultisample]));
  }
}

NAN_SETTER(NGLKView::drawableMultisampleSetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(GLKViewDrawableMultisample, input);
    [self setDrawableMultisample: input];
  }
}

#include "NUIImage.h"

NAN_GETTER(NGLKView::snapshotGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self snapshot]));
  }
}

NAN_GETTER(NGLKView::enableSetNeedsDisplayGetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self enableSetNeedsDisplay]));
  }
}

NAN_SETTER(NGLKView::enableSetNeedsDisplaySetter) {
  JS_UNWRAP(GLKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnableSetNeedsDisplay: input];
  }
}

#endif // #if TARGET_OS_IPHONE
