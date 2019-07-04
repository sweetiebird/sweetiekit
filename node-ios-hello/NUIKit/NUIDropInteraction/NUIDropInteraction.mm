//
//  NUIDropInteraction.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDropInteraction.h"

#define instancetype UIDropInteraction
#define js_value_instancetype js_value_UIDropInteraction

NUIDropInteraction::NUIDropInteraction() {}
NUIDropInteraction::~NUIDropInteraction() {}

JS_INIT_CLASS(UIDropInteraction, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithDelegate);
  JS_ASSIGN_PROTO_PROP_READONLY(delegate);
  JS_ASSIGN_PROTO_PROP(allowsSimultaneousDropSessions);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDropInteraction, NSObject);
  // constant values (exports)

  /* The UIDropInteraction's delegate uses a UIDropOperation to tell the system
   * what operation it will perform if the user drops.
   */
  //typedef NS_ENUM(NSUInteger, UIDropOperation) {
    /* Operations that do NOT cause data transfer.
     *
     * If the user drops here, the UIDropInteraction's -dropInteraction:performDrop:
     * method will NOT be called.
     */

    /* The drag will be cancelled.
     */
    JS_ASSIGN_ENUM(UIDropOperationCancel, NSInteger); //    = 0,

    /* The drag will be cancelled.
     * Use this operation to signal that this interaction would *normally* perform
     * a different operation, but that it explicitly forbids a drop at this specific
     * time and place.
     * This may cause a special symbol to be displayed on the drag image.
     */
    JS_ASSIGN_ENUM(UIDropOperationForbidden, NSInteger); //  = 1,

    /* Operations that cause data transfer.
     *
     * If the user drops here, the UIDropInteraction's -dropInteraction:performDrop:
     * method will be called.
     */

    /* The data represented by the drag item(s) will be copied.
     * This is the most common operation to use.
     */
    JS_ASSIGN_ENUM(UIDropOperationCopy, NSInteger); //       = 2,

    /* The data represented by the drag item(s) will be moved.
     *
     * You may use this only if UIDropSession's allowsMoveOperation is true.
     * Otherwise it will be treated as UIDropOperationCancel.
     *
     * Note that the system does not give any special meaning to this operation.
     * The delegates of both the UIDragInteraction and UIDropInteraction must
     * cooperate to produce the correct result. For instance, the UIDropInteraction's
     * delegate might insert the data in the new location, and the UIDragInteraction's
     * delegate might remove the data from the old location.
     */
    JS_ASSIGN_ENUM(UIDropOperationMove, NSInteger); //       = 3,
  //} API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(watchos, tvos);

JS_INIT_CLASS_END(UIDropInteraction, NSObject);

NAN_METHOD(NUIDropInteraction::New) {
  JS_RECONSTRUCT(UIDropInteraction);
  @autoreleasepool {
    UIDropInteraction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDropInteraction *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIDropInteraction *wrapper = new NUIDropInteraction();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDropInteraction::New: invalid arguments");
    }
  }
}

#include "NUIDropInteractionDelegate.h"

NAN_METHOD(NUIDropInteraction::initWithDelegate) {
  JS_UNWRAP_OR_ALLOC(UIDropInteraction, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(UIDropInteractionDelegate, delegate);
    JS_SET_RETURN(js_value_instancetype([self initWithDelegate: delegate]));
  }
}

NAN_GETTER(NUIDropInteraction::delegateGetter) {
  JS_UNWRAP(UIDropInteraction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDropInteractionDelegate([self delegate]));
  }
}

NAN_GETTER(NUIDropInteraction::allowsSimultaneousDropSessionsGetter) {
  JS_UNWRAP(UIDropInteraction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsSimultaneousDropSessions]));
  }
}

NAN_SETTER(NUIDropInteraction::allowsSimultaneousDropSessionsSetter) {
  JS_UNWRAP(UIDropInteraction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsSimultaneousDropSessions: input];
  }
}
