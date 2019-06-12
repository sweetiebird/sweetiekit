//
//  NUIBezierPath.h
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIBezierPath_h
#define NUIBezierPath_h    

#include "NNSObject.h"

#define js_value_UIBezierPath(x) js_value_wrapper(x, UIBezierPath)
#define to_value_UIBezierPath(x) to_value_wrapper(x, UIBezierPath)
#define is_value_UIBezierPath(x) is_value_wrapper(x, UIBezierPath)

// UIKit constants

#define js_value_UIRectCorner(x) JS_OPTS(UIRectCorner, NSUInteger, x)
#define to_value_UIRectCorner(x) TO_OPTS(UIRectCorner, NSUInteger, x)
#define is_value_UIRectCorner(x) IS_OPTS(UIRectCorner, NSUInteger, x)

#define js_value_CGLineJoin(x) JS_ENUM(CGLineJoin, int32_t, x)
#define to_value_CGLineJoin(x) TO_ENUM(CGLineJoin, int32_t, x)
#define is_value_CGLineJoin(x) IS_ENUM(CGLineJoin, int32_t, x)

#define js_value_CGLineCap(x) JS_ENUM(CGLineCap, int32_t, x)
#define to_value_CGLineCap(x) TO_ENUM(CGLineCap, int32_t, x)
#define is_value_CGLineCap(x) IS_ENUM(CGLineCap, int32_t, x)

JS_WRAP_CLASS(UIBezierPath, NSObject);
  JS_STATIC_METHOD(bezierPath);
  JS_STATIC_METHOD(bezierPathWithRect);
  JS_STATIC_METHOD(bezierPathWithOvalInRect);
  JS_STATIC_METHOD(bezierPathWithRoundedRectCornerRadius);
  JS_STATIC_METHOD(bezierPathWithRoundedRectByRoundingCornersCornerRadii);
  JS_STATIC_METHOD(bezierPathWithArcCenterRadiusStartAngleEndAngleClockwise);
  JS_STATIC_METHOD(bezierPathWithCGPath);
  JS_STATIC_METHOD(init);
  JS_STATIC_METHOD(initWithCoder);
  JS_METHOD(moveToPoint);
  JS_METHOD(addLineToPoint);
  JS_METHOD(addCurveToPointControlPoint1_controlPoint2);
  JS_METHOD(addQuadCurveToPointControlPoint);
  JS_METHOD(addArcWithCenterRadiusStartAngleEndAngleClockwise);
  JS_METHOD(closePath);
  JS_METHOD(removeAllPoints);
  JS_METHOD(appendPath);
  JS_METHOD(bezierPathByReversingPath);
  JS_METHOD(applyTransform);
  JS_METHOD(containsPoint);
  JS_METHOD(setLineDashCountPhase);
  JS_METHOD(getLineDashCountPhase);
  JS_METHOD(fill);
  JS_METHOD(stroke);
  JS_METHOD(fillWithBlendModeAlpha);
  JS_METHOD(strokeWithBlendModeAlpha);
  JS_METHOD(addClip);
  JS_PROP(CGPath);
  JS_PROP_READONLY(isEmpty);
  JS_PROP_READONLY(bounds);
  JS_PROP_READONLY(currentPoint);
  JS_PROP(lineWidth);
  JS_PROP(lineCapStyle);
  JS_PROP(lineJoinStyle);
  JS_PROP(miterLimit);
  JS_PROP(flatness);
  JS_PROP(usesEvenOddFillRule);
JS_WRAP_CLASS_END(UIBezierPath);

#endif /* NUIBezierPath_h */
