//
//  NUIDragInteractionDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragInteractionDelegate.h"

#define instancetype UIDragInteractionDelegate
#define js_value_instancetype js_value_UIDragInteractionDelegate

NUIDragInteractionDelegate::NUIDragInteractionDelegate() {}
NUIDragInteractionDelegate::~NUIDragInteractionDelegate() {}

JS_INIT_PROTOCOL(UIDragInteractionDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(dragInteractionItemsForBeginningSession);
  JS_ASSIGN_PROTO_PROP(dragInteractionPreviewForLiftingItemSession);
  JS_ASSIGN_PROTO_PROP(dragInteractionWillAnimateLiftWithAnimatorSession);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionWillBegin);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionAllowsMoveOperation);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionIsRestrictedToDraggingApplication);
  JS_ASSIGN_PROTO_PROP(dragInteractionPrefersFullSizePreviewsForSession);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionDidMove);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionWillEndWithOperation);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionDidEndWithOperation);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionDidTransferItems);
  JS_ASSIGN_PROTO_PROP(dragInteractionItemsForAddingToSessionWithTouchAtPoint);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionForAddingItemsWithTouchAtPoint);
  JS_ASSIGN_PROTO_PROP(dragInteractionSessionWillAddItemsForInteraction);
  JS_ASSIGN_PROTO_PROP(dragInteractionPreviewForCancellingItemWithDefault);
  JS_ASSIGN_PROTO_PROP(dragInteractionItemWillAnimateCancelWithAnimator);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragInteractionDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIDragInteractionDelegate, NSObject);

NAN_METHOD(NUIDragInteractionDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(UIDragInteractionDelegate);
  @autoreleasepool {
    id<UIDragInteractionDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIDragInteractionDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIDragInteractionDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIDragInteractionDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIDragInteractionDelegateType alloc] init];
    }
    if (self) {
      NUIDragInteractionDelegate *wrapper = new NUIDragInteractionDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragInteractionDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionItemsForBeginningSession);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionPreviewForLiftingItemSession);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionWillAnimateLiftWithAnimatorSession);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionWillBegin);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionAllowsMoveOperation);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionIsRestrictedToDraggingApplication);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionPrefersFullSizePreviewsForSession);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionDidMove);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionWillEndWithOperation);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionDidEndWithOperation);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionDidTransferItems);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionItemsForAddingToSessionWithTouchAtPoint);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionForAddingItemsWithTouchAtPoint);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionSessionWillAddItemsForInteraction);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionPreviewForCancellingItemWithDefault);
DELEGATE_PROTOCOL_PROP(UIDragInteractionDelegate, dragInteractionItemWillAnimateCancelWithAnimator);

@implementation UIDragInteractionDelegateType

/* Provide items to begin a drag.
 *
 * If these items represent things that are displayed in a linear order
 * (for example, rows in a table), provide them in the same order, first
 * to last.
 *
 * If an empty array is returned, then no drag will begin.
 */
- (NSArray<UIDragItem *> *)dragInteraction:(UIDragInteraction *)interaction itemsForBeginningSession:(id<UIDragSession>)session
{
  __block NSArray<UIDragItem *>* result = @[];
  // TODO
  return result;
}

/* Provide a preview to display while lifting the drag item.
 * Return nil to indicate that this item is not visible and should have no lift animation.
 * If not implemented, a UITargetedDragPreview initialized with interaction.view will be used.
 */
- (nullable UITargetedDragPreview *)dragInteraction:(UIDragInteraction *)interaction previewForLiftingItem:(UIDragItem *)item session:(id<UIDragSession>)session
{
  __block UITargetedDragPreview* result = nil;
  // TODO
  return result;
}

/* Called when the lift animation is about to start.
 * Use the animator to animate your own changes alongside the system animation,
 * or to be called when the lift animation completes.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction willAnimateLiftWithAnimator:(id<UIDragAnimating>)animator session:(id<UIDragSession>)session
{
  // TODO
}

/* Drag session lifecycle. */

/* Called when the the items are in their fully lifted appearance,
 * and the user has started to drag the items away.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction sessionWillBegin:(id<UIDragSession>)session
{
  // TODO
}

/* Return whether this drag allows the "move" drop operation to happen.
 * This only applies to drops inside the same app. Drops in other apps are always copies.
 *
 * If true, then a UIDropInteraction's delegate's -dropInteraction:sessionDidUpdate:
 * may choose to return UIDropOperationMove, and that operation will be provided to
 * -dragInteraction:session:willEndWithOperation: and -dragInteraction:session:didEndWithOperation:.
 *
 * If not implemented, defaults to true.
 */
- (BOOL)dragInteraction:(UIDragInteraction *)interaction sessionAllowsMoveOperation:(id<UIDragSession>)session
{
  __block BOOL result = YES;
  // TODO
  return result;
}

/* Return whether this drag is restricted to only this application.
 *
 * If true, then the drag will be restricted. Only this application will be
 * able to see the drag, and other applications will not.
 * If the user drops it on another application, the drag will be cancelled.
 *
 * If false, then the drag is not restricted. Other applications may see the drag,
 * and the user may drop it onto them.
 *
 * If not implemented, defaults to false.
 *
 * Note that this method is called only on devices that support dragging across applications.
 */
