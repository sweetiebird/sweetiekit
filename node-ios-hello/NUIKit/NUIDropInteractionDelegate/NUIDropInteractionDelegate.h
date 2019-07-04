//
//  NUIDropInteractionDelegate.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDropInteractionDelegate_h
#define NUIDropInteractionDelegate_h    

#include "NNSObject.h"

#define js_value_UIDropInteractionDelegate(x) js_protocol_wrapper(x, UIDropInteractionDelegate)
#define to_value_UIDropInteractionDelegate(x) to_protocol_wrapper(x, UIDropInteractionDelegate)
#define is_value_UIDropInteractionDelegate(x) is_protocol_wrapper(x, UIDropInteractionDelegate)

JS_WRAP_PROTOCOL(UIDropInteractionDelegate, NSObject);
  JS_PROP(dropInteractionCanHandleSession);
  JS_PROP(dropInteractionSessionDidEnter);
  JS_PROP(dropInteractionSessionDidUpdate);
  JS_PROP(dropInteractionSessionDidExit);
  JS_PROP(dropInteractionPerformDrop);
  JS_PROP(dropInteractionConcludeDrop);
  JS_PROP(dropInteractionSessionDidEnd);
  JS_PROP(dropInteractionPreviewForDroppingItemWithDefault);
  JS_PROP(dropInteractionItemWillAnimateDropWithAnimator);
JS_WRAP_PROTOCOL_END(UIDropInteractionDelegate, NSObject);

#if __OBJC__
@interface UIDropInteractionDelegateType : NSObject<UIDropInteractionDelegate>

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
- (BOOL)dropInteraction:(UIDropInteraction *)interaction canHandleSession:(id<UIDropSession>)session;

/* Called when a drag enters the view.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction sessionDidEnter:(id<UIDropSession>)session;

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
- (UIDropProposal *)dropInteraction:(UIDropInteraction *)interaction sessionDidUpdate:(id<UIDropSession>)session;

/* Called when the drag has exited the interaction's view.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction sessionDidExit:(id<UIDropSession>)session;

/* Called when the user drops onto this interaction's view.
 * The delegate should now request data from the session's
 * items' item providers. Data may be requested *only* during
 * the scope of this method.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction performDrop:(id<UIDropSession>)session;

/* Called when the user has dropped onto this interaction's view,
 * after `-dropInteraction:performDrop:` has been called,
 * and all resulting drop animations have completed.
 *
 * The delegate should cause the interaction's view to draw in its final post-drop state.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction concludeDrop:(id<UIDropSession>)session;

/* When the drag session ends, for any reason, this method will be called
 * for *every* interaction that ever received `-dropInteraction:sessionDidEnter:`,
 * `-dropInteraction:sessionDidUpdate:`, or `-dropInteraction:sessionDidExit:`.
 *
 * If you were keeping track of the session for any reason, you may now forget it.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction sessionDidEnd:(id<UIDropSession>)session;

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
- (nullable UITargetedDragPreview *)dropInteraction:(UIDropInteraction *)interaction previewForDroppingItem:(UIDragItem *)item withDefault:(UITargetedDragPreview *)defaultPreview;

/* Called when the drop animation is about to start, once for each item,
 * whether it is visible or not.
 * Use the animator to animate your own changes alongside the system animation.
 */
- (void)dropInteraction:(UIDropInteraction *)interaction item:(UIDragItem *)item willAnimateDropWithAnimator:(id<UIDragAnimating>)animator;

@end
#endif

#endif /* NUIDropInteractionDelegate_h */
