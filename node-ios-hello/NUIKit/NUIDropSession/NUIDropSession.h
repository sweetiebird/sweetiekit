//
//  NUIDropSession.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDropSession_h
#define NUIDropSession_h    

#include "NUIDragDropSession.h"

#define js_value_UIDropSession(x) js_protocol_wrapper(x, UIDropSession)
#define to_value_UIDropSession(x) to_protocol_wrapper(x, UIDropSession)
#define is_value_UIDropSession(x) is_protocol_wrapper(x, UIDropSession)

#define js_value_UIDropSessionProgressIndicatorStyle(x) JS_ENUM(UIDropSessionProgressIndicatorStyle, NSUInteger, x)
#define to_value_UIDropSessionProgressIndicatorStyle(x) TO_ENUM(UIDropSessionProgressIndicatorStyle, NSUInteger, x)
#define is_value_UIDropSessionProgressIndicatorStyle(x) IS_ENUM(UIDropSessionProgressIndicatorStyle, NSUInteger, x)

JS_WRAP_PROTOCOL(UIDropSession, UIDragDropSession);
  JS_PROP(loadObjectsOfClassCompletion);
  JS_PROP_READONLY(localDragSession);
  JS_PROP(progressIndicatorStyle);
JS_WRAP_PROTOCOL_END(UIDropSession, UIDragDropSession);

#if __OBJC__
@interface UIDropSessionType : UIDragDropSessionType<UIDropSession>

/* The `UIDragSession` that corresponds to this `UIDropSession`.
 * If the drag was started in a different app, this is nil.
 */
@property (nonatomic, readonly, nullable) id<UIDragSession> localDragSession;

/* The kind of progress and cancellation UI that UIKit will display
 * if handling this session's drop takes a significant amount of time.
 *
 * The default value is UIDropSessionProgressIndicatorStyleDefault,
 * meaning that some progress UI will be shown. If you show your own
 * progress indicator, hide the system progress UI by setting this
 * property to UIDropSessionProgressIndicatorStyleNone.
 */
@property (nonatomic) UIDropSessionProgressIndicatorStyle progressIndicatorStyle;

/* A convenience method that can be used only during the UIDropInteractionDelegate's
 * implementation of `-dropInteraction:performDrop:`.
 * Asynchronously instantiates objects of the provided class for each
 * drag item that can do so. The completion handler is called on the
 * main queue, with an array of all objects that were created, in the
 * same order as `items`.
 * The progress returned is an aggregate of the progress for all objects
 * that are loaded.
 */
//- (NSProgress *)loadObjectsOfClass:(Class<NSItemProviderReading>)aClass completion:(void(^)(NSArray<__kindof id<NSItemProviderReading>> *objects))completion;

@end
#endif

#endif /* NUIDropSession_h */
