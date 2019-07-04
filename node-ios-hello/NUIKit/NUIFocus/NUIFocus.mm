//
//  NUIFocus.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIFocus.h"

#include "NNSNotification.h"

JS_INIT_GLOBALS(UIFocus);
  // global values (exports)

  //typedef NS_OPTIONS(NSUInteger, UIFocusHeading) {
    JS_ASSIGN_ENUM(UIFocusHeadingNone, NSUInteger); //           = 0,
    JS_ASSIGN_ENUM(UIFocusHeadingUp, NSUInteger); //             = 1 << 0,
    JS_ASSIGN_ENUM(UIFocusHeadingDown, NSUInteger); //           = 1 << 1,
    JS_ASSIGN_ENUM(UIFocusHeadingLeft, NSUInteger); //           = 1 << 2,
    JS_ASSIGN_ENUM(UIFocusHeadingRight, NSUInteger); //          = 1 << 3,
    JS_ASSIGN_ENUM(UIFocusHeadingNext, NSUInteger); //           = 1 << 4,
    JS_ASSIGN_ENUM(UIFocusHeadingPrevious, NSUInteger); //       = 1 << 5,
  //} NS_ENUM_AVAILABLE_IOS(9_0);

  JS_ASSIGN_ENUM(UIFocusDidUpdateNotification, NSNotificationName); //  API_AVAILABLE(ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(UIFocusMovementDidFailNotification, NSNotificationName); //  API_AVAILABLE(ios(11.0), tvos(11.0));

  JS_ASSIGN_ENUM(UIFocusUpdateContextKey, NSString); //  API_AVAILABLE(ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(UIFocusUpdateAnimationCoordinatorKey, NSString); //  API_AVAILABLE(ios(11.0), tvos(11.0));

#if TARGET_OS_TVOS
  JS_ASSIGN_ENUM(UIFocusSoundIdentifierNone, UIFocusSoundIdentifier); //  API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios, watchos);
  JS_ASSIGN_ENUM(UIFocusSoundIdentifierDefault, UIFocusSoundIdentifier); //  API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios, watchos);
#endif

JS_INIT_GLOBALS_END(UIFocus);
