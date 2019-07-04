//
//  NUIDragDropSession.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDragDropSession_h
#define NUIDragDropSession_h    

#include "NNSObject.h"

#define js_value_UIDragDropSession(x) js_protocol_wrapper(x, UIDragDropSession)
#define to_value_UIDragDropSession(x) to_protocol_wrapper(x, UIDragDropSession)
#define is_value_UIDragDropSession(x) is_protocol_wrapper(x, UIDragDropSession)

JS_WRAP_PROTOCOL(UIDragDropSession, NSObject);
  JS_PROP(locationInView);
  JS_PROP(hasItemsConformingToTypeIdentifiers);
  JS_PROP(canLoadObjectsOfClass);
  JS_PROP_READONLY(items);
  JS_PROP_READONLY(allowsMoveOperation);
  JS_PROP_READONLY(isRestrictedToDraggingApplication);
JS_WRAP_PROTOCOL_END(UIDragDropSession, NSObject);

#if __OBJC__
@interface UIDragDropSessionType : NSObject<UIDragDropSession>

/* A common protocol used for both drag and drop sessions. */

/* The items in the session.
 *
 * Before the drop happens, the items' NSItemProviders do not allow
 * the data in the NSItemProvider to be loaded.
 * However, `registeredTypeIdentifiers` and metadata are available at any time.
 * You may request the data only inside the UIDropInteractionDelegate's implementation
 * of `-dropInteraction:performDrop:`.
 *
 * When handling the drop, if you display dropped items in a linear order,
 * place them in this order, first to last.
 */
@property (nonatomic, readonly) NSArray<UIDragItem *> *items;

/* The location of the drag in the specified view.
 */
- (CGPoint)locationInView:(UIView *)view;

/* Whether this session allows moving, or not.
 *
 * This is determined based on the UIDragInteraction's delegate's
 * `-dragInteraction:sessionAllowsMoveOperation:`.
 *
 * If true, then the delegate of UIDropInteraction is allowed to return `UIDropOperationMove`
 * from `-dropInteraction:sessionDidUpdate:`.
 */
@property (nonatomic, readonly) BOOL allowsMoveOperation;

/* Whether this session is restricted to the application that began the drag.
 *
 * This is determined based on the UIDragInteraction's delegate's
 * `-dragInteraction:sessionIsRestrictedToDraggingApplication:`.
 */
@property (nonatomic, readonly, getter=isRestrictedToDraggingApplication) BOOL restrictedToDraggingApplication;

/* Convenience methods to iterate through this session's `items`.
 *
 * Returns true if any of the session's items conforms to any of the specified UTIs.
 */
- (BOOL)hasItemsConformingToTypeIdentifiers:(NSArray<NSString *> *)typeIdentifiers;

/* Returns true if any of the session's items could create any objects of the specified class.
 */
- (BOOL)canLoadObjectsOfClass:(Class<NSItemProviderReading>)aClass;

@end
#endif

#endif /* NUIDragDropSession_h */
