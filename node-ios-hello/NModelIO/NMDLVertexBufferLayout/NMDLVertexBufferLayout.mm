//
//  NMDLVertexBufferLayout.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLVertexBufferLayout.h"

#define instancetype MDLVertexBufferLayout
#define js_value_instancetype js_value_MDLVertexBufferLayout

NMDLVertexBufferLayout::NMDLVertexBufferLayout() {}
NMDLVertexBufferLayout::~NMDLVertexBufferLayout() {}

JS_INIT_CLASS(MDLVertexBufferLayout, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(stride);
  // static members (ctor)
  JS_INIT_CTOR(MDLVertexBufferLayout, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithStride);
JS_INIT_CLASS_END(MDLVertexBufferLayout, NSObject);

NAN_METHOD(NMDLVertexBufferLayout::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLVertexBufferLayout(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLVertexBufferLayout, info);
      return;
    }

    MDLVertexBufferLayout* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLVertexBufferLayout *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLVertexBufferLayout alloc] init];
    }
    if (self) {
      NMDLVertexBufferLayout *wrapper = new NMDLVertexBufferLayout();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLVertexBufferLayout::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMDLVertexBufferLayout::initWithStride) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, stride);
    JS_SET_RETURN(js_value_instancetype([[MDLVertexBufferLayout alloc] initWithStride: stride]));
  }
}

NAN_GETTER(NMDLVertexBufferLayout::strideGetter) {
  JS_UNWRAP(MDLVertexBufferLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self stride]));
  }
}

NAN_SETTER(NMDLVertexBufferLayout::strideSetter) {
  JS_UNWRAP(MDLVertexBufferLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setStride: input];
  }
}

