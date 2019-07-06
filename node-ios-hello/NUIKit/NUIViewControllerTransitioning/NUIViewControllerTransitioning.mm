//
//  NUIViewControllerTransitioning.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewControllerTransitioning.h"

#include "NUIViewControllerTransitionCoordinatorContext.h"

JS_INIT_GLOBALS(UIViewControllerTransitioning);
  // global values (exports)

#if UIKIT_STRING_ENUMS
  JS_ASSIGN_ENUM(UITransitionContextFromViewControllerKey, UITransitionContextViewControllerKey); //  NS_SWIFT_NAME(from) NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UITransitionContextToViewControllerKey, UITransitionContextViewControllerKey); //  NS_SWIFT_NAME(to) NS_AVAILABLE_IOS(7_0);

  JS_ASSIGN_ENUM(UITransitionContextFromViewKey, UITransitionContextViewKey); //  NS_SWIFT_NAME(from) NS_AVAILABLE_IOS(8_0);
  JS_ASSIGN_ENUM(UITransitionContextToViewKey, UITransitionContextViewKey); //  NS_SWIFT_NAME(to) NS_AVAILABLE_IOS(8_0);
#else
  JS_ASSIGN_ENUM(UITransitionContextFromViewControllerKey, UITransitionContextViewControllerKey); //  NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UITransitionContextToViewControllerKey, UITransitionContextViewControllerKey); //  NS_AVAILABLE_IOS(7_0);

  JS_ASSIGN_ENUM(UITransitionContextFromViewKey, UITransitionContextViewKey); //  NS_AVAILABLE_IOS(8_0);
  JS_ASSIGN_ENUM(UITransitionContextToViewKey, UITransitionContextViewKey); //  NS_AVAILABLE_IOS(8_0);
#endif

JS_INIT_GLOBALS_END(UIViewControllerTransitioning);
