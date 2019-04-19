//
//  NNSObject.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "NNSObject.h"

Nan::Persistent<FunctionTemplate> NNSObject::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSObject::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(NNSObject::New);

  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSObject"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
#if 0
  Nan::SetMethod(proto, "destroy", Destroy);
  Nan::SetMethod(proto, "getWindowHandle", GetWindowHandle);
  Nan::SetMethod(proto, "setWindowHandle", SetWindowHandle);
  Nan::SetMethod(proto, "setDefaultVao", SetDefaultVao);
  Nan::SetMethod(proto, "isDirty", IsDirty);
  Nan::SetMethod(proto, "clearDirty", ClearDirty);

  Nan::SetMethod(proto, "uniform1f", glCallWrap<Uniform1f>);
  Nan::SetMethod(proto, "uniform2f", glCallWrap<Uniform2f>);
  Nan::SetMethod(proto, "uniform3f", glCallWrap<Uniform3f>);
  Nan::SetMethod(proto, "uniform4f", glCallWrap<Uniform4f>);
  Nan::SetMethod(proto, "uniform1i", glCallWrap<Uniform1i>);
  Nan::SetMethod(proto, "uniform2i", glCallWrap<Uniform2i>);
  Nan::SetMethod(proto, "uniform3i", glCallWrap<Uniform3i>);
  Nan::SetMethod(proto, "uniform4i", glCallWrap<Uniform4i>);
  Nan::SetMethod(proto, "uniform1ui", glCallWrap<Uniform1ui>);
  Nan::SetMethod(proto, "uniform2ui", glCallWrap<Uniform2ui>);
  Nan::SetMethod(proto, "uniform3ui", glCallWrap<Uniform3ui>);
  Nan::SetMethod(proto, "uniform4ui", glCallWrap<Uniform4ui>);
  Nan::SetMethod(proto, "uniform1fv", glCallWrap<Uniform1fv>);
  Nan::SetMethod(proto, "uniform2fv", glCallWrap<Uniform2fv>);
  Nan::SetMethod(proto, "uniform3fv", glCallWrap<Uniform3fv>);
  Nan::SetMethod(proto, "uniform4fv", glCallWrap<Uniform4fv>);
  Nan::SetMethod(proto, "uniform1iv", glCallWrap<Uniform1iv>);
  Nan::SetMethod(proto, "uniform2iv", glCallWrap<Uniform2iv>);
  Nan::SetMethod(proto, "uniform3iv", glCallWrap<Uniform3iv>);
  Nan::SetMethod(proto, "uniform4iv", glCallWrap<Uniform4iv>);

  Nan::SetMethod(proto, "uniform1uiv", glCallWrap<Uniform1uiv>);
  Nan::SetMethod(proto, "uniform2uiv", glCallWrap<Uniform2uiv>);
  Nan::SetMethod(proto, "uniform3uiv", glCallWrap<Uniform3uiv>);
  Nan::SetMethod(proto, "uniform4uiv", glCallWrap<Uniform4uiv>);
  Nan::SetMethod(proto, "uniformMatrix2fv", glCallWrap<UniformMatrix2fv>);
  Nan::SetMethod(proto, "uniformMatrix3fv", glCallWrap<UniformMatrix3fv>);
  Nan::SetMethod(proto, "uniformMatrix4fv", glCallWrap<UniformMatrix4fv>);
  Nan::SetMethod(proto, "uniformMatrix3x2fv", glCallWrap<UniformMatrix3x2fv>);
  Nan::SetMethod(proto, "uniformMatrix4x2fv", glCallWrap<UniformMatrix4x2fv>);
  Nan::SetMethod(proto, "uniformMatrix2x3fv", glCallWrap<UniformMatrix2x3fv>);
  Nan::SetMethod(proto, "uniformMatrix4x3fv", glCallWrap<UniformMatrix4x3fv>);
  Nan::SetMethod(proto, "uniformMatrix2x4fv", glCallWrap<UniformMatrix2x4fv>);
  Nan::SetMethod(proto, "uniformMatrix3x4fv", glCallWrap<UniformMatrix3x4fv>);

  Nan::SetMethod(proto, "pixelStorei", glCallWrap<PixelStorei>);
  Nan::SetMethod(proto, "bindAttribLocation", glCallWrap<BindAttribLocation>);
  Nan::SetMethod(proto, "getError", glCallWrap<GetError>);
  Nan::SetMethod(proto, "drawArrays", glCallWrap<DrawArrays>);
  Nan::SetMethod(proto, "drawArraysInstanced", glCallWrap<DrawArraysInstanced>);
  Nan::SetMethod(proto, "drawArraysInstancedANGLE", glCallWrap<DrawArraysInstancedANGLE>);

  Nan::SetMethod(proto, "generateMipmap", glCallWrap<GenerateMipmap>);

  Nan::SetMethod(proto, "getAttribLocation", glCallWrap<GetAttribLocation>);
  Nan::SetMethod(proto, "depthFunc", glCallWrap<DepthFunc>);
  Nan::SetMethod(proto, "viewport", glCallWrap<Viewport>);
  Nan::SetMethod(proto, "createShader", glCallWrap<CreateShader>);
  Nan::SetMethod(proto, "shaderSource", glCallWrap<ShaderSource>);
  Nan::SetMethod(proto, "compileShader", glCallWrap<CompileShader>);
  Nan::SetMethod(proto, "getShaderParameter", glCallWrap<GetShaderParameter>);
  Nan::SetMethod(proto, "getShaderInfoLog", glCallWrap<GetShaderInfoLog>);
  Nan::SetMethod(proto, "createProgram", glCallWrap<CreateProgram>);
  Nan::SetMethod(proto, "attachShader", glCallWrap<AttachShader>);
  Nan::SetMethod(proto, "linkProgram", glCallWrap<LinkProgram>);
  Nan::SetMethod(proto, "getProgramParameter", glCallWrap<GetProgramParameter>);
  Nan::SetMethod(proto, "getUniformLocation", glCallWrap<GetUniformLocation>);
  Nan::SetMethod(proto, "getUniformBlockIndex", glCallWrap<GetUniformBlockIndex>);
  Nan::SetMethod(proto, "uniformBlockBinding", glCallWrap<UniformBlockBinding>);
  Nan::SetMethod(proto, "getUniform", glCallWrap<GetUniform>);
  Nan::SetMethod(proto, "clearColor", glCallWrap<ClearColor>);
  Nan::SetMethod(proto, "clearDepth", glCallWrap<ClearDepth>);

  Nan::SetMethod(proto, "disable", glCallWrap<Disable>);
  Nan::SetMethod(proto, "createTexture", glCallWrap<CreateTexture>);
  Nan::SetMethod(proto, "bindTexture", glCallWrap<BindTexture>);
  // Nan::SetMethod(proto, "flipTextureData", glCallWrap<FlipTextureData>);
  Nan::SetMethod(proto, "texImage2D", glCallWrap<TexImage2D>);
  Nan::SetMethod(proto, "compressedTexImage2D", glCallWrap<CompressedTexImage2D>);
  Nan::SetMethod(proto, "texParameteri", glCallWrap<TexParameteri>);
  Nan::SetMethod(proto, "texParameterf", glCallWrap<TexParameterf>);
  Nan::SetMethod(proto, "clear", glCallWrap<Clear>);
  Nan::SetMethod(proto, "useProgram", glCallWrap<UseProgram>);
  Nan::SetMethod(proto, "createFramebuffer", glCallWrap<CreateFramebuffer>);
  Nan::SetMethod(proto, "bindFramebuffer", glCallWrap<BindFramebuffer>);
  Nan::SetMethod(proto, "bindFramebufferRaw", glCallWrap<BindFramebufferRaw>);
  Nan::SetMethod(proto, "framebufferTexture2D", glCallWrap<FramebufferTexture2D>);
  Nan::SetMethod(proto, "blitFramebuffer", glCallWrap<BlitFramebuffer>);
  Nan::SetMethod(proto, "createBuffer", glCallWrap<CreateBuffer>);
  Nan::SetMethod(proto, "bindBuffer", glCallWrap<BindBuffer>);
  Nan::SetMethod(proto, "bindBufferBase", glCallWrap<BindBufferBase>);
  Nan::SetMethod(proto, "bufferData", glCallWrap<BufferData>);
  Nan::SetMethod(proto, "bufferSubData", glCallWrap<BufferSubData>);
  Nan::SetMethod(proto, "enable", glCallWrap<Enable>);
  Nan::SetMethod(proto, "blendEquation", glCallWrap<BlendEquation>);
  Nan::SetMethod(proto, "blendFunc", glCallWrap<BlendFunc>);
  Nan::SetMethod(proto, "enableVertexAttribArray", glCallWrap<EnableVertexAttribArray>);
  Nan::SetMethod(proto, "vertexAttribPointer", glCallWrap<VertexAttribPointer>);
  Nan::SetMethod(proto, "vertexAttribIPointer", glCallWrap<VertexAttribIPointer>);
  Nan::SetMethod(proto, "activeTexture", glCallWrap<ActiveTexture>);
  Nan::SetMethod(proto, "drawElements", glCallWrap<DrawElements>);
  Nan::SetMethod(proto, "drawElementsInstanced", glCallWrap<DrawElementsInstanced>);
  Nan::SetMethod(proto, "drawElementsInstancedANGLE", glCallWrap<DrawElementsInstancedANGLE>);
  Nan::SetMethod(proto, "drawRangeElements", glCallWrap<DrawRangeElements>);
  Nan::SetMethod(proto, "flush", glCallWrap<Flush>);
  Nan::SetMethod(proto, "finish", glCallWrap<Finish>);

  Nan::SetMethod(proto, "vertexAttrib1f", glCallWrap<VertexAttrib1f>);
  Nan::SetMethod(proto, "vertexAttrib2f", glCallWrap<VertexAttrib2f>);
  Nan::SetMethod(proto, "vertexAttrib3f", glCallWrap<VertexAttrib3f>);
  Nan::SetMethod(proto, "vertexAttrib4f", glCallWrap<VertexAttrib4f>);
  Nan::SetMethod(proto, "vertexAttrib1fv", glCallWrap<VertexAttrib1fv>);
  Nan::SetMethod(proto, "vertexAttrib2fv", glCallWrap<VertexAttrib2fv>);
  Nan::SetMethod(proto, "vertexAttrib3fv", glCallWrap<VertexAttrib3fv>);
  Nan::SetMethod(proto, "vertexAttrib4fv", glCallWrap<VertexAttrib4fv>);

  Nan::SetMethod(proto, "vertexAttribI4i", glCallWrap<VertexAttribI4i>);
  Nan::SetMethod(proto, "vertexAttribI4iv", glCallWrap<VertexAttribI4iv>);
  Nan::SetMethod(proto, "vertexAttribI4ui", glCallWrap<VertexAttribI4ui>);
  Nan::SetMethod(proto, "vertexAttribI4uiv", glCallWrap<VertexAttribI4uiv>);

  Nan::SetMethod(proto, "vertexAttribDivisor", glCallWrap<VertexAttribDivisor>);
  Nan::SetMethod(proto, "vertexAttribDivisorANGLE", glCallWrap<VertexAttribDivisorANGLE>);
  Nan::SetMethod(proto, "drawBuffers", glCallWrap<DrawBuffers>);
  Nan::SetMethod(proto, "drawBuffersWEBGL", glCallWrap<DrawBuffersWEBGL>);

  Nan::SetMethod(proto, "blendColor", glCallWrap<BlendColor>);
  Nan::SetMethod(proto, "blendEquationSeparate", glCallWrap<BlendEquationSeparate>);
  Nan::SetMethod(proto, "blendFuncSeparate", glCallWrap<BlendFuncSeparate>);
  Nan::SetMethod(proto, "clearStencil", glCallWrap<ClearStencil>);
  Nan::SetMethod(proto, "colorMask", glCallWrap<ColorMask>);
  Nan::SetMethod(proto, "copyTexImage2D", glCallWrap<CopyTexImage2D>);
  Nan::SetMethod(proto, "copyTexSubImage2D", glCallWrap<CopyTexSubImage2D>);
  Nan::SetMethod(proto, "cullFace", glCallWrap<CullFace>);
  Nan::SetMethod(proto, "depthMask", glCallWrap<DepthMask>);
  Nan::SetMethod(proto, "depthRange", glCallWrap<DepthRange>);
  Nan::SetMethod(proto, "disableVertexAttribArray", glCallWrap<DisableVertexAttribArray>);
  Nan::SetMethod(proto, "hint", glCallWrap<Hint>);
  Nan::SetMethod(proto, "isEnabled", glCallWrap<IsEnabled>);
  Nan::SetMethod(proto, "lineWidth", glCallWrap<LineWidth>);
  Nan::SetMethod(proto, "polygonOffset", glCallWrap<PolygonOffset>);

  Nan::SetMethod(proto, "scissor", glCallWrap<Scissor>);
  Nan::SetMethod(proto, "stencilFunc", glCallWrap<StencilFunc>);
  Nan::SetMethod(proto, "stencilFuncSeparate", glCallWrap<StencilFuncSeparate>);
  Nan::SetMethod(proto, "stencilMask", glCallWrap<StencilMask>);
  Nan::SetMethod(proto, "stencilMaskSeparate", glCallWrap<StencilMaskSeparate>);
  Nan::SetMethod(proto, "stencilOp", glCallWrap<StencilOp>);
  Nan::SetMethod(proto, "stencilOpSeparate", glCallWrap<StencilOpSeparate>);
  Nan::SetMethod(proto, "bindRenderbuffer", glCallWrap<BindRenderbuffer>);
  Nan::SetMethod(proto, "createRenderbuffer", glCallWrap<CreateRenderbuffer>);

  Nan::SetMethod(proto, "deleteBuffer", glCallWrap<DeleteBuffer>);
  Nan::SetMethod(proto, "deleteFramebuffer", glCallWrap<DeleteFramebuffer>);
  Nan::SetMethod(proto, "deleteProgram", glCallWrap<DeleteProgram>);
  Nan::SetMethod(proto, "deleteRenderbuffer", glCallWrap<DeleteRenderbuffer>);
  Nan::SetMethod(proto, "deleteShader", glCallWrap<DeleteShader>);
  Nan::SetMethod(proto, "deleteTexture", glCallWrap<DeleteTexture>);
  Nan::SetMethod(proto, "detachShader", glCallWrap<DetachShader>);
  Nan::SetMethod(proto, "framebufferRenderbuffer", glCallWrap<FramebufferRenderbuffer>);
  Nan::SetMethod(proto, "getVertexAttribOffset", glCallWrap<GetVertexAttribOffset>);
  Nan::SetMethod(proto, "getShaderPrecisionFormat", glCallWrap<GetShaderPrecisionFormat>);

  Nan::SetMethod(proto, "isBuffer", glCallWrap<IsBuffer>);
  Nan::SetMethod(proto, "isFramebuffer", glCallWrap<IsFramebuffer>);
  Nan::SetMethod(proto, "isProgram", glCallWrap<IsProgram>);
  Nan::SetMethod(proto, "isRenderbuffer", glCallWrap<IsRenderbuffer>);
  Nan::SetMethod(proto, "isShader", glCallWrap<IsShader>);
  Nan::SetMethod(proto, "isTexture", glCallWrap<IsTexture>);
  Nan::SetMethod(proto, "isVertexArray", glCallWrap<IsVertexArray>);
  Nan::SetMethod(proto, "isSync", glCallWrap<IsSync>);

  Nan::SetMethod(proto, "renderbufferStorage", glCallWrap<RenderbufferStorage>);
  Nan::SetMethod(proto, "getShaderSource", glCallWrap<GetShaderSource>);
  Nan::SetMethod(proto, "validateProgram", glCallWrap<ValidateProgram>);

  Nan::SetMethod(proto, "texSubImage2D", glCallWrap<TexSubImage2D>);
  Nan::SetMethod(proto, "texStorage2D", glCallWrap<TexStorage2D>);

  Nan::SetMethod(proto, "readPixels", glCallWrap<ReadPixels>);
  Nan::SetMethod(proto, "getTexParameter", glCallWrap<GetTexParameter>);
  Nan::SetMethod(proto, "getActiveAttrib", glCallWrap<GetActiveAttrib>);
  Nan::SetMethod(proto, "getActiveUniform", glCallWrap<GetActiveUniform>);
  Nan::SetMethod(proto, "getAttachedShaders", glCallWrap<GetAttachedShaders>);
  Nan::SetMethod(proto, "getParameter", glCallWrap<GetParameter>);
  Nan::SetMethod(proto, "getBufferParameter", glCallWrap<GetBufferParameter>);
  Nan::SetMethod(proto, "getFramebufferAttachmentParameter", glCallWrap<GetFramebufferAttachmentParameter>);
  Nan::SetMethod(proto, "getProgramInfoLog", glCallWrap<GetProgramInfoLog>);
  Nan::SetMethod(proto, "getRenderbufferParameter", glCallWrap<GetRenderbufferParameter>);
  Nan::SetMethod(proto, "getVertexAttrib", glCallWrap<GetVertexAttrib>);
  Nan::SetMethod(proto, "getShaderPrecisionFormat", glCallWrap<GetShaderPrecisionFormat>);
  Nan::SetMethod(proto, "getSupportedExtensions", glCallWrap<GetSupportedExtensions>);
  Nan::SetMethod(proto, "getExtension", glCallWrap<GetExtension>);
  Nan::SetMethod(proto, "getContextAttributes", glCallWrap<GetContextAttributes>);

  Nan::SetMethod(proto, "checkFramebufferStatus", glCallWrap<CheckFramebufferStatus>);

  Nan::SetMethod(proto, "createVertexArray", glCallWrap<CreateVertexArray>);
  Nan::SetMethod(proto, "deleteVertexArray", glCallWrap<DeleteVertexArray>);
  Nan::SetMethod(proto, "bindVertexArray", glCallWrap<BindVertexArray>);

  Nan::SetMethod(proto, "fenceSync", glCallWrap<FenceSync>);
  Nan::SetMethod(proto, "deleteSync", glCallWrap<DeleteSync>);
  Nan::SetMethod(proto, "clientWaitSync", glCallWrap<ClientWaitSync>);
  Nan::SetMethod(proto, "waitSync", glCallWrap<WaitSync>);
  Nan::SetMethod(proto, "getSyncParameter", glCallWrap<GetSyncParameter>);

  Nan::SetMethod(proto, "frontFace", glCallWrap<FrontFace>);

  Nan::SetMethod(proto, "isContextLost", glCallWrap<IsContextLost>);

  Nan::SetAccessor(proto, JS_STR("drawingBufferWidth"), glGetterWrap<DrawingBufferWidthGetter>);
  Nan::SetAccessor(proto, JS_STR("drawingBufferHeight"), glGetterWrap<DrawingBufferHeightGetter>);

  /* Nan::SetMethod(proto, "getFramebuffer", glSwitchCallWrap<GetFramebuffer>);
  Nan::SetMethod(proto, "setDefaultFramebuffer", glSwitchCallWrap<SetDefaultFramebuffer>); */
  Nan::SetMethod(proto, "getFramebuffer", glCallWrap<GetFramebuffer>);
  Nan::SetMethod(proto, "setDefaultFramebuffer", glCallWrap<SetDefaultFramebuffer>);

  setGlConstants(proto);
