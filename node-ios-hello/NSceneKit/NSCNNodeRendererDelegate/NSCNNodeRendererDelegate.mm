//
//  NSCNNodeRendererDelegate.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNNodeRendererDelegate.h"

#define instancetype SCNNodeRendererDelegate
#define js_value_instancetype js_value_SCNNodeRendererDelegate

NSCNNodeRendererDelegate::NSCNNodeRendererDelegate() {}
NSCNNodeRendererDelegate::~NSCNNodeRendererDelegate() {}

JS_INIT_PROTOCOL(SCNNodeRendererDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(renderNodeRendererArguments);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNNodeRendererDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(SCNNodeRendererDelegate, NSObject);


NAN_METHOD(NSCNNodeRendererDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(SCNNodeRendererDelegate);
  @autoreleasepool {
    id<SCNNodeRendererDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<SCNNodeRendererDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<SCNNodeRendererDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], SCNNodeRendererDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[SCNNodeRendererDelegateType alloc] init];
    }
    if (self) {
      NSCNNodeRendererDelegate *wrapper = new NSCNNodeRendererDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNNodeRendererDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(SCNNodeRendererDelegate, renderNodeRendererArguments);

#include "NSCNNode.h"
#include "NSCNRenderer.h"

@implementation SCNNodeRendererDelegateType

/*! 
 @method renderNode:renderer:arguments:
 @abstract Invoked when a node is rendered.
 @discussion The preferred way to customize the rendering is to tweak the material properties of the different materials of the node's geometry. SCNMaterial conforms to the SCNShadable protocol and allows for more advanced rendering using GLSL.
             You would typically use a renderer delegate with a node that has no geometry and only serves as a location in space. An example would be attaching a particle system to that node and render it with custom OpenGL code.
             Only drawing calls and the means to achieve them are supposed to be performed during the renderer delegate callback, any changes in the model (nodes, geometry...) would involve unexpected results.
 @param node The node to render.
 @param renderer The scene renderer to render into.
 @param arguments A dictionary whose values are SCNMatrix4 matrices wrapped in NSValue objects.
 */
- (void)renderNode:(SCNNode *)node renderer:(SCNRenderer *)renderer arguments:(NSDictionary<NSString *, id> *)arguments
{
  call_delegate(noop(), renderNodeRendererArguments,
    js_value_SCNNode(node),
    js_value_SCNRenderer(renderer),
    js_value_NSDictionary/* <NSString*, id>*/(arguments));
}

@end
