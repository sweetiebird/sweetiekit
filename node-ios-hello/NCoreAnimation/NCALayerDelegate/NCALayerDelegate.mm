//
//  NCALayerDelegate.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCALayerDelegate.h"

#define instancetype CALayerDelegate
#define js_value_instancetype js_value_CALayerDelegate

NCALayerDelegate::NCALayerDelegate() {}
NCALayerDelegate::~NCALayerDelegate() {}

JS_INIT_PROTOCOL(CALayerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(displayLayer);
  JS_ASSIGN_PROTO_PROP(drawLayerInContext);
  JS_ASSIGN_PROTO_PROP(layerWillDraw);
  JS_ASSIGN_PROTO_PROP(layoutSublayersOfLayer);
  JS_ASSIGN_PROTO_PROP(actionForLayerForKey);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CALayerDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(CALayerDelegate, NSObject);


NAN_METHOD(NCALayerDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(CALayerDelegate);
  @autoreleasepool {
    id<CALayerDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<CALayerDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<CALayerDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], CALayerDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[CALayerDelegateType alloc] init];
    }
    if (self) {
      NCALayerDelegate *wrapper = new NCALayerDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CALayerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(CALayerDelegate, displayLayer);
DELEGATE_PROTOCOL_PROP(CALayerDelegate, drawLayerInContext);
DELEGATE_PROTOCOL_PROP(CALayerDelegate, layerWillDraw);
DELEGATE_PROTOCOL_PROP(CALayerDelegate, layoutSublayersOfLayer);
DELEGATE_PROTOCOL_PROP(CALayerDelegate, actionForLayerForKey);

#include "NCAAction.h"
#include "NCALayer.h"

@implementation CALayerDelegateType

/* If defined, called by the default implementation of the -display
 * method, in which case it should implement the entire display
 * process (typically by setting the `contents' property). */

- (void)displayLayer:(CALayer *)layer
{
  call_delegate(noop(), displayLayer,
    js_value_CALayer(layer));
}

/* If defined, called by the default implementation of -drawInContext: */

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
  call_delegate(noop(), drawLayerInContext,
    js_value_CALayer(layer),
    js_value_CGContextRef(ctx));
}

/* If defined, called by the default implementation of the -display method.
 * Allows the delegate to configure any layer state affecting contents prior
 * to -drawLayer:InContext: such as `contentsFormat' and `opaque'. It will not
 * be called if the delegate implements -displayLayer. */

- (void)layerWillDraw:(CALayer *)layer
  API_AVAILABLE(macos(10.12), ios(10.0), watchos(3.0), tvos(10.0))
{
  call_delegate(noop(), layerWillDraw,
    js_value_CALayer(layer));
}

/* Called by the default -layoutSublayers implementation before the layout
 * manager is checked. Note that if the delegate method is invoked, the
 * layout manager will be ignored. */

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
  call_delegate(noop(), layoutSublayersOfLayer,
    js_value_CALayer(layer));
}

/* If defined, called by the default implementation of the
 * -actionForKey: method. Should return an object implementing the
 * CAAction protocol. May return 'nil' if the delegate doesn't specify
 * a behavior for the current event. Returning the null object (i.e.
 * '[NSNull null]') explicitly forces no further search. (I.e. the
 * +defaultActionForKey: method will not be called.) */

- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event
{
  __block id<CAAction> result = nil;
  call_delegate(result = is_value_CAAction(JS_RESULT) ? to_value_CAAction(JS_RESULT) : result, actionForLayerForKey,
    js_value_CALayer(layer),
    js_value_NSString(event));
  return result;
}

@end
