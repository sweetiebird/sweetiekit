//
//  NUIDragDropSession.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragDropSession.h"

#define instancetype UIDragDropSession
#define js_value_instancetype js_value_UIDragDropSession

NUIDragDropSession::NUIDragDropSession() {}
NUIDragDropSession::~NUIDragDropSession() {}

JS_INIT_PROTOCOL(UIDragDropSession, NSObject);
  JS_ASSIGN_PROTO_PROP(locationInView);
  JS_ASSIGN_PROTO_PROP(hasItemsConformingToTypeIdentifiers);
  JS_ASSIGN_PROTO_PROP(canLoadObjectsOfClass);
  JS_ASSIGN_PROTO_PROP_READONLY(items);
  JS_ASSIGN_PROTO_PROP_READONLY(allowsMoveOperation);
  JS_ASSIGN_PROTO_PROP_READONLY(isRestrictedToDraggingApplication);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragDropSession, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIDragDropSession, NSObject);


NAN_METHOD(NUIDragDropSession::New) {
  JS_RECONSTRUCT_PROTOCOL(UIDragDropSession);
  @autoreleasepool {
    id<UIDragDropSession> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIDragDropSession>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIDragDropSession> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIDragDropSession, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIDragDropSessionType alloc] init];
    }
    if (self) {
      NUIDragDropSession *wrapper = new NUIDragDropSession();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragDropSession::New: invalid arguments");
    }
  }
}

#include "NUIDragItem.h"

NAN_GETTER(NUIDragDropSession::itemsGetter) {
  JS_UNWRAP_PROTOCOL(UIDragDropSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIDragItem*>([self items]));
  }
}

NAN_GETTER(NUIDragDropSession::allowsMoveOperationGetter) {
  JS_UNWRAP_PROTOCOL(UIDragDropSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsMoveOperation]));
  }
}

NAN_GETTER(NUIDragDropSession::isRestrictedToDraggingApplicationGetter) {
  JS_UNWRAP_PROTOCOL(UIDragDropSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRestrictedToDraggingApplication]));
  }
}

DELEGATE_PROTOCOL_PROP(UIDragDropSession, locationInView);
DELEGATE_PROTOCOL_PROP(UIDragDropSession, hasItemsConformingToTypeIdentifiers);
DELEGATE_PROTOCOL_PROP(UIDragDropSession, canLoadObjectsOfClass);

#include "NUIView.h"

@implementation UIDragDropSessionType

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
//@property (nonatomic, readonly) NSArray<UIDragItem *> *items;

/* The location of the drag in the specified view.
 */
- (CGPoint)locationInView:(UIView *)view
{
  __block CGPoint result = CGPointZero;
  call_delegate(result = is_value_CGPoint(JS_RESULT) ? to_value_CGPoint(JS_RESULT) : result, locationInView,
    js_value_UIView(view));
  return result;
}

/* Whether this session allows moving, or not.
 *
 * This is determined based on the UIDragInteraction's delegate's
 * `-dragInteraction:sessionAllowsMoveOperation:`.
 *
 * If true, then the delegate of UIDropInteraction is allowed to return `UIDropOperationMove`
 * from `-dropInteraction:sessionDidUpdate:`.
 */
//@property (nonatomic, readonly) BOOL allowsMoveOperation;

/* Whether this session is restricted to the application that began the drag.
 *
 * This is determined based on the UIDragInteraction's delegate's
 * `-dragInteraction:sessionIsRestrictedToDraggingApplication:`.
 */
//@property (nonatomic, readonly, getter=isRestrictedToDraggingApplication) BOOL restrictedToDraggingApplication;

/* Convenience methods to iterate through this session's `items`.
 *
 * Returns true if any of the session's items conforms to any of the specified UTIs.
 */
- (BOOL)hasItemsConformingToTypeIdentifiers:(NSArray<NSString *> *)typeIdentifiers
{
  __block BOOL result = NO;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, hasItemsConformingToTypeIdentifiers,
    js_value_NSArray<NSString *>(typeIdentifiers));
  return result;
}

/* Returns true if any of the session's items could create any objects of the specified class.
 */
- (BOOL)canLoadObjectsOfClass:(Class<NSItemProviderReading>)aClass
{
  __block BOOL result = NO;
  call_delegate(result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result, canLoadObjectsOfClass,
    js_value_id/* Class<NSItemProviderReading>*/(aClass));
  return result;
}

@end
