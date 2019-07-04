//
//  NUIDropSession.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDropSession.h"

#define instancetype UIDropSession
#define js_value_instancetype js_value_UIDropSession

NUIDropSession::NUIDropSession() {}
NUIDropSession::~NUIDropSession() {}

JS_INIT_PROTOCOL(UIDropSession, UIDragDropSession);
  JS_ASSIGN_PROTO_PROP(loadObjectsOfClassCompletion);
  JS_ASSIGN_PROTO_PROP_READONLY(localDragSession);
  JS_ASSIGN_PROTO_PROP(progressIndicatorStyle);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDropSession, UIDragDropSession);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, UIDropSessionProgressIndicatorStyle) {
    JS_ASSIGN_ENUM(UIDropSessionProgressIndicatorStyleNone, NSUInteger); //       // No indicator is displayed
    JS_ASSIGN_ENUM(UIDropSessionProgressIndicatorStyleDefault, NSUInteger); //    // A default indicator is displayed
  //} API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(watchos, tvos);

JS_INIT_PROTOCOL_END(UIDropSession, UIDragDropSession);


NAN_METHOD(NUIDropSession::New) {
  JS_RECONSTRUCT_PROTOCOL(UIDropSession);
  @autoreleasepool {
    id<UIDropSession> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIDropSession>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIDropSession> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIDropSession, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIDropSessionType alloc] init];
    }
    if (self) {
      NUIDropSession *wrapper = new NUIDropSession();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDropSession::New: invalid arguments");
    }
  }
}

#include "NUIDragSession.h"

NAN_GETTER(NUIDropSession::localDragSessionGetter) {
  JS_UNWRAP_PROTOCOL(UIDropSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDragSession([self localDragSession]));
  }
}

NAN_GETTER(NUIDropSession::progressIndicatorStyleGetter) {
  JS_UNWRAP_PROTOCOL(UIDropSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDropSessionProgressIndicatorStyle([self progressIndicatorStyle]));
  }
}

NAN_SETTER(NUIDropSession::progressIndicatorStyleSetter) {
  JS_UNWRAP_PROTOCOL(UIDropSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIDropSessionProgressIndicatorStyle, input);
    [self setProgressIndicatorStyle: input];
  }
}


DELEGATE_PROTOCOL_PROP(UIDropSession, loadObjectsOfClassCompletion);

@implementation UIDropSessionType

/* The `UIDragSession` that corresponds to this `UIDropSession`.
 * If the drag was started in a different app, this is nil.
 */
//@property (nonatomic, readonly, nullable) id<UIDragSession> localDragSession;

/* The kind of progress and cancellation UI that UIKit will display
 * if handling this session's drop takes a significant amount of time.
 *
 * The default value is UIDropSessionProgressIndicatorStyleDefault,
 * meaning that some progress UI will be shown. If you show your own
 * progress indicator, hide the system progress UI by setting this
 * property to UIDropSessionProgressIndicatorStyleNone.
 */
//@property (nonatomic) UIDropSessionProgressIndicatorStyle progressIndicatorStyle;

/* A convenience method that can be used only during the UIDropInteractionDelegate's
 * implementation of `-dropInteraction:performDrop:`.
 * Asynchronously instantiates objects of the provided class for each
 * drag item that can do so. The completion handler is called on the
 * main queue, with an array of all objects that were created, in the
 * same order as `items`.
 * The progress returned is an aggregate of the progress for all objects
 * that are loaded.
 */
#if TODO
- (NSProgress *)loadObjectsOfClass:(Class<NSItemProviderReading>)aClass completion:(void(^)(NSArray<__kindof id<NSItemProviderReading>> *objects))completion
{
}
#endif

@end
