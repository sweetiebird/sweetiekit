//
//  NUIBarCommon.h
//
//  Created by Shawn Presser on 6/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIBarCommon_h
#define NUIBarCommon_h

#include "NNSObject.h"

#define js_value_UIBarCommon(x) js_value_wrapper(x, UIBarCommon)
#define to_value_UIBarCommon(x) to_value_wrapper(x, UIBarCommon)
#define is_value_UIBarCommon(x) is_value_wrapper(x, UIBarCommon)

#define js_value_SCNTransparencyMode(x) JS_ENUM(SCNTransparencyMode, NSInteger, x)
#define to_value_SCNTransparencyMode(x) TO_ENUM(SCNTransparencyMode, NSInteger, x)
#define is_value_SCNTransparencyMode(x) IS_ENUM(SCNTransparencyMode, NSInteger, x)

#define js_value_SCNBlendMode(x) JS_ENUM(SCNBlendMode, NSInteger, x)
#define to_value_SCNBlendMode(x) TO_ENUM(SCNBlendMode, NSInteger, x)
#define is_value_SCNBlendMode(x) IS_ENUM(SCNBlendMode, NSInteger, x)

#define js_value_SCNColorMask(x) JS_ENUM(SCNColorMask, NSInteger, x)
#define to_value_SCNColorMask(x) TO_ENUM(SCNColorMask, NSInteger, x)
#define is_value_SCNColorMask(x) IS_ENUM(SCNColorMask, NSInteger, x)

#define js_value_UIBarMetrics(x) JS_ENUM(UIBarMetrics, NSInteger, x)
#define to_value_UIBarMetrics(x) TO_ENUM(UIBarMetrics, NSInteger, x)
#define is_value_UIBarMetrics(x) IS_ENUM(UIBarMetrics, NSInteger, x)

#define js_value_UIBarPosition(x) JS_ENUM(UIBarPosition, NSInteger, x)
#define to_value_UIBarPosition(x) TO_ENUM(UIBarPosition, NSInteger, x)
#define is_value_UIBarPosition(x) IS_ENUM(UIBarPosition, NSInteger, x)

#define js_value_UIToolbarPosition js_value_UIBarPosition
#define to_value_UIToolbarPosition to_value_UIBarPosition
#define is_value_UIToolbarPosition is_value_UIBarPosition

#define js_value_UIToolbarPositionAny js_value_UIBarPositionAny
#define to_value_UIToolbarPositionAny to_value_UIBarPositionAny
#define is_value_UIToolbarPositionAny is_value_UIBarPositionAny

#define js_value_UIToolbarPositionBottom js_value_UIBarPositionBottom
#define to_value_UIToolbarPositionBottom to_value_UIBarPositionBottom
#define is_value_UIToolbarPositionBottom is_value_UIBarPositionBottom

#define js_value_UIToolbarPositionTop js_value_UIBarPositionTop
#define to_value_UIToolbarPositionTop to_value_UIBarPositionTop
#define is_value_UIToolbarPositionTop is_value_UIBarPositionTop

JS_WRAP_CLASS(UIBarCommon, NSObject);
JS_WRAP_CLASS_END(UIBarCommon);

#ifdef __OBJC__
@interface UIBarCommon : NSObject
@end
#endif

#endif /* NUIBarCommon_h */