#endif
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  //setGlConstants(ctorFn);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NNSObject::NNSObject() {}

NNSObject::~NNSObject() {}

NAN_METHOD(NNSObject::New) {
  NNSObject *gl = new NNSObject();
  Local<Object> glObj = info.This();
  gl->Wrap(glObj);

  info.GetReturnValue().Set(glObj);
}

NAN_METHOD(NNSObject::Destroy) {
  NNSObject *gl = ObjectWrap::Unwrap<NNSObject>(info.This());
  //gl->live = false;
}

void NNSObject::SetNSObject(NSObject* obj) {
  _NSObject = obj;
  /*
  auto wrapper = objc_getAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"]);
  if (wrapper == nullptr) {
    Nan::Persistent<FunctionTemplate>** p = new Nan::Persistent<FunctionTemplate>*(&GetDerivedType());
    auto w = [NSObjectWrapper alloc];
    w.ptr = p;
    
    objc_setAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"], w, objc_AssociationPolicy::OBJC_ASSOCIATION_RETAIN);
    //[_NSObject assignAssociatedWrapperWithPtr:p forKey:@"sweetiekit.type"];
  }*/
}
#include "NUILabel.h"
#include "NUIApplication.h"
#include "NUIWindow.h"
#include "NUIButton.h"
#include "NUIImage.h"
#include "NUIImageView.h"
#include "NUITextField.h"
#include "NUIStoryboard.h"
#include "NUITabBarController.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate>& NNSObject::GetNSObjectType(NSObject* obj, Nan::Persistent<FunctionTemplate>& unset) {
  if (obj != nullptr) {
    //auto wrapper = (Nan::Persistent<FunctionTemplate>**)[obj associatedWrapperForKey:@"sweetiekit.type"];
    
    NSObjectWrapper* wrapper = objc_getAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"]);
    if (wrapper != nullptr) {
      Nan::Persistent<FunctionTemplate>** p = (Nan::Persistent<FunctionTemplate>**)wrapper.ptr;
      if (p != nullptr && *p != nullptr) {
        return **p;
      }
    }
    if (wrapper == nullptr) {
      if ([obj isKindOfClass:[UIApplication class]]) {
        return NUIApplication::type;
      }
      if ([obj isKindOfClass:[UIWindow class]]) {
        return NUIWindow::type;
      }
      if ([obj isKindOfClass:[UILabel class]]) {
        return NUILabel::type;
      }
      if ([obj isKindOfClass:[UIButton class]]) {
        return NUIButton::type;
      }
      if ([obj isKindOfClass:[UIImage class]]) {
        return NUIImage::type;
      }
      if ([obj isKindOfClass:[UIImageView class]]) {
        return NUIImageView::type;
      }
      if ([obj isKindOfClass:[UIStoryboard class]]) {
        return NUIStoryboard::type;
      }
      if ([obj isKindOfClass:[UITextField class]]) {
        return NUITextField::type;
      }
      if ([obj isKindOfClass:[UIControl class]]) {
        return NUIControl::type;
      }
      if ([obj isKindOfClass:[UIView class]]) {
        return NUIView::type;
      }
      if ([obj isKindOfClass:[UIResponder class]]) {
        return NUIResponder::type;
      }
      if ([obj isKindOfClass:[UITabBarController class]]) {
        return NUITabBarController::type;
      }
      if ([obj isKindOfClass:[UIViewController class]]) {
        return NUIViewController::type;
      }
      Nan::ThrowError("Unknown type");
    }

  }
  return unset;
}
