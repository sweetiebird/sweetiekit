//
//  UIBezierPath.mm
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIBezierPath.h"

#define instancetype UIBezierPath
#define js_value_instancetype js_value_UIBezierPath

NUIBezierPath::NUIBezierPath() {}
NUIBezierPath::~NUIBezierPath() {}

JS_INIT_CLASS(UIBezierPath, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(moveToPoint);
  JS_ASSIGN_PROTO_METHOD(addLineToPoint);
  JS_ASSIGN_PROTO_METHOD(addCurveToPointControlPoint1_controlPoint2);
  JS_ASSIGN_PROTO_METHOD(addQuadCurveToPointControlPoint);
  JS_ASSIGN_PROTO_METHOD(addArcWithCenterRadiusStartAngleEndAngleClockwise);
  JS_ASSIGN_PROTO_METHOD(closePath);
  JS_ASSIGN_PROTO_METHOD(removeAllPoints);
  JS_ASSIGN_PROTO_METHOD(appendPath);
  JS_ASSIGN_PROTO_METHOD(bezierPathByReversingPath);
  JS_ASSIGN_PROTO_METHOD(applyTransform);
  JS_ASSIGN_PROTO_METHOD(containsPoint);
  JS_ASSIGN_PROTO_METHOD(setLineDashCountPhase);
  JS_ASSIGN_PROTO_METHOD(getLineDashCountPhase);
  JS_ASSIGN_PROTO_METHOD(fill);
  JS_ASSIGN_PROTO_METHOD(stroke);
  JS_ASSIGN_PROTO_METHOD(fillWithBlendModeAlpha);
  JS_ASSIGN_PROTO_METHOD(strokeWithBlendModeAlpha);
  JS_ASSIGN_PROTO_METHOD(addClip);
  JS_ASSIGN_PROTO_PROP(CGPath);
  JS_ASSIGN_PROTO_PROP_READONLY(isEmpty);
  JS_ASSIGN_PROTO_PROP_READONLY(bounds);
  JS_ASSIGN_PROTO_PROP_READONLY(currentPoint);
  JS_ASSIGN_PROTO_PROP(lineWidth);
  JS_ASSIGN_PROTO_PROP(lineCapStyle);
  JS_ASSIGN_PROTO_PROP(lineJoinStyle);
  JS_ASSIGN_PROTO_PROP(miterLimit);
  JS_ASSIGN_PROTO_PROP(flatness);
  JS_ASSIGN_PROTO_PROP(usesEvenOddFillRule);
  // static members (ctor)
  JS_INIT_CTOR(UIBezierPath, NSObject);
  JS_ASSIGN_STATIC_METHOD(bezierPath);
  JS_ASSIGN_STATIC_METHOD(bezierPathWithRect);
  JS_ASSIGN_STATIC_METHOD(bezierPathWithOvalInRect);
  JS_ASSIGN_STATIC_METHOD(bezierPathWithRoundedRectCornerRadius);
  JS_ASSIGN_STATIC_METHOD(bezierPathWithRoundedRectByRoundingCornersCornerRadii);
  JS_ASSIGN_STATIC_METHOD(bezierPathWithArcCenterRadiusStartAngleEndAngleClockwise);
  JS_ASSIGN_STATIC_METHOD(bezierPathWithCGPath);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  
  // constants

//typedef NS_OPTIONS(NSUInteger, UIRectCorner)
{
  JS_ASSIGN_ENUM(UIRectCornerTopLeft, NSUInteger);
  JS_ASSIGN_ENUM(UIRectCornerTopRight, NSUInteger);
  JS_ASSIGN_ENUM(UIRectCornerBottomLeft, NSUInteger);
  JS_ASSIGN_ENUM(UIRectCornerBottomRight, NSUInteger);
  JS_ASSIGN_ENUM(UIRectCornerAllCorners, NSUInteger);
};

/* Line join styles. */

//typedef CF_ENUM(int32_t, CGLineJoin)
{
    JS_ASSIGN_ENUM(kCGLineJoinMiter, int32_t);
    JS_ASSIGN_ENUM(kCGLineJoinRound, int32_t);
    JS_ASSIGN_ENUM(kCGLineJoinBevel, int32_t);
};

/* Line cap styles. */

//typedef CF_ENUM(int32_t, CGLineCap)
{
    JS_ASSIGN_ENUM(kCGLineCapButt, int32_t);
    JS_ASSIGN_ENUM(kCGLineCapRound, int32_t);
    JS_ASSIGN_ENUM(kCGLineCapSquare, int32_t);
};

JS_INIT_CLASS_END(UIBezierPath, NSObject);

NAN_METHOD(NUIBezierPath::New) {
  JS_RECONSTRUCT(UIBezierPath);

  Local<Object> obj = info.This();

  NUIBezierPath *ui = new NUIBezierPath();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIBezierPath *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIBezierPath alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIBezierPath::bezierPath) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([UIBezierPath bezierPath]));
  }
}

