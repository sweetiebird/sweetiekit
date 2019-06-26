//
//  NARSKViewDelegate.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSKViewDelegate.h"

#define instancetype ARSKViewDelegate
#define js_value_instancetype js_value_ARSKViewDelegate

#include "NARSession.h"
#include "NARAnchor.h"
#include "NSKNode.h"
#include "NARSKView.h"

NARSKViewDelegate::NARSKViewDelegate() {}
NARSKViewDelegate::~NARSKViewDelegate() {}

JS_INIT_PROTOCOL(ARSKViewDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(viewNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(viewDidAddNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(viewWillUpdateNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(viewDidUpdateNodeForAnchor);
  JS_ASSIGN_PROTO_PROP(viewDidRemoveNodeForAnchor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSKViewDelegate, NSObject);
  // constants (exports)
JS_INIT_PROTOCOL_END(ARSKViewDelegate, NSObject);

NAN_METHOD(NARSKViewDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(ARSKViewDelegate);
  @autoreleasepool {
    id<ARSKViewDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<ARSKViewDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[ARSKViewDelegateType alloc] init];
    }
    if (self) {
      NARSKViewDelegate *wrapper = new NARSKViewDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSKViewDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(ARSKViewDelegate, viewNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSKViewDelegate, viewDidAddNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSKViewDelegate, viewWillUpdateNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSKViewDelegate, viewDidUpdateNodeForAnchor);
DELEGATE_PROTOCOL_PROP(ARSKViewDelegate, viewDidRemoveNodeForAnchor);

@implementation ARSKViewDelegateType

/**
 Implement this to provide a custom node for the given anchor.
 
 @discussion This node will automatically be added to the scene graph.
 If this method is not implemented, a node will be automatically created.
 If nil is returned the anchor will be ignored.
 @param view The view that will render the scene.
 @param anchor The added anchor.
 @return Node that will be mapped to the anchor or nil.
 */
- (nullable SKNode *)view:(ARSKView *)view nodeForAnchor:(ARAnchor *)anchor
{
  __block SKNode* result = nil;
  call_delegate(result = is_value_SKNode(JS_RESULT) ? to_value_SKNode(JS_RESULT) : result, viewNodeForAnchor,
    js_value_ARSKView(view),
    js_value_ARAnchor(anchor));
  return result;
}

/**
 Called when a new node has been mapped to the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that maps to the anchor.
 @param anchor The added anchor.
 */
- (void)view:(ARSKView *)view didAddNode:(SKNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate(noop(), viewDidAddNodeForAnchor,
    js_value_ARSKView(view),
    js_value_SKNode(node),
    js_value_ARAnchor(anchor));
}

/**
 Called when a node will be updated with data from the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that will be updated.
 @param anchor The anchor that was updated.
 */
- (void)view:(ARSKView *)view willUpdateNode:(SKNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate(noop(), viewWillUpdateNodeForAnchor,
    js_value_ARSKView(view),
    js_value_SKNode(node),
    js_value_ARAnchor(anchor));
}

/**
 Called when a node has been updated with data from the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that was updated.
 @param anchor The anchor that was updated.
 */
- (void)view:(ARSKView *)view didUpdateNode:(SKNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate(noop(), viewDidUpdateNodeForAnchor,
    js_value_ARSKView(view),
    js_value_SKNode(node),
    js_value_ARAnchor(anchor));
}

/**
 Called when a mapped node has been removed from the scene graph for the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that was removed.
 @param anchor The anchor that was removed.
 */
- (void)view:(ARSKView *)view didRemoveNode:(SKNode *)node forAnchor:(ARAnchor *)anchor
{
  call_delegate(noop(), viewDidRemoveNodeForAnchor,
    js_value_ARSKView(view),
    js_value_SKNode(node),
    js_value_ARAnchor(anchor));
}

@end