- (BOOL)dragInteraction:(UIDragInteraction *)interaction sessionIsRestrictedToDraggingApplication:(id<UIDragSession>)session
{
  __block BOOL result = NO;
  // TODO
  return result;
}

/* Return whether this drag's items' previews should be shown in their full
 * original size while over the source view. For instance, if you are reordering
 * items, you may want them not to shrink like they otherwise would.
 *
 * If not implemented, defaults to false.
 */
- (BOOL)dragInteraction:(UIDragInteraction *)interaction prefersFullSizePreviewsForSession:(id<UIDragSession>)session
{
  __block BOOL result = NO;
  // TODO
  return result;
}

/* Called when the drag has moved (because the user's touch moved).
 * Use -[UIDragSession locationInView:] to get its new location.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction sessionDidMove:(id<UIDragSession>)session
{
  // TODO
}

/* Called when the user is done dragging, and the drag will finish.
 *
 * If the operation is UIDropOperationCancel or UIDropOperationForbidden,
 * the delegate should prepare its views to show an appropriate appearance 
 * before the cancel animation starts.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction session:(id<UIDragSession>)session willEndWithOperation:(UIDropOperation)operation
{
  // TODO
}

/* Called when the user is done dragging and all related animations are
 * completed. The app should now return to its normal appearance.
 *
 * If the operation is UIDropOperationCopy or UIDropOperationMove, 
 * then data transfer will begin, and -dragInteraction:sessionDidTransferItems: will be called later.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction session:(id<UIDragSession>)session didEndWithOperation:(UIDropOperation)operation
{
  // TODO
}

/* Called after a drop happened and the handler of the drop has received
 * all of the data that it requested. You may now clean up any extra information
 * relating to those items or their item providers.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction sessionDidTransferItems:(id<UIDragSession>)session
{
  // TODO
}

/* Adding items to an existing drag. */

/* To allow touches on this view to add items to an existing drag,
 * implement `-dragInteraction:itemsForAddingToSession:withTouchAtPoint:`.
 *
 * If the provided session is an appropriate one to use, then return an array of items,
 * just like in `-dragInteraction:itemsForBeginningSession:`. They will be added to the 
 * drag session.
 * Afterwards, `-dragInteraction:session:willAddItems:forInteraction:` will be sent
 * to each interaction which has contributed items to the session, including this one.
 *
 * Otherwise, return an empty array. No items will be added, and the touch
 * will be handled as if the other drag session did not exist.
 *
 * If this method is not implemented, acts as though an an empty array was returned.
 *
 * Use the point, in the view's coordinate space, to determine what part of your view
 * has been touched.
 */
- (NSArray<UIDragItem *> *)dragInteraction:(UIDragInteraction *)interaction itemsForAddingToSession:(id<UIDragSession>)session withTouchAtPoint:(CGPoint)point
{
  __block NSArray<UIDragItem *>* result = @[];
  // TODO
  return result;
}

/* If there are two or more existing drag sessions, it may not be clear to the user
 * which session items will be added to. Therefore, by default, we do not add to any session.
 *
 * If you *do* want to add the item to a session, implement
 * `-dragInteraction:sessionForAddingItems:withTouchAtPoint:` and return the
 * appropriate session. This should be rare.
 *
 * To continue without adding items, return nil.
 *
 * If this method is not implemented, defaults to nil.
 */
- (nullable id<UIDragSession>)dragInteraction:(UIDragInteraction *)interaction sessionForAddingItems:(NSArray<id<UIDragSession>> *)sessions withTouchAtPoint:(CGPoint)point
{
  __block id<UIDragSession> result = nil;
  // TODO
  return result;
}

/* Similar to -dragInteraction:sessionWillBegin:, but for
 * items added to an session after it has already begun.
 *
 * Note that the interaction that is causing the items to be added
 * may be different than the interaction that started the drag.
 * This method is called on the delegates of all interactions that ever added items
 * to this session. `addingInteraction` is the interaction that is causing
 * these new items to be dragged.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction session:(id<UIDragSession>)session willAddItems:(NSArray<UIDragItem *> *)items forInteraction:(UIDragInteraction *)addingInteraction
{
  // TODO
}

/* Drag cancellation animation. */

/* Called when the drag is cancelled, once for each visible item.
 * Provide a preview to animate the item back to where it belongs.
 * We provide `defaultPreview` which would move the current preview back to where it came from.
 * You may return:
 * - defaultPreview, to use it as-is
 * - nil, to fade the drag item in place
 * - [defaultPreview retargetedPreviewWithTarget:] to move the preview to a different target
 * - a UITargetedDragPreview that you create however you like
 */
- (nullable UITargetedDragPreview *)dragInteraction:(UIDragInteraction *)interaction previewForCancellingItem:(UIDragItem *)item withDefault:(UITargetedDragPreview *)defaultPreview
{
  __block UITargetedDragPreview* result = nil;
  // TODO
  return result;
}

/* Called when the cancel animation is about to start, once for each item,
 * whether it is visible or not.
 * Use the animator to animate your own changes alongside the system animation.
 */
- (void)dragInteraction:(UIDragInteraction *)interaction item:(UIDragItem *)item willAnimateCancelWithAnimator:(id<UIDragAnimating>)animator
{
  // TODO
}

@end