NAN_METHOD(NUIBezierPath::bezierPathWithRect) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_instancetype([UIBezierPath bezierPathWithRect: rect]));
  }
}

NAN_METHOD(NUIBezierPath::bezierPathWithOvalInRect) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_instancetype([UIBezierPath bezierPathWithOvalInRect: rect]));
  }
}

NAN_METHOD(NUIBezierPath::bezierPathWithRoundedRectCornerRadius) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(CGFloat, cornerRadius);
    JS_SET_RETURN(js_value_instancetype([UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: cornerRadius]));
  }
}

NAN_METHOD(NUIBezierPath::bezierPathWithRoundedRectByRoundingCornersCornerRadii) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(UIRectCorner, corners);
    declare_value(CGSize, cornerRadii);
    JS_SET_RETURN(js_value_instancetype([UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: corners cornerRadii: cornerRadii]));
  }
}

NAN_METHOD(NUIBezierPath::bezierPathWithArcCenterRadiusStartAngleEndAngleClockwise) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, center);
    declare_value(CGFloat, radius);
    declare_value(CGFloat, startAngle);
    declare_value(CGFloat, endAngle);
    declare_value(BOOL, clockwise);
    JS_SET_RETURN(js_value_instancetype([UIBezierPath bezierPathWithArcCenter: center radius: radius startAngle: startAngle endAngle: endAngle clockwise: clockwise]));
  }
}

NAN_METHOD(NUIBezierPath::bezierPathWithCGPath) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPathRef, CGPath);
    JS_SET_RETURN(js_value_instancetype([UIBezierPath bezierPathWithCGPath: CGPath]));
  }
}

NAN_METHOD(NUIBezierPath::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UIBezierPath alloc] init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIBezierPath::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUIBezierPath::moveToPoint) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    [self moveToPoint: point];
  }
}

NAN_METHOD(NUIBezierPath::addLineToPoint) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    [self addLineToPoint: point];
  }
}

NAN_METHOD(NUIBezierPath::addCurveToPointControlPoint1_controlPoint2) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, endPoint);
    declare_value(CGPoint, controlPoint1);
    declare_value(CGPoint, controlPoint2);
    [self addCurveToPoint: endPoint controlPoint1: controlPoint1 controlPoint2: controlPoint2];
  }
}

NAN_METHOD(NUIBezierPath::addQuadCurveToPointControlPoint) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, endPoint);
    declare_value(CGPoint, controlPoint);
    [self addQuadCurveToPoint: endPoint controlPoint: controlPoint];
  }
}

NAN_METHOD(NUIBezierPath::addArcWithCenterRadiusStartAngleEndAngleClockwise) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, center);
    declare_value(CGFloat, radius);
    declare_value(CGFloat, startAngle);
    declare_value(CGFloat, endAngle);
    declare_value(BOOL, clockwise);
    [self addArcWithCenter: center radius: radius startAngle: startAngle endAngle: endAngle clockwise: clockwise];
  }
}

NAN_METHOD(NUIBezierPath::closePath) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    [self closePath];
  }
}

