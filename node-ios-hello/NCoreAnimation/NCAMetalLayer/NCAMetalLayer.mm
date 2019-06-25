//
//  NCAMetalLayer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAMetalLayer.h"

#if !TARGET_OS_SIMULATOR

#define instancetype CAMetalLayer
#define js_value_instancetype js_value_CAMetalLayer

NCAMetalLayer::NCAMetalLayer() {}
NCAMetalLayer::~NCAMetalLayer() {}

JS_INIT_CLASS(CAMetalLayer, CALayer);
  JS_ASSIGN_PROTO_METHOD(nextDrawable);
  JS_ASSIGN_PROTO_PROP(device);
  JS_ASSIGN_PROTO_PROP(pixelFormat);
  JS_ASSIGN_PROTO_PROP(framebufferOnly);
  JS_ASSIGN_PROTO_PROP(drawableSize);
  JS_ASSIGN_PROTO_PROP(maximumDrawableCount);
  JS_ASSIGN_PROTO_PROP(presentsWithTransaction);
  JS_ASSIGN_PROTO_PROP(allowsNextDrawableTimeout);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAMetalLayer, CALayer);
  // constant values (exports)
JS_INIT_CLASS_END(CAMetalLayer, CALayer);

NAN_METHOD(NCAMetalLayer::New) {
  JS_RECONSTRUCT(CAMetalLayer);
  @autoreleasepool {
    CAMetalLayer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAMetalLayer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAMetalLayer alloc] init];
    }
    if (self) {
      NCAMetalLayer *wrapper = new NCAMetalLayer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAMetalLayer::New: invalid arguments");
    }
  }
}

#include "NCAMetalDrawable.h"

NAN_METHOD(NCAMetalLayer::nextDrawable) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAMetalDrawable([self nextDrawable]));
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NCAMetalLayer::deviceGetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

NAN_SETTER(NCAMetalLayer::deviceSetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(MTLDevice, input);
    [self setDevice: input];
  }
}

#include "NMTLPixelFormat.h"

NAN_GETTER(NCAMetalLayer::pixelFormatGetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self pixelFormat]));
  }
}

NAN_SETTER(NCAMetalLayer::pixelFormatSetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPixelFormat, input);
    [self setPixelFormat: input];
  }
}

NAN_GETTER(NCAMetalLayer::framebufferOnlyGetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self framebufferOnly]));
  }
}

NAN_SETTER(NCAMetalLayer::framebufferOnlySetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setFramebufferOnly: input];
  }
}

NAN_GETTER(NCAMetalLayer::drawableSizeGetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self drawableSize]));
  }
}

NAN_SETTER(NCAMetalLayer::drawableSizeSetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setDrawableSize: input];
  }
}

NAN_GETTER(NCAMetalLayer::maximumDrawableCountGetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maximumDrawableCount]));
  }
}

NAN_SETTER(NCAMetalLayer::maximumDrawableCountSetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMaximumDrawableCount: input];
  }
}

NAN_GETTER(NCAMetalLayer::presentsWithTransactionGetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self presentsWithTransaction]));
  }
}

NAN_SETTER(NCAMetalLayer::presentsWithTransactionSetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPresentsWithTransaction: input];
  }
}

NAN_GETTER(NCAMetalLayer::allowsNextDrawableTimeoutGetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsNextDrawableTimeout]));
  }
}

NAN_SETTER(NCAMetalLayer::allowsNextDrawableTimeoutSetter) {
  JS_UNWRAP(CAMetalLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsNextDrawableTimeout: input];
  }
}

#endif // !TARGET_OS_SIMULATOR
