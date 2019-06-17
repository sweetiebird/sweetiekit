//
//  NUISegmentedControl.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISegmentedControl_h
#define NUISegmentedControl_h    

#include "NUIControl.h"

#define js_value_UISegmentedControl(x) js_value_wrapper(x, UISegmentedControl)
#define to_value_UISegmentedControl(x) to_value_wrapper(x, UISegmentedControl)
#define is_value_UISegmentedControl(x) is_value_wrapper(x, UISegmentedControl)

#define js_value_UISegmentedControlStyle(x) JS_ENUM(UISegmentedControlStyle, NSInteger, x)
#define to_value_UISegmentedControlStyle(x) TO_ENUM(UISegmentedControlStyle, NSInteger, x)
#define is_value_UISegmentedControlStyle(x) IS_ENUM(UISegmentedControlStyle, NSInteger, x)

#define js_value_UISegmentedControlSegment(x) JS_ENUM(UISegmentedControlSegment, NSInteger, x)
#define to_value_UISegmentedControlSegment(x) TO_ENUM(UISegmentedControlSegment, NSInteger, x)
#define is_value_UISegmentedControlSegment(x) IS_ENUM(UISegmentedControlSegment, NSInteger, x)

JS_WRAP_CLASS(UISegmentedControl, UIControl);
  JS_STATIC_METHOD(initWithItems);
  JS_METHOD(insertSegmentWithTitleAtIndexAnimated);
  JS_METHOD(insertSegmentWithImageAtIndexAnimated);
  JS_METHOD(removeSegmentAtIndexAnimated);
  JS_METHOD(removeAllSegments);
  JS_METHOD(setTitleForSegmentAtIndex);
  JS_METHOD(titleForSegmentAtIndex);
  JS_METHOD(setImageForSegmentAtIndex);
  JS_METHOD(imageForSegmentAtIndex);
  JS_METHOD(setWidthForSegmentAtIndex);
  JS_METHOD(widthForSegmentAtIndex);
  JS_METHOD(setContentOffsetForSegmentAtIndex);
  JS_METHOD(contentOffsetForSegmentAtIndex);
  JS_METHOD(setEnabledForSegmentAtIndex);
  JS_METHOD(isEnabledForSegmentAtIndex);
  JS_METHOD(setBackgroundImageForStateBarMetrics);
  JS_METHOD(backgroundImageForStateBarMetrics);
  JS_METHOD(setDividerImageForLeftSegmentStateRightSegmentStateBarMetrics);
  JS_METHOD(dividerImageForLeftSegmentStateRightSegmentStateBarMetrics);
  JS_METHOD(setTitleTextAttributesForState);
  JS_METHOD(titleTextAttributesForState);
  JS_METHOD(setContentPositionAdjustmentForSegmentTypeBarMetrics);
  JS_METHOD(contentPositionAdjustmentForSegmentTypeBarMetrics);
  JS_PROP(segmentedControlStyle);
  JS_PROP(isMomentary);
  JS_PROP_READONLY(numberOfSegments);
  JS_PROP(apportionsSegmentWidthsByContent);
  JS_PROP(selectedSegmentIndex);
  JS_PROP(tintColor);
JS_WRAP_CLASS_END(UISegmentedControl);

#endif /* NUISegmentedControl_h */
