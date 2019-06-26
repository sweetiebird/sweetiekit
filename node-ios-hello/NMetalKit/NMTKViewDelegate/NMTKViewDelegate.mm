//
//  NMTKViewDelegate.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTKViewDelegate.h"

#define instancetype MTKViewDelegate
#define js_value_instancetype js_value_MTKViewDelegate

NMTKViewDelegate::NMTKViewDelegate() {}
NMTKViewDelegate::~NMTKViewDelegate() {}

JS_INIT_PROTOCOL(MTKViewDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(mtkViewDrawableSizeWillChange);
  JS_ASSIGN_PROTO_PROP(drawInMTKView);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTKViewDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTKViewDelegate, NSObject);


NAN_METHOD(NMTKViewDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(MTKViewDelegate);
  @autoreleasepool {
    id<MTKViewDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTKViewDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTKViewDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTKViewDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[MTKViewDelegateType alloc] init];
    }
    if (self) {
      NMTKViewDelegate *wrapper = new NMTKViewDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTKViewDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(MTKViewDelegate, mtkViewDrawableSizeWillChange);
DELEGATE_PROTOCOL_PROP(MTKViewDelegate, drawInMTKView);

#include "NMTKView.h"

@implementation MTKViewDelegateType
- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size
{
  call_delegate(noop(), mtkViewDrawableSizeWillChange,
    js_value_MTKView(view),
    js_value_CGSize(size));
}

- (void)drawInMTKView:(nonnull MTKView *)view
{
  call_delegate(noop(), drawInMTKView,
    js_value_MTKView(view));
}

@end
