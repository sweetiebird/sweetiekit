//
//  NUIDropInteractionDelegate.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDropInteractionDelegate.h"

#define instancetype UIDropInteractionDelegate
#define js_value_instancetype js_value_UIDropInteractionDelegate

NUIDropInteractionDelegate::NUIDropInteractionDelegate() {}
NUIDropInteractionDelegate::~NUIDropInteractionDelegate() {}

JS_INIT_PROTOCOL(UIDropInteractionDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(dropInteractionCanHandleSession);
  JS_ASSIGN_PROTO_PROP(dropInteractionSessionDidEnter);
  JS_ASSIGN_PROTO_PROP(dropInteractionSessionDidUpdate);
  JS_ASSIGN_PROTO_PROP(dropInteractionSessionDidExit);
  JS_ASSIGN_PROTO_PROP(dropInteractionPerformDrop);
  JS_ASSIGN_PROTO_PROP(dropInteractionConcludeDrop);
  JS_ASSIGN_PROTO_PROP(dropInteractionSessionDidEnd);
  JS_ASSIGN_PROTO_PROP(dropInteractionPreviewForDroppingItemWithDefault);
  JS_ASSIGN_PROTO_PROP(dropInteractionItemWillAnimateDropWithAnimator);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDropInteractionDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIDropInteractionDelegate, NSObject);

NAN_METHOD(NUIDropInteractionDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UIDropInteractionDelegate);
  @autoreleasepool {
    id<UIDropInteractionDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIDropInteractionDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIDropInteractionDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIDropInteractionDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIDropInteractionDelegateType alloc] init];
    }
    if (self) {
      NUIDropInteractionDelegate *wrapper = new NUIDropInteractionDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDropInteractionDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionCanHandleSession);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionSessionDidEnter);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionSessionDidUpdate);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionSessionDidExit);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionPerformDrop);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionConcludeDrop);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionSessionDidEnd);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionPreviewForDroppingItemWithDefault);
DELEGATE_PROTOCOL_PROP(UIDropInteractionDelegate, dropInteractionItemWillAnimateDropWithAnimator);

#include "NUIDropInteraction.h"
#include "NUIDropProposal.h"

@implementation UIDropInteractionDelegateType

/* Return whether the delegate is interested in the given session.
 * If this method is not implemented, or if it returns true, then the
 * other delegate methods will be called, starting with `-dropInteraction:sessionDidEnter:`.
 * If it returns false, this interaction will ignore this session. (We may ask again
 * if something significant about the session changes, like the items in it.)
 *
 * Note that returning true does not mean that the delegate definitely *will* accept this drop,
 * just that it *might* want to accept the drop.
 * To accept it, you must also implement `-dropInteraction:sessionDidUpdate:` and return a
 * UIDropProposal with an appropriate operation.
 *
 * This method is commonly used to check whether the session contains any
 * items that this delegate can consume. Use `UIDropSession`'s convenience methods
 * `-hasItemsConformingToTypeIdentifiers:`, `-canLoadObjectsOfClass:`, etc.
 */
- (BOOL)dropInteraction:(UIDropInteraction *)interaction canHandleSession:(id<UIDropSession>)session
{
  __block BOOL result = YES;
  // TODO
  return result;
}

/* Called when a drag enters the view.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction sessionDidEnter:(id<UIDropSession>)session
{
  // TODO
}

/* Called when the drag enters the interaction's view, or when when the drag 
 * moves while inside the view, or if items are added to the drag while inside the view.
 *
 * You *must* implement this method to accept a drop.
 * Return a `UIDropProposal` that contains the operation that the delegate
 * would like to perform. (Note that you may use `UIDropOperationMove` only if
 * session.allowsMoveOperation is true.)
 *
 * You may also set other properties on the `UIDropProposal` to change the appearance
 * of the drag over this view.
 *
 * Use the session's `-locationInView:` to get a point to use for hit testing.
 */
- (UIDropProposal *)dropInteraction:(UIDropInteraction *)interaction sessionDidUpdate:(id<UIDropSession>)session
{
  __block UIDropProposal* result = nil;
  // TODO
  return result;
}

/* Called when the drag has exited the interaction's view.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction sessionDidExit:(id<UIDropSession>)session
{
  // TODO
}

/* Called when the user drops onto this interaction's view.
 * The delegate should now request data from the session's
 * items' item providers. Data may be requested *only* during
 * the scope of this method.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction performDrop:(id<UIDropSession>)session
{
  // TODO
}

/* Called when the user has dropped onto this interaction's view,
 * after `-dropInteraction:performDrop:` has been called,
 * and all resulting drop animations have completed.
 *
 * The delegate should cause the interaction's view to draw in its final post-drop state.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction concludeDrop:(id<UIDropSession>)session
{
  // TODO
}

/* When the drag session ends, for any reason, this method will be called
 * for *every* interaction that ever received `-dropInteraction:sessionDidEnter:`,
 * `-dropInteraction:sessionDidUpdate:`, or `-dropInteraction:sessionDidExit:`.
 *
 * If you were keeping track of the session for any reason, you may now forget it.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction sessionDidEnd:(id<UIDropSession>)session
{
  // TODO
}

/* Drop animation. */

/* Called when the drop happens, after `-dropInteraction:performDrop:`, once for each visible item.
 * Provide a preview to animate the item to where it belongs.
 * We provide `defaultPreview` which would leave the current preview where the item was dropped.
 * You may return:
 * - defaultPreview, to use it as-is
 * - nil, to fade and shrink the drag item in place
 * - [defaultPreview retargetedPreviewWithTarget:] to move the preview to a different target
 * - a UITargetedDragPreview that you create however you like
 */
- (nullable UITargetedDragPreview *)dropInteraction:(UIDropInteraction *)interaction previewForDroppingItem:(UIDragItem *)item withDefault:(UITargetedDragPreview *)defaultPreview
{
  __block UITargetedDragPreview* result = nil;
  // TODO
  return result;
}

/* Called when the drop animation is about to start, once for each item,
 * whether it is visible or not.
 * Use the animator to animate your own changes alongside the system animation.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction item:(UIDragItem *)item willAnimateDropWithAnimator:(id<UIDragAnimating>)animator
{
  // TODO
}

@end