NAN_METHOD(NUIBezierPath::removeAllPoints) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    [self removeAllPoints];
  }
}

NAN_METHOD(NUIBezierPath::appendPath) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIBezierPath, bezierPath);
    [self appendPath: bezierPath];
  }
}

NAN_METHOD(NUIBezierPath::bezierPathByReversingPath) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBezierPath([self bezierPathByReversingPath]));
  }
}

NAN_METHOD(NUIBezierPath::applyTransform) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGAffineTransform, transform);
    [self applyTransform: transform];
  }
}

NAN_METHOD(NUIBezierPath::containsPoint) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_BOOL([self containsPoint: point]));
  }
}

NAN_METHOD(NUIBezierPath::setLineDashCountPhase) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSData, pattern);
    declare_value(NSInteger, count);
    declare_value(CGFloat, phase);
    const CGFloat* lineDash = nullptr;
    if (pattern) {
      lineDash = (const CGFloat*)[pattern bytes];
    }
    [self setLineDash: lineDash count: count phase: phase];
  }
}

NAN_METHOD(NUIBezierPath::getLineDashCountPhase) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_nullable_pointer(CGFloat, pattern);
    declare_nullable_pointer(NSInteger, count);
    declare_nullable_pointer(CGFloat, phase);
    [self getLineDash: pattern count: count phase: phase];
    #endif
  }
}

NAN_METHOD(NUIBezierPath::fill) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    [self fill];
  }
}

NAN_METHOD(NUIBezierPath::stroke) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    [self stroke];
  }
}

NAN_METHOD(NUIBezierPath::fillWithBlendModeAlpha) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGBlendMode, blendMode);
    declare_value(CGFloat, alpha);
    [self fillWithBlendMode: blendMode alpha: alpha];
  }
}

NAN_METHOD(NUIBezierPath::strokeWithBlendModeAlpha) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGBlendMode, blendMode);
    declare_value(CGFloat, alpha);
    [self strokeWithBlendMode: blendMode alpha: alpha];
  }
}

NAN_METHOD(NUIBezierPath::addClip) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    [self addClip];
  }
}

NAN_GETTER(NUIBezierPath::CGPathGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPathRef([self CGPath]));
  }
}

NAN_SETTER(NUIBezierPath::CGPathSetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPathRef, input);
    [self setCGPath: input];
  }
}

NAN_GETTER(NUIBezierPath::isEmptyGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEmpty]));
  }
}

NAN_GETTER(NUIBezierPath::boundsGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self bounds]));
  }
}

NAN_GETTER(NUIBezierPath::currentPointGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self currentPoint]));
  }
}

NAN_GETTER(NUIBezierPath::lineWidthGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self lineWidth]));
  }
}

NAN_SETTER(NUIBezierPath::lineWidthSetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setLineWidth: input];
  }
}

NAN_GETTER(NUIBezierPath::lineCapStyleGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGLineCap([self lineCapStyle]));
  }
}

NAN_SETTER(NUIBezierPath::lineCapStyleSetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGLineCap, input);
    [self setLineCapStyle: input];
  }
}

NAN_GETTER(NUIBezierPath::lineJoinStyleGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGLineJoin([self lineJoinStyle]));
  }
}

NAN_SETTER(NUIBezierPath::lineJoinStyleSetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGLineJoin, input);
    [self setLineJoinStyle: input];
  }
}

NAN_GETTER(NUIBezierPath::miterLimitGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self miterLimit]));
  }
}

NAN_SETTER(NUIBezierPath::miterLimitSetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMiterLimit: input];
  }
}

NAN_GETTER(NUIBezierPath::flatnessGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self flatness]));
  }
}

NAN_SETTER(NUIBezierPath::flatnessSetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFlatness: input];
  }
}

NAN_GETTER(NUIBezierPath::usesEvenOddFillRuleGetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self usesEvenOddFillRule]));
  }
}

NAN_SETTER(NUIBezierPath::usesEvenOddFillRuleSetter) {
  JS_UNWRAP(UIBezierPath, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUsesEvenOddFillRule: input];
  }
}
